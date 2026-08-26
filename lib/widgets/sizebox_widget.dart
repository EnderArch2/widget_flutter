import 'package:flutter/material.dart';

class SizeboxWidget extends StatelessWidget {
  const SizeboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belajar SizeBox',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                SizedBox(height: 15),
                CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
                SizedBox(height: 25),
                Text(
                  'Giovanni',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                  Text(
                    'Mobile Developer',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
              ],

            ),
          ),
        ),
      );
  }
}