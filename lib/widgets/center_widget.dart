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
              Text(
                'Ini text kedua dan kecil',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w100,  
                ),
              ),
              Text(
                'Text ini besar dan tebal',
                style: TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ':3',
                style: TextStyle(
                  fontSize: 48, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
  }
}