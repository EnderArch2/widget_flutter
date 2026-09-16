enum PieceType { pawn, knight, bishop, rook, queen, king }

enum PieceColor { white, black }

class Piece {
  const Piece(this.type, this.color, {this.hasMoved = false});

  final PieceType type;
  final PieceColor color;
  final bool hasMoved;

  Piece copyWith({PieceType? type, PieceColor? color, bool? hasMoved}) => Piece(
    type ?? this.type,
    color ?? this.color,
    hasMoved: hasMoved ?? this.hasMoved,
  );

  String get symbol {
    const symbols = {
      PieceType.pawn: 'P',
      PieceType.knight: 'N',
      PieceType.bishop: 'B',
      PieceType.rook: 'R',
      PieceType.queen: 'Q',
      PieceType.king: 'K',
    };
    final s = symbols[type]!;
    return color == PieceColor.white ? s : s.toLowerCase();
  }

  String get unicode {
    const whites = {
      PieceType.king: '♔',
      PieceType.queen: '♕',
      PieceType.rook: '♖',
      PieceType.bishop: '♗',
      PieceType.knight: '♘',
      PieceType.pawn: '♙',
    };
    const blacks = {
      PieceType.king: '♚',
      PieceType.queen: '♛',
      PieceType.rook: '♜',
      PieceType.bishop: '♝',
      PieceType.knight: '♞',
      PieceType.pawn: '♟',
    };
    return color == PieceColor.white ? whites[type]! : blacks[type]!;
  }

  @override
  bool operator ==(Object other) =>
      other is Piece &&
      type == other.type &&
      color == other.color &&
      hasMoved == other.hasMoved;

  @override
  int get hashCode => Object.hash(type, color, hasMoved);
}
