import '../models/game_state.dart';
import '../models/move.dart';
import '../models/piece.dart';
import '../models/square.dart';

class MoveGenerator {
  const MoveGenerator();

  // ── Public API ──────────────────────────────────────────────────────────────

  List<Move> legalMovesFor(Square sq, GameState state) {
    final piece = state.pieceAt(sq);
    if (piece == null || piece.color != state.turn) return const [];
    return _filterLegal(_pseudoMovesFor(sq, piece, state), state);
  }

  List<Move> allLegalMoves(GameState state) {
    final moves = <Move>[];
    for (int r = 0; r < 8; r++) {
      for (int f = 0; f < 8; f++) {
        final sq = Square(f, r);
        final piece = state.pieceAt(sq);
        if (piece != null && piece.color == state.turn) {
          moves.addAll(legalMovesFor(sq, state));
        }
      }
    }
    return moves;
  }

  bool isInCheck(PieceColor color, GameState state) =>
      _isSquareAttackedBy(_kingSquare(color, state), color.opposite, state);

  bool isSquareAttacked(Square sq, PieceColor byColor, GameState state) =>
      _isSquareAttackedBy(sq, byColor, state);

  // ── Pseudo-move generation (ignores own-king exposure) ───────────────────

  List<Move> _pseudoMovesFor(Square sq, Piece piece, GameState state) {
    return switch (piece.type) {
      PieceType.pawn => _pawnMoves(sq, piece, state),
      PieceType.knight => _knightMoves(sq, piece, state),
      PieceType.bishop => _slidingMoves(sq, piece, state, _diagDirs),
      PieceType.rook => _slidingMoves(sq, piece, state, _straightDirs),
      PieceType.queen => _slidingMoves(sq, piece, state, [
        ..._diagDirs,
        ..._straightDirs,
      ]),
      PieceType.king => _kingMoves(sq, piece, state),
    };
  }

  static const _diagDirs = [(-1, -1), (-1, 1), (1, -1), (1, 1)];
  static const _straightDirs = [(-1, 0), (1, 0), (0, -1), (0, 1)];
  static const _knightDeltas = [
    (-2, -1),
    (-2, 1),
    (-1, -2),
    (-1, 2),
    (1, -2),
    (1, 2),
    (2, -1),
    (2, 1),
  ];

  List<Move> _pawnMoves(Square sq, Piece piece, GameState state) {
    final moves = <Move>[];
    final dir = piece.color == PieceColor.white ? 1 : -1;
    final startRank = piece.color == PieceColor.white ? 1 : 6;
    final promoRank = piece.color == PieceColor.white ? 7 : 0;

    // Single push
    final one = sq.offset(0, dir);
    if (one != null && state.pieceAt(one) == null) {
      if (one.rank == promoRank) {
        for (final t in _promotionTypes) {
          moves.add(
            Move(from: sq, to: one, flag: MoveFlag.promotion, promotionType: t),
          );
        }
      } else {
        moves.add(Move(from: sq, to: one));
        // Double push
        if (sq.rank == startRank) {
          final two = sq.offset(0, dir * 2);
          if (two != null && state.pieceAt(two) == null) {
            moves.add(Move(from: sq, to: two, flag: MoveFlag.doublePawnPush));
          }
        }
      }
    }

    // Captures
    for (final df in [-1, 1]) {
      final cap = sq.offset(df, dir);
      if (cap == null) continue;
      final target = state.pieceAt(cap);
      if (target != null && target.color != piece.color) {
        if (cap.rank == promoRank) {
          for (final t in _promotionTypes) {
            moves.add(
              Move(
                from: sq,
                to: cap,
                flag: MoveFlag.promotion,
                promotionType: t,
                capturedPiece: target,
              ),
            );
          }
        } else {
          moves.add(Move(from: sq, to: cap, capturedPiece: target));
        }
      }
      // En passant
      if (state.enPassantTarget == cap) {
        moves.add(
          Move(
            from: sq,
            to: cap,
            flag: MoveFlag.enPassantCapture,
            capturedPiece: Piece(PieceType.pawn, piece.color.opposite),
          ),
        );
      }
    }

    return moves;
  }

  List<Move> _knightMoves(Square sq, Piece piece, GameState state) {
    final moves = <Move>[];
    for (final (df, dr) in _knightDeltas) {
      final to = sq.offset(df, dr);
      if (to == null) continue;
      final target = state.pieceAt(to);
      if (target != null && target.color == piece.color) continue;
      moves.add(Move(from: sq, to: to, capturedPiece: target));
    }
    return moves;
  }

  List<Move> _slidingMoves(
    Square sq,
    Piece piece,
    GameState state,
    List<(int, int)> dirs,
  ) {
    final moves = <Move>[];
    for (final (df, dr) in dirs) {
      var cur = sq.offset(df, dr);
      while (cur != null) {
        final target = state.pieceAt(cur);
        if (target != null) {
          if (target.color != piece.color) {
            moves.add(Move(from: sq, to: cur, capturedPiece: target));
          }
          break;
        }
        moves.add(Move(from: sq, to: cur));
        cur = cur.offset(df, dr);
      }
    }
    return moves;
  }

  List<Move> _kingMoves(Square sq, Piece piece, GameState state) {
    final moves = <Move>[];
    for (final (df, dr) in [..._diagDirs, ..._straightDirs]) {
      final to = sq.offset(df, dr);
      if (to == null) continue;
      final target = state.pieceAt(to);
      if (target != null && target.color == piece.color) continue;
      moves.add(Move(from: sq, to: to, capturedPiece: target));
    }
    // Castling
    moves.addAll(_castlingMoves(sq, piece, state));
    return moves;
  }

  List<Move> _castlingMoves(Square sq, Piece king, GameState state) {
    final moves = <Move>[];
    if (king.hasMoved) return moves;
    if (isInCheck(king.color, state)) return moves;

    final rank = king.color == PieceColor.white ? 0 : 7;
    final rights = state.castling;

    bool canCastle(bool right, int rookFile, int kingDestFile, MoveFlag flag) {
      if (!right) return false;
      final rookSq = Square(rookFile, rank);
      final rook = state.pieceAt(rookSq);
      if (rook == null || rook.type != PieceType.rook || rook.hasMoved) {
        return false;
      }
      final minF = rookFile < sq.file ? rookFile + 1 : sq.file + 1;
      final maxF = rookFile < sq.file ? sq.file - 1 : rookFile - 1;
      for (int f = minF; f <= maxF; f++) {
        if (state.pieceAtRC(rank, f) != null) return false;
      }
      final step = kingDestFile > sq.file ? 1 : -1;
      for (int f = sq.file; f != kingDestFile + step; f += step) {
        if (_isSquareAttackedBy(Square(f, rank), king.color.opposite, state)) {
          return false;
        }
      }
      return true;
    }

    final (ksRight, qsRight) = king.color == PieceColor.white
        ? (rights.whiteKingside, rights.whiteQueenside)
        : (rights.blackKingside, rights.blackQueenside);

    if (canCastle(ksRight, 7, 6, MoveFlag.castleKingside)) {
      moves.add(
        Move(from: sq, to: Square(6, rank), flag: MoveFlag.castleKingside),
      );
    }
    if (canCastle(qsRight, 0, 2, MoveFlag.castleQueenside)) {
      moves.add(
        Move(from: sq, to: Square(2, rank), flag: MoveFlag.castleQueenside),
      );
    }
    return moves;
  }

  // ── Legal move filtering ─────────────────────────────────────────────────

  List<Move> _filterLegal(List<Move> pseudo, GameState state) {
    final legal = <Move>[];
    for (final move in pseudo) {
      final next = _applyMoveToBoard(move, state);
      final color = state.pieceAt(move.from)!.color;
      if (!isInCheck(color, next)) legal.add(move);
    }
    return legal;
  }

  // ── Attack detection ─────────────────────────────────────────────────────

  bool _isSquareAttackedBy(Square sq, PieceColor byColor, GameState state) {
    // Pawns
    final pawnDir = byColor == PieceColor.white ? 1 : -1;
    for (final df in [-1, 1]) {
      final from = sq.offset(df, -pawnDir);
      if (from != null) {
        final p = state.pieceAt(from);
        if (p != null && p.type == PieceType.pawn && p.color == byColor) {
          return true;
        }
      }
    }
    // Knights
    for (final (df, dr) in _knightDeltas) {
      final from = sq.offset(df, dr);
      if (from != null) {
        final p = state.pieceAt(from);
        if (p != null && p.type == PieceType.knight && p.color == byColor) {
          return true;
        }
      }
    }
    // Sliding diagonals (bishops / queens)
    for (final (df, dr) in _diagDirs) {
      var cur = sq.offset(df, dr);
      while (cur != null) {
        final p = state.pieceAt(cur);
        if (p != null) {
          if (p.color == byColor &&
              (p.type == PieceType.bishop || p.type == PieceType.queen)) {
            return true;
          }
          break;
        }
        cur = cur.offset(df, dr);
      }
    }
    // Sliding straights (rooks / queens)
    for (final (df, dr) in _straightDirs) {
      var cur = sq.offset(df, dr);
      while (cur != null) {
        final p = state.pieceAt(cur);
        if (p != null) {
          if (p.color == byColor &&
              (p.type == PieceType.rook || p.type == PieceType.queen)) {
            return true;
          }
          break;
        }
        cur = cur.offset(df, dr);
      }
    }
    // King
    for (final (df, dr) in [..._diagDirs, ..._straightDirs]) {
      final from = sq.offset(df, dr);
      if (from != null) {
        final p = state.pieceAt(from);
        if (p != null && p.type == PieceType.king && p.color == byColor) {
          return true;
        }
      }
    }
    return false;
  }

  Square _kingSquare(PieceColor color, GameState state) {
    for (int r = 0; r < 8; r++) {
      for (int f = 0; f < 8; f++) {
        final p = state.board[r][f];
        if (p != null && p.type == PieceType.king && p.color == color) {
          return Square(f, r);
        }
      }
    }
    throw StateError('No king found for $color');
  }

  // ── Apply move to a temporary board (no history updates) ─────────────────

  GameState _applyMoveToBoard(Move move, GameState state) {
    final board = [
      for (final row in state.board) [...row],
    ];
    final piece = board[move.from.rank][move.from.file]!;
    final moved = piece.copyWith(hasMoved: true);

    board[move.from.rank][move.from.file] = null;

    switch (move.flag) {
      case MoveFlag.enPassantCapture:
        final capturedRank = move.from.rank;
        board[capturedRank][move.to.file] = null;
        board[move.to.rank][move.to.file] = moved;
      case MoveFlag.castleKingside:
        board[move.to.rank][move.to.file] = moved;
        final rook = board[move.from.rank][7]!;
        board[move.from.rank][7] = null;
        board[move.from.rank][5] = rook.copyWith(hasMoved: true);
      case MoveFlag.castleQueenside:
        board[move.to.rank][move.to.file] = moved;
        final rook = board[move.from.rank][0]!;
        board[move.from.rank][0] = null;
        board[move.from.rank][3] = rook.copyWith(hasMoved: true);
      case MoveFlag.promotion:
        board[move.to.rank][move.to.file] = Piece(
          move.promotionType!,
          piece.color,
          hasMoved: true,
        );
      default:
        board[move.to.rank][move.to.file] = moved;
    }

    return state.copyWith(board: board);
  }

  static const _promotionTypes = [
    PieceType.queen,
    PieceType.rook,
    PieceType.bishop,
    PieceType.knight,
  ];
}

extension on PieceColor {
  PieceColor get opposite =>
      this == PieceColor.white ? PieceColor.black : PieceColor.white;
}
