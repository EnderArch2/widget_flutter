import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/game_state.dart';
import '../models/piece.dart';
import '../providers/chess_provider.dart';
import '../widgets/chess_board_widget.dart';

class ChessScreen extends StatelessWidget {
  const ChessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChessProvider(),
      child: const _ChessScreenBody(),
    );
  }
}

class _ChessScreenBody extends StatefulWidget {
  const _ChessScreenBody();

  @override
  State<_ChessScreenBody> createState() => _ChessScreenBodyState();
}

class _ChessScreenBodyState extends State<_ChessScreenBody> {
  bool _endDialogShown = false;
  bool _promotionDialogShown = false;

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<ChessProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _maybeShowEndDialog(context, prov);
      _maybeShowPromotionDialog(context, prov);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.flip, color: Colors.white),
            tooltip: 'Flip board',
            onPressed: () => context.read<ChessProvider>().flipBoard(),
          ),
          IconButton(
            icon: const Icon(Icons.undo, color: Colors.white),
            tooltip: 'Undo',
            onPressed: prov.state.moveHistory.isEmpty || prov.state.isOver
                ? null
                : () => context.read<ChessProvider>().undoMove(),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCapturedRow(prov, PieceColor.black),
          const ChessBoardWidget(),
          _buildCapturedRow(prov, PieceColor.white),
          _buildInfoRow(prov),
          Expanded(child: _buildMoveHistory(prov)),
          _buildActionButtons(context, prov),
        ],
      ),
    );
  }

  Widget _buildCapturedRow(ChessProvider prov, PieceColor capturedColor) {
    final pieces = capturedColor == PieceColor.black
        ? prov.state.capturedByWhite
        : prov.state.capturedByBlack;

    return Container(
      height: 32,
      color: capturedColor == PieceColor.black
          ? Colors.grey.shade200
          : Colors.grey.shade300,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                capturedColor == PieceColor.black
                    ? 'White captures:'
                    : 'Black captures:',
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ),
            for (final p in pieces)
              Text(p.unicode, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(ChessProvider prov) {
    final state = prov.state;
    final turn = state.turn == PieceColor.white ? 'White' : 'Black';
    final lastCheck =
        state.moveHistory.isNotEmpty &&
        state.moveHistory.last.isCheck &&
        !state.isOver;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      color: Colors.grey.shade100,
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: state.turn == PieceColor.white
                  ? Colors.white
                  : Colors.black,
              border: Border.all(color: Colors.grey),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            state.isOver ? _statusMessage(state) : '$turn to move',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: lastCheck ? Colors.red : Colors.black87,
            ),
          ),
          if (lastCheck)
            const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                'CHECK!',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _statusMessage(GameState state) {
    return switch (state.status) {
      GameStatus.checkmate =>
        '${state.winnerColor == PieceColor.white ? 'White' : 'Black'} wins by checkmate',
      GameStatus.stalemate => 'Draw by stalemate',
      GameStatus.drawInsufficient => 'Draw — insufficient material',
      GameStatus.drawFiftyMove => 'Draw — 50-move rule',
      GameStatus.drawRepetition => 'Draw — threefold repetition',
      GameStatus.drawAgreement => 'Draw by agreement',
      GameStatus.resigned =>
        '${state.winnerColor == PieceColor.white ? 'White' : 'Black'} wins by resignation',
      GameStatus.playing => '',
    };
  }

  Widget _buildMoveHistory(ChessProvider prov) {
    final history = prov.state.moveHistory;
    final pairs = <(String, String?)>[];
    for (int i = 0; i < history.length; i += 2) {
      final white = history[i].notation;
      final black = i + 1 < history.length ? history[i + 1].notation : null;
      pairs.add((white, black));
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      itemCount: pairs.length,
      reverse: true,
      itemBuilder: (context, idx) {
        final pairIdx = pairs.length - 1 - idx;
        final (white, black) = pairs[pairIdx];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: Row(
            children: [
              SizedBox(
                width: 28,
                child: Text(
                  '${pairIdx + 1}.',
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
              SizedBox(
                width: 68,
                child: Text(
                  white,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
                ),
              ),
              if (black != null)
                Text(
                  black,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context, ChessProvider prov) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _endDialogShown = false;
                  _promotionDialogShown = false;
                });
                context.read<ChessProvider>().newGame();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text('New Game'),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              onPressed: prov.state.isOver
                  ? null
                  : () => _confirmResign(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
              ),
              child: const Text('Resign'),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              onPressed: prov.state.isOver ? null : () => _confirmDraw(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade600,
                foregroundColor: Colors.white,
              ),
              child: const Text('Draw'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmResign(BuildContext context) async {
    final prov = context.read<ChessProvider>();
    final color = prov.state.turn == PieceColor.white ? 'White' : 'Black';
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Resign?'),
        content: Text('$color resigns. Are you sure?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Resign', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
    if (confirm == true && context.mounted) {
      context.read<ChessProvider>().resign();
    }
  }

  Future<void> _confirmDraw(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Agree to draw?'),
        content: const Text('Both players agree to a draw.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Accept Draw'),
          ),
        ],
      ),
    );
    if (confirm == true && context.mounted) {
      context.read<ChessProvider>().offerDraw();
    }
  }

  void _maybeShowEndDialog(BuildContext context, ChessProvider prov) {
    if (!prov.state.isOver || _endDialogShown) return;
    setState(() => _endDialogShown = true);
    final state = prov.state;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text(_endTitle(state)),
        content: Text(_statusMessage(state)),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _endDialogShown = false;
                _promotionDialogShown = false;
              });
              context.read<ChessProvider>().newGame();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purpleAccent,
            ),
            child: const Text(
              'New Game',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  String _endTitle(GameState state) {
    return switch (state.status) {
      GameStatus.checkmate || GameStatus.resigned => 'Game Over',
      _ => 'Draw',
    };
  }

  void _maybeShowPromotionDialog(BuildContext context, ChessProvider prov) {
    if (prov.pendingPromotionMoves == null || _promotionDialogShown) return;
    setState(() => _promotionDialogShown = true);
    final color = prov.state.turn == PieceColor.white
        ? PieceColor.black
        : PieceColor.white;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('Promote pawn'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (final type in [
              PieceType.queen,
              PieceType.rook,
              PieceType.bishop,
              PieceType.knight,
            ])
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  setState(() => _promotionDialogShown = false);
                  context.read<ChessProvider>().choosePromotion(type);
                },
                child: Text(
                  Piece(type, color).unicode,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
