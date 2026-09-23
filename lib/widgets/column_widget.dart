import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Column Widget',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
    );
  }
}