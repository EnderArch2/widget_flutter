import 'move.dart';
import 'piece.dart';
import 'square.dart';

enum GameStatus {
  playing,
  checkmate,
  stalemate,
  drawInsufficient,
  drawFiftyMove,
  drawRepetition,
  drawAgreement,
  resigned,
}

class CastlingRights {
  const CastlingRights({
    this.whiteKingside = true,
    this.whiteQueenside = true,
    this.blackKingside = true,
    this.blackQueenside = true,
  });

  final bool whiteKingside;
  final bool whiteQueenside;
  final bool blackKingside;
  final bool blackQueenside;

  CastlingRights copyWith({
    bool? whiteKingside,
    bool? whiteQueenside,
    bool? blackKingside,
    bool? blackQueenside,
  }) => CastlingRights(
    whiteKingside: whiteKingside ?? this.whiteKingside,
    whiteQueenside: whiteQueenside ?? this.whiteQueenside,
    blackKingside: blackKingside ?? this.blackKingside,
    blackQueenside: blackQueenside ?? this.blackQueenside,
  );

  String toKey() =>
      '${whiteKingside ? 'K' : ''}${whiteQueenside ? 'Q' : ''}${blackKingside ? 'k' : ''}${blackQueenside ? 'q' : ''}';

  @override
  bool operator ==(Object other) =>
      other is CastlingRights &&
      whiteKingside == other.whiteKingside &&
      whiteQueenside == other.whiteQueenside &&
      blackKingside == other.blackKingside &&
      blackQueenside == other.blackQueenside;

  @override
  int get hashCode =>
      Object.hash(whiteKingside, whiteQueenside, blackKingside, blackQueenside);
}

class MoveRecord {
  const MoveRecord({
    required this.move,
    required this.notation,
    required this.piece,
    this.isCheck = false,
    this.isCheckmate = false,
  });

  final Move move;
  final String notation;
  final Piece piece;
  final bool isCheck;
  final bool isCheckmate;
}

class GameState {
  GameState({
    required this.board,
    required this.turn,
    required this.castling,
    required this.enPassantTarget,
    required this.halfMoveClock,
    required this.fullMoveNumber,
    required this.moveHistory,
    required this.capturedByWhite,
    required this.capturedByBlack,
    required this.positionHistory,
    required this.status,
    this.winnerColor,
  });

  factory GameState.initial() {
    final board = List<List<Piece?>>.generate(8, (_) => List.filled(8, null));

    void place(int file, int rank, PieceType type, PieceColor color) {
      board[rank][file] = Piece(type, color);
    }

    for (int f = 0; f < 8; f++) {
      place(f, 1, PieceType.pawn, PieceColor.white);
      place(f, 6, PieceType.pawn, PieceColor.black);
    }

    const backRank = [
      PieceType.rook,
      PieceType.knight,
      PieceType.bishop,
      PieceType.queen,
      PieceType.king,
      PieceType.bishop,
      PieceType.knight,
      PieceType.rook,
    ];

    for (int f = 0; f < 8; f++) {
      place(f, 0, backRank[f], PieceColor.white);
      place(f, 7, backRank[f], PieceColor.black);
    }

    return GameState(
      board: board,
      turn: PieceColor.white,
      castling: const CastlingRights(),
      enPassantTarget: null,
      halfMoveClock: 0,
      fullMoveNumber: 1,
      moveHistory: const [],
      capturedByWhite: const [],
      capturedByBlack: const [],
      positionHistory: const {},
      status: GameStatus.playing,
    );
  }

  final List<List<Piece?>> board;
  final PieceColor turn;
  final CastlingRights castling;
  final Square? enPassantTarget;
  final int halfMoveClock;
  final int fullMoveNumber;
  final List<MoveRecord> moveHistory;
  final List<Piece> capturedByWhite;
  final List<Piece> capturedByBlack;
  final Map<String, int> positionHistory;
  final GameStatus status;
  final PieceColor? winnerColor;

  Piece? pieceAt(Square sq) => board[sq.rank][sq.file];
  Piece? pieceAtRC(int rank, int file) => board[rank][file];

  bool get isOver => status != GameStatus.playing;

  String positionKey() {
    final sb = StringBuffer();
    for (int r = 7; r >= 0; r--) {
      for (int f = 0; f < 8; f++) {
        final p = board[r][f];
        sb.write(p?.symbol ?? '.');
      }
    }
    sb.write(' ');
    sb.write(turn == PieceColor.white ? 'w' : 'b');
    sb.write(' ');
    sb.write(castling.toKey());
    sb.write(' ');
    sb.write(enPassantTarget?.name ?? '-');
    return sb.toString();
  }

  GameState copyWith({
    List<List<Piece?>>? board,
    PieceColor? turn,
    CastlingRights? castling,
    Square? enPassantTarget,
    bool clearEnPassant = false,
    int? halfMoveClock,
    int? fullMoveNumber,
    List<MoveRecord>? moveHistory,
    List<Piece>? capturedByWhite,
    List<Piece>? capturedByBlack,
    Map<String, int>? positionHistory,
    GameStatus? status,
    PieceColor? winnerColor,
    bool clearWinner = false,
  }) => GameState(
    board: board ?? this.board,
    turn: turn ?? this.turn,
    castling: castling ?? this.castling,
    enPassantTarget: clearEnPassant
        ? null
        : (enPassantTarget ?? this.enPassantTarget),
    halfMoveClock: halfMoveClock ?? this.halfMoveClock,
    fullMoveNumber: fullMoveNumber ?? this.fullMoveNumber,
    moveHistory: moveHistory ?? this.moveHistory,
    capturedByWhite: capturedByWhite ?? this.capturedByWhite,
    capturedByBlack: capturedByBlack ?? this.capturedByBlack,
    positionHistory: positionHistory ?? this.positionHistory,
    status: status ?? this.status,
    winnerColor: clearWinner ? null : (winnerColor ?? this.winnerColor),
  );
}
