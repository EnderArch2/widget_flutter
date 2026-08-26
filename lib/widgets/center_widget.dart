import 'package:flutter/material.dart';

class CenterWidget extends StatelessWidget {
  const CenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Center', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purpleAccent,
      ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Ini adalah Center Widget',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      );
  }
}