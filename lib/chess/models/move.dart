import 'piece.dart';
import 'square.dart';

enum MoveFlag {
  normal,
  doublePawnPush,
  enPassantCapture,
  castleKingside,
  castleQueenside,
  promotion,
}

class Move {
  const Move({
    required this.from,
    required this.to,
    this.flag = MoveFlag.normal,
    this.promotionType,
    this.capturedPiece,
  });

  final Square from;
  final Square to;
  final MoveFlag flag;
  final PieceType? promotionType;
  final Piece? capturedPiece;

  bool get isCapture =>
      capturedPiece != null || flag == MoveFlag.enPassantCapture;
  bool get isCastle =>
      flag == MoveFlag.castleKingside || flag == MoveFlag.castleQueenside;
  bool get isPromotion => flag == MoveFlag.promotion;
  bool get isEnPassant => flag == MoveFlag.enPassantCapture;

  Move withPromotion(PieceType type) => Move(
    from: from,
    to: to,
    flag: MoveFlag.promotion,
    promotionType: type,
    capturedPiece: capturedPiece,
  );

  @override
  bool operator ==(Object other) =>
      other is Move &&
      from == other.from &&
      to == other.to &&
      flag == other.flag &&
      promotionType == other.promotionType;

  @override
  int get hashCode => Object.hash(from, to, flag, promotionType);

  @override
  String toString() => '${from.name}${to.name}${promotionType?.name ?? ''}';
}
