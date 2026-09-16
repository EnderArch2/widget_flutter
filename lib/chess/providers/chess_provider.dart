import 'package:flutter/foundation.dart';

import '../logic/chess_engine.dart';
import '../models/game_state.dart';
import '../models/move.dart';
import '../models/piece.dart';
import '../models/square.dart';

class ChessProvider extends ChangeNotifier {
  ChessProvider() : _engine = ChessEngine() {
    _newGame();
  }

  final ChessEngine _engine;

  late GameState _state;
  Square? _selectedSquare;
  List<Move> _legalMovesForSelected = const [];
  bool _flipped = false;

  GameState get state => _state;
  Square? get selectedSquare => _selectedSquare;
  List<Move> get legalMovesForSelected => _legalMovesForSelected;
  bool get flipped => _flipped;

  bool get isOver => _state.isOver;

  void _newGame() {
    _state = GameState.initial();
    _selectedSquare = null;
    _legalMovesForSelected = const [];
  }

  void newGame() {
    _newGame();
    notifyListeners();
  }

  void flipBoard() {
    _flipped = !_flipped;
    notifyListeners();
  }

  void onSquareTapped(Square sq) {
    if (_state.isOver) return;

    final piece = _state.pieceAt(sq);

    // Tap own piece — select it
    if (piece != null && piece.color == _state.turn) {
      if (_selectedSquare == sq) {
        _selectedSquare = null;
        _legalMovesForSelected = const [];
      } else {
        _selectedSquare = sq;
        _legalMovesForSelected = _engine.legalMovesFor(sq, _state);
      }
      notifyListeners();
      return;
    }

    // Tap destination
    if (_selectedSquare != null) {
      final matching = _legalMovesForSelected.where((m) => m.to == sq).toList();
      if (matching.isEmpty) {
        _selectedSquare = null;
        _legalMovesForSelected = const [];
        notifyListeners();
        return;
      }

      // Promotion: multiple moves with same destination (different promo types)
      if (matching.length > 1 && matching.every((m) => m.isPromotion)) {
        _pendingPromotionMoves = matching;
        notifyListeners();
        return;
      }

      _executeMove(matching.first);
    }
  }

  List<Move>? _pendingPromotionMoves;
  List<Move>? get pendingPromotionMoves => _pendingPromotionMoves;

  void choosePromotion(PieceType type) {
    final move = _pendingPromotionMoves?.firstWhere(
      (m) => m.promotionType == type,
      orElse: () => _pendingPromotionMoves!.first,
    );
    _pendingPromotionMoves = null;
    if (move != null) _executeMove(move);
  }

  void cancelPromotion() {
    _pendingPromotionMoves = null;
    _selectedSquare = null;
    _legalMovesForSelected = const [];
    notifyListeners();
  }

  void _executeMove(Move move) {
    _state = _engine.applyMove(move, _state);
    _selectedSquare = null;
    _legalMovesForSelected = const [];
    _pendingPromotionMoves = null;
    notifyListeners();
  }

  void undoMove() {
    // Rebuild state from scratch up to history.length - 1
    final history = _state.moveHistory;
    if (history.isEmpty) return;
    var s = GameState.initial();
    for (int i = 0; i < history.length - 1; i++) {
      s = _engine.applyMove(history[i].move, s);
    }
    _state = s;
    _selectedSquare = null;
    _legalMovesForSelected = const [];
    _pendingPromotionMoves = null;
    notifyListeners();
  }

  void resign() {
    _state = _engine.resign(_state);
    _selectedSquare = null;
    _legalMovesForSelected = const [];
    notifyListeners();
  }

  void offerDraw() {
    _state = _engine.acceptDraw(_state);
    _selectedSquare = null;
    _legalMovesForSelected = const [];
    notifyListeners();
  }
}
