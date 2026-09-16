import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/game_state.dart';
import '../models/piece.dart';
import '../models/square.dart';
import '../providers/chess_provider.dart';

class ChessBoardWidget extends StatelessWidget {
  const ChessBoardWidget({super.key});

  static const _lightColor = Color(0xFFF0D9B5);
  static const _darkColor = Color(0xFFB58863);
  static const _selectedColor = Color(0xFF7FC97F);
  static const _legalDotColor = Color(0x5500AA00);
  static const _lastMoveColor = Color(0xAAFFD700);
  static const _checkColor = Color(0xCCFF4444);

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<ChessProvider>();
    final state = prov.state;
    final flipped = prov.flipped;
    final selected = prov.selectedSquare;
    final legalDests = {for (final m in prov.legalMovesForSelected) m.to};

    final lastMove = state.moveHistory.isNotEmpty
        ? state.moveHistory.last.move
        : null;

    final inCheck =
        prov.state.status == GameStatus.playing &&
        prov.state.moveHistory.isNotEmpty &&
        prov.state.moveHistory.last.isCheck;

    Square? checkKingSquare;
    if (inCheck) {
      for (int r = 0; r < 8; r++) {
        for (int f = 0; f < 8; f++) {
          final p = state.board[r][f];
          if (p != null && p.type == PieceType.king && p.color == state.turn) {
            checkKingSquare = Square(f, r);
          }
        }
      }
    }

    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        children: [
          for (int displayRow = 0; displayRow < 8; displayRow++)
            Expanded(
              child: Row(
                children: [
                  for (int displayCol = 0; displayCol < 8; displayCol++)
                    Builder(
                      builder: (context) {
                        final file = flipped ? 7 - displayCol : displayCol;
                        final rank = flipped ? displayRow : 7 - displayRow;
                        final sq = Square(file, rank);
                        final isLight = (file + rank) % 2 == 1;
                        final isSelected = sq == selected;
                        final isLegal = legalDests.contains(sq);
                        final isLastMove =
                            lastMove != null &&
                            (sq == lastMove.from || sq == lastMove.to);
                        final isKingInCheck = sq == checkKingSquare;
                        final piece = state.pieceAt(sq);

                        Color bgColor = isLight ? _lightColor : _darkColor;
                        if (isLastMove) bgColor = _lastMoveColor;
                        if (isSelected) bgColor = _selectedColor;
                        if (isKingInCheck) bgColor = _checkColor;

                        return Expanded(
                          child: GestureDetector(
                            onTap: () => context
                                .read<ChessProvider>()
                                .onSquareTapped(sq),
                            child: Stack(
                              children: [
                                Container(color: bgColor),
                                if (isLegal)
                                  Center(
                                    child: piece != null
                                        ? Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: _legalDotColor,
                                                width: 3,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 20,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              color: _legalDotColor,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                  ),
                                if (piece != null)
                                  Center(
                                    child: FittedBox(
                                      child: Text(
                                        piece.unicode,
                                        style: TextStyle(
                                          fontSize: 40,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  piece.color ==
                                                      PieceColor.white
                                                  ? Colors.black54
                                                  : Colors.white54,
                                              blurRadius: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                // Coordinate labels
                                if (displayCol == 0)
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                        '${rank + 1}',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: isLight
                                              ? _darkColor
                                              : _lightColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (displayRow == 7)
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                        'abcdefgh'[file],
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: isLight
                                              ? _darkColor
                                              : _lightColor,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
