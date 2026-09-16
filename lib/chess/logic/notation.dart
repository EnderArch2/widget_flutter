import '../models/game_state.dart';
import '../models/move.dart';
import '../models/piece.dart';
import '../models/square.dart';
import 'move_generator.dart';

class Notation {
  const Notation._();

  static final _gen = const MoveGenerator();

  static String toAlgebraic({
    required Move move,
    required Piece piece,
    required GameState state,
    bool isCheck = false,
    bool isCheckmate = false,
  }) {
    final suffix = isCheckmate ? '#' : (isCheck ? '+' : '');

    if (move.flag == MoveFlag.castleKingside) return 'O-O$suffix';
    if (move.flag == MoveFlag.castleQueenside) return 'O-O-O$suffix';

    final sb = StringBuffer();

    if (piece.type != PieceType.pawn) {
      sb.write(_pieceChar(piece.type));
      sb.write(_disambiguation(move, piece, state));
    }

    final isCapture =
        move.capturedPiece != null || move.flag == MoveFlag.enPassantCapture;

    if (piece.type == PieceType.pawn && isCapture) {
      sb.write('abcdefgh'[move.from.file]);
    }

    if (isCapture) sb.write('x');

    sb.write(move.to.name);

    if (move.flag == MoveFlag.enPassantCapture) sb.write(' e.p.');

    if (move.flag == MoveFlag.promotion) {
      sb.write('=');
      sb.write(_pieceChar(move.promotionType!));
    }

    sb.write(suffix);
    return sb.toString();
  }

  static String _pieceChar(PieceType t) {
    return switch (t) {
      PieceType.knight => 'N',
      PieceType.bishop => 'B',
      PieceType.rook => 'R',
      PieceType.queen => 'Q',
      PieceType.king => 'K',
      PieceType.pawn => '',
    };
  }

  static String _disambiguation(Move move, Piece piece, GameState state) {
    final ambiguous = <Move>[];
    for (int r = 0; r < 8; r++) {
      for (int f = 0; f < 8; f++) {
        final p = state.board[r][f];
        if (p == null || p.type != piece.type || p.color != piece.color) {
          continue;
        }
        final sq = Square(f, r);
        if (sq == move.from) continue;
        final legal = _gen.legalMovesFor(sq, state);
        if (legal.any((m) => m.to == move.to)) ambiguous.add(move);
      }
    }
    if (ambiguous.isEmpty) return '';
    final sameFile = ambiguous.any((m) => m.from.file == move.from.file);
    final sameRank = ambiguous.any((m) => m.from.rank == move.from.rank);
    if (!sameFile) return 'abcdefgh'[move.from.file];
    if (!sameRank) return '${move.from.rank + 1}';
    return move.from.name;
  }
}
