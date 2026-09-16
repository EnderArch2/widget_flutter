class Square {
  const Square(this.file, this.rank)
    : assert(file >= 0 && file < 8, 'file out of range'),
      assert(rank >= 0 && rank < 8, 'rank out of range');

  final int file; // 0=a … 7=h
  final int rank; // 0=rank1 … 7=rank8

  static Square? tryCreate(int file, int rank) {
    if (file < 0 || file > 7 || rank < 0 || rank > 7) return null;
    return Square(file, rank);
  }

  String get name => '${'abcdefgh'[file]}${rank + 1}';

  Square? offset(int df, int dr) => tryCreate(file + df, rank + dr);

  @override
  bool operator ==(Object other) =>
      other is Square && file == other.file && rank == other.rank;

  @override
  int get hashCode => Object.hash(file, rank);

  @override
  String toString() => name;
}
