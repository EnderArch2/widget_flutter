import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belajar Text Widget',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Belajar Flutter',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Mobile Development',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.yellowAccent,
                padding: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
                child: const Text(
                  'SMK Kelas XII SIJA',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Flutter mempermudah proses\npembuatan aplikasi mobile.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      );
  }
}