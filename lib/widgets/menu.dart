import 'package:flutter/material.dart';
import 'package:my_app/widgets/text_widget.dart';
import 'package:my_app/widgets/container_widget.dart';
import 'package:my_app/widgets/center_widget.dart';
import 'package:my_app/widgets/image_widget.dart';
import 'package:my_app/widgets/calculator_widget.dart';
import 'package:my_app/widgets/lorem_widget.dart';
import 'package:my_app/widgets/sizebox_widget.dart';
import 'package:my_app/widgets/icon_widget.dart';
import 'package:my_app/widgets/image_offline_widget.dart';
import 'package:my_app/widgets/padding_widget.dart';
import 'package:my_app/widgets/camera_widget.dart';
import 'package:my_app/widgets/tictactoe_widget.dart';
import 'package:my_app/chess/screens/chess_screen.dart';
import 'package:my_app/widgets/row_widget.dart';
import 'package:my_app/widgets/column_widget.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TextWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '1. Text Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContainerWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '2. Container Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CenterWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '3. Center Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImageWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '4. Image Widget (Online Link)',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageOfflineWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '5. Image Widget (in project)',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalculatorWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '6. Calculator Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoremWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '7. Lorem Ipsum',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SizeboxWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '8. Sizebox Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IconWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '9. Icon Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaddingWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '10. Padding Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CameraWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '11. Camera Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TicTacToeWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '12. Tic Tac Toe Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChessScreen()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '13. Chess',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: [
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RowWidget(),
                              ),
                            ),
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                          ),
                          child: const Text(
                            'Row',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ColumnWidget(),
                              ),
                            ),
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                          ),
                          child: const Text(
                            'Column',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RowWidget(),
                              ),
                            ),
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                          ),
                          child: const Text(
                            'Row',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RowWidget(),
                              ),
                            ),
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                          ),
                          child: const Text(
                            'Row',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RowWidget(),
                              ),
                            ),
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                          ),
                          child: const Text(
                            'Row',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RowWidget(),
                              ),
                            ),
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                          ),
                          child: const Text(
                            'Row',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RowWidget(),
                              ),
                            ),
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                          ),
                          child: const Text(
                            'Row',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RowWidget(),
                              ),
                            ),
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                          ),
                          child: const Text(
                            'Row',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RowWidget(),
                              ),
                            ),
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                          ),
                          child: const Text(
                            'Row',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
