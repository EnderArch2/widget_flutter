import '../models/game_state.dart';
import '../models/move.dart';
import '../models/piece.dart';
import '../models/square.dart';
import 'move_generator.dart';
import 'notation.dart';

class ChessEngine {
  ChessEngine() : _gen = const MoveGenerator();

  final MoveGenerator _gen;

  List<Move> legalMovesFor(Square sq, GameState state) =>
      _gen.legalMovesFor(sq, state);

  List<Move> allLegalMoves(GameState state) => _gen.allLegalMoves(state);

  bool isInCheck(PieceColor color, GameState state) =>
      _gen.isInCheck(color, state);

  // ── Apply a fully-legal move ─────────────────────────────────────────────

  GameState applyMove(Move move, GameState state) {
    assert(state.status == GameStatus.playing);

    final board = [
      for (final row in state.board) [...row],
    ];
    final piece = board[move.from.rank][move.from.file]!;
    final moved = piece.copyWith(hasMoved: true);

    var castling = state.castling;
    Square? enPassantTarget;

    // Apply the move
    board[move.from.rank][move.from.file] = null;

    switch (move.flag) {
      case MoveFlag.enPassantCapture:
        board[move.from.rank][move.to.file] = null;
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
      case MoveFlag.doublePawnPush:
        board[move.to.rank][move.to.file] = moved;
        final epRank = (move.from.rank + move.to.rank) ~/ 2;
        enPassantTarget = Square(move.from.file, epRank);
      case MoveFlag.promotion:
        board[move.to.rank][move.to.file] = Piece(
          move.promotionType!,
          piece.color,
          hasMoved: true,
        );
      default:
        board[move.to.rank][move.to.file] = moved;
    }

    // Update castling rights
    castling = _updateCastlingRights(castling, move, piece);

    // Clocks
    final isCapture = move.capturedPiece != null || move.isEnPassant;
    final isPawn = piece.type == PieceType.pawn;
    final halfMoveClock = (isCapture || isPawn) ? 0 : state.halfMoveClock + 1;
    final fullMoveNumber = state.turn == PieceColor.black
        ? state.fullMoveNumber + 1
        : state.fullMoveNumber;

    // Captured pieces lists
    final capByWhite = List<Piece>.from(state.capturedByWhite);
    final capByBlack = List<Piece>.from(state.capturedByBlack);
    final actualCapture = move.isEnPassant
        ? Piece(PieceType.pawn, state.turn.opposite)
        : move.capturedPiece;
    if (actualCapture != null) {
      if (state.turn == PieceColor.white) {
        capByWhite.add(actualCapture);
      } else {
        capByBlack.add(actualCapture);
      }
    }

    final nextTurn = state.turn.opposite;

    final midState = state.copyWith(
      board: board,
      turn: nextTurn,
      castling: castling,
      enPassantTarget: enPassantTarget,
      clearEnPassant: enPassantTarget == null,
      halfMoveClock: halfMoveClock,
      fullMoveNumber: fullMoveNumber,
      capturedByWhite: capByWhite,
      capturedByBlack: capByBlack,
    );

    // Position history
    final posKey = midState.positionKey();
    final posHistory = Map<String, int>.from(state.positionHistory);
    posHistory[posKey] = (posHistory[posKey] ?? 0) + 1;

    // Compute notation (needs the pre-move state for disambiguation)
    final inCheckAfter = _gen.isInCheck(nextTurn, midState);
    final legalAfter = _gen.allLegalMoves(midState);
    final isCheckmateAfter = inCheckAfter && legalAfter.isEmpty;
    final notation = Notation.toAlgebraic(
      move: move,
      piece: piece,
      state: state,
      isCheck: inCheckAfter,
      isCheckmate: isCheckmateAfter,
    );

    final record = MoveRecord(
      move: move,
      notation: notation,
      piece: piece,
      isCheck: inCheckAfter,
      isCheckmate: isCheckmateAfter,
    );

    final history = List<MoveRecord>.from(state.moveHistory)..add(record);

    // Determine game status
    GameStatus status = GameStatus.playing;
    PieceColor? winner;

    if (isCheckmateAfter) {
      status = GameStatus.checkmate;
      winner = state.turn;
    } else if (!inCheckAfter && legalAfter.isEmpty) {
      status = GameStatus.stalemate;
    } else if (halfMoveClock >= 100) {
      status = GameStatus.drawFiftyMove;
    } else if ((posHistory[posKey] ?? 0) >= 3) {
      status = GameStatus.drawRepetition;
    } else if (_isInsufficientMaterial(board)) {
      status = GameStatus.drawInsufficient;
    }

    return midState.copyWith(
      positionHistory: posHistory,
      moveHistory: history,
      status: status,
      winnerColor: winner,
    );
  }

  // ── Resign / draw offer ──────────────────────────────────────────────────

  GameState resign(GameState state) => state.copyWith(
    status: GameStatus.resigned,
    winnerColor: state.turn.opposite,
  );

  GameState acceptDraw(GameState state) =>
      state.copyWith(status: GameStatus.drawAgreement);

  // ── Helpers ──────────────────────────────────────────────────────────────

  CastlingRights _updateCastlingRights(
    CastlingRights rights,
    Move move,
    Piece piece,
  ) {
    var r = rights;
    if (piece.type == PieceType.king) {
      if (piece.color == PieceColor.white) {
        r = r.copyWith(whiteKingside: false, whiteQueenside: false);
      } else {
        r = r.copyWith(blackKingside: false, blackQueenside: false);
      }
    }
    if (piece.type == PieceType.rook) {
      if (move.from == const Square(0, 0)) {
        r = r.copyWith(whiteQueenside: false);
      }
      if (move.from == const Square(7, 0)) {
        r = r.copyWith(whiteKingside: false);
      }
      if (move.from == const Square(0, 7)) {
        r = r.copyWith(blackQueenside: false);
      }
      if (move.from == const Square(7, 7)) {
        r = r.copyWith(blackKingside: false);
      }
    }
    // Rook captured
    if (move.to == const Square(0, 0)) r = r.copyWith(whiteQueenside: false);
    if (move.to == const Square(7, 0)) r = r.copyWith(whiteKingside: false);
    if (move.to == const Square(0, 7)) r = r.copyWith(blackQueenside: false);
    if (move.to == const Square(7, 7)) r = r.copyWith(blackKingside: false);
    return r;
  }

  bool _isInsufficientMaterial(List<List<Piece?>> board) {
    final pieces = <Piece>[];
    for (final row in board) {
      for (final p in row) {
        if (p != null) pieces.add(p);
      }
    }
    if (pieces.length == 2) return true; // K vs K
    if (pieces.length == 3) {
      final nonKings = pieces.where((p) => p.type != PieceType.king).toList();
      if (nonKings.length == 1) {
        final t = nonKings.first.type;
        return t == PieceType.bishop || t == PieceType.knight;
      }
    }
    if (pieces.length == 4) {
      final bishops = pieces.where((p) => p.type == PieceType.bishop).toList();
      if (bishops.length == 2 && bishops[0].color != bishops[1].color) {
        // Same-colored bishops: draw (simplification; ideally check square color)
        return true;
      }
    }
    return false;
  }
}

extension on PieceColor {
  PieceColor get opposite =>
      this == PieceColor.white ? PieceColor.black : PieceColor.white;
}
