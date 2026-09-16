import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

enum GameMode { playerVsPlayer, playerVsBot, botVsBot }

enum Player { x, o }

class TicTacToeWidget extends StatefulWidget {
  const TicTacToeWidget({super.key});

  @override
  State<TicTacToeWidget> createState() => _TicTacToeWidgetState();
}

class _TicTacToeWidgetState extends State<TicTacToeWidget> {
  static const List<List<int>> _winLines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  GameMode? _mode;
  List<Player?> _board = List.filled(9, null);
  Player _currentPlayer = Player.x;
  List<int>? _winningLine;
  bool _isDraw = false;
  bool _botThinking = false;
  int _xScore = 0;
  int _oScore = 0;
  int _draws = 0;
  Timer? _botTimer;

  @override
  void dispose() {
    _botTimer?.cancel();
    super.dispose();
  }

  void _startGame(GameMode mode) {
    setState(() {
      _mode = mode;
      _xScore = 0;
      _oScore = 0;
      _draws = 0;
      _resetBoard();
    });
  }

  void _resetBoard() {
    _botTimer?.cancel();
    _board = List.filled(9, null);
    _currentPlayer = Player.x;
    _winningLine = null;
    _isDraw = false;
    _botThinking = false;
    if (_mode == GameMode.botVsBot) {
      _scheduleBotMove(Player.x);
    }
  }

  void _onCellTapped(int index) {
    if (_board[index] != null ||
        _winningLine != null ||
        _isDraw ||
        _botThinking) {
      return;
    }
    _makeMove(index);
  }

  void _makeMove(int index) {
    setState(() {
      _board[index] = _currentPlayer;
    });
    final winner = _checkWinner(_board);
    if (winner != null) {
      setState(() {
        _winningLine = winner;
        if (_board[winner.first] == Player.x) {
          _xScore++;
        } else {
          _oScore++;
        }
      });
      return;
    }
    if (_board.every((cell) => cell != null)) {
      setState(() {
        _isDraw = true;
        _draws++;
      });
      return;
    }
    setState(() {
      _currentPlayer = _currentPlayer == Player.x ? Player.o : Player.x;
    });
    final botShouldMove = switch (_mode) {
      GameMode.playerVsBot => _currentPlayer == Player.o,
      GameMode.botVsBot => true,
      GameMode.playerVsPlayer || null => false,
    };
    if (botShouldMove) {
      _scheduleBotMove(_currentPlayer);
    }
  }

  void _scheduleBotMove(Player botPlayer) {
    setState(() {
      _botThinking = true;
    });
    _botTimer = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      final random = math.Random();
      int? move;
      if (random.nextDouble() < 0.5) {
        final emptyCells = <int>[
          for (var i = 0; i < 9; i++)
            if (_board[i] == null) i,
        ];
        if (emptyCells.isNotEmpty) {
          move = emptyCells[random.nextInt(emptyCells.length)];
        }
      }
      move ??= _bestMove(_board, botPlayer);
      setState(() {
        _botThinking = false;
      });
      if (move != null) {
        _makeMove(move);
      }
    });
  }

  static List<int>? _checkWinner(List<Player?> board) {
    for (final line in _winLines) {
      final a = board[line[0]];
      if (a != null && a == board[line[1]] && a == board[line[2]]) {
        return line;
      }
    }
    return null;
  }

  int? _bestMove(List<Player?> board, Player botPlayer) {
    final opponent = botPlayer == Player.x ? Player.o : Player.x;
    var bestScore = -100;
    final candidates = <int>[];
    for (var i = 0; i < 9; i++) {
      if (board[i] != null) continue;
      board[i] = botPlayer;
      final score = _minimax(board, 0, false, botPlayer, opponent);
      board[i] = null;
      if (score > bestScore) {
        bestScore = score;
        candidates
          ..clear()
          ..add(i);
      } else if (score == bestScore) {
        candidates.add(i);
      }
    }
    if (candidates.isEmpty) return null;
    return candidates[math.Random().nextInt(candidates.length)];
  }

  int _minimax(
    List<Player?> board,
    int depth,
    bool isMaximizing,
    Player botPlayer,
    Player opponent,
  ) {
    final winner = _checkWinner(board);
    if (winner != null) {
      return board[winner.first] == botPlayer ? 10 - depth : depth - 10;
    }
    if (board.every((cell) => cell != null)) return 0;
    if (isMaximizing) {
      var best = -100;
      for (var i = 0; i < 9; i++) {
        if (board[i] != null) continue;
        board[i] = botPlayer;
        best = math.max(best, _minimax(board, depth + 1, false, botPlayer, opponent));
        board[i] = null;
      }
      return best;
    } else {
      var best = 100;
      for (var i = 0; i < 9; i++) {
        if (board[i] != null) continue;
        board[i] = opponent;
        best = math.min(best, _minimax(board, depth + 1, true, botPlayer, opponent));
        board[i] = null;
      }
      return best;
    }
  }

  String get _statusText {
    if (_winningLine != null) {
      final winner = _board[_winningLine!.first];
      if (_mode == GameMode.playerVsBot) {
        return winner == Player.x ? 'You win!' : 'Bot wins!';
      }
      if (_mode == GameMode.botVsBot) {
        return 'Bot ${winner == Player.x ? 'X' : 'O'} wins!';
      }
      return 'Player ${winner == Player.x ? 'X' : 'O'} wins!';
    }
    if (_isDraw) return "It's a draw!";
    if (_botThinking) return 'Bot is thinking...';
    if (_mode == GameMode.playerVsBot) {
      return _currentPlayer == Player.x ? 'Your turn (X)' : "Bot's turn (O)";
    }
    if (_mode == GameMode.botVsBot) {
      return 'Bot ${_currentPlayer == Player.x ? 'X' : 'O'} is playing...';
    }
    return "Player ${_currentPlayer == Player.x ? 'X' : 'O'}'s turn";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      body: _mode == null ? _buildModeSelection() : _buildGame(),
    );
  }

  Widget _buildModeSelection() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Choose a mode',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            _buildModeCard(
              icon: Icons.people,
              title: 'Player vs Player',
              subtitle: 'Two players take turns',
              onTap: () => _startGame(GameMode.playerVsPlayer),
            ),
            const SizedBox(height: 16),
            _buildModeCard(
              icon: Icons.smart_toy,
              title: 'Player vs Bot',
              subtitle: 'You (X) vs bot (O)',
              onTap: () => _startGame(GameMode.playerVsBot),
            ),
            const SizedBox(height: 16),
            _buildModeCard(
              icon: Icons.precision_manufacturing,
              title: 'Bot vs Bot',
              subtitle: 'Sit back and watch the bots battle',
              onTap: () => _startGame(GameMode.botVsBot),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModeCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.purpleAccent),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGame() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            _statusText,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          _buildScoreBoard(),
          const SizedBox(height: 16),
          _buildBoard(),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => setState(_resetBoard),
                  icon: const Icon(Icons.refresh),
                  label: const Text('New Round'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _botTimer?.cancel();
                    setState(() {
                      _mode = null;
                      _resetBoard();
                    });
                  },
                  icon: const Icon(Icons.exit_to_app),
                  label: const Text('Change Mode'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoreBoard() {
    return Row(
      children: [
        _buildScoreCard(
          label: switch (_mode) {
            GameMode.playerVsBot => 'You (X)',
            GameMode.botVsBot => 'Bot X',
            _ => 'Player X',
          },
          score: _xScore,
          color: Colors.blueAccent,
        ),
        _buildScoreCard(label: 'Draws', score: _draws, color: Colors.grey),
        _buildScoreCard(
          label: switch (_mode) {
            GameMode.playerVsBot => 'Bot (O)',
            GameMode.botVsBot => 'Bot O',
            _ => 'Player O',
          },
          score: _oScore,
          color: Colors.redAccent,
        ),
      ],
    );
  }

  Widget _buildScoreCard({
    required String label,
    required int score,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              '$score',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoard() {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.count(
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [for (var i = 0; i < 9; i++) _buildCell(i)],
      ),
    );
  }

  Widget _buildCell(int index) {
    final isWinning = _winningLine?.contains(index) ?? false;
    final player = _board[index];
    return GestureDetector(
      onTap: () => _onCellTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isWinning ? Colors.green.withValues(alpha: 0.2) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isWinning ? Colors.green : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: player == null
              ? null
              : Icon(
                  player == Player.x ? Icons.close : Icons.radio_button_unchecked,
                  size: 48,
                  color: isWinning
                      ? Colors.green
                      : player == Player.x
                          ? Colors.blueAccent
                          : Colors.redAccent,
                ),
        ),
      ),
    );
  }
}
