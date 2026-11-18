import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  const AlignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Belajar Align',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purpleAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text('1', style: TextStyle(color: Colors.yellow)),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Align Top Left',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 10.0),
                  child: Container(
                    height: 300,
                    color: Colors.orange,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                        ),
                        height: 50,
                        width: 120,
                        child: const Center(
                          child: Text(
                            'Top Left',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text('2', style: TextStyle(color: Colors.purple)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Align Top Center',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 10.0),
                  child: Container(
                    height: 300,
                    color: Colors.orange,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                        ),
                        height: 50,
                        width: 120,
                        child: const Center(
                          child: Text(
                            'Top Center',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text('3', style: TextStyle(color: Colors.yellow)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Align Top Right',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 10.0),
                  child: Container(
                    height: 300,
                    color: Colors.orange,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                        ),
                        height: 50,
                        width: 120,
                        child: const Center(
                          child: Text(
                            'Top Right',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text('4', style: TextStyle(color: Colors.purple)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Align Center Left',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 10.0),
                  child: Container(
                    height: 300,
                    color: Colors.orange,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                        ),
                        height: 50,
                        width: 120,
                        child: const Center(
                          child: Text(
                            'Center Left',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text('5', style: TextStyle(color: Colors.yellow)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Align Center',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 10.0),
                  child: Container(
                    height: 300,
                    color: Colors.orange,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                        ),
                        height: 50,
                        width: 120,
                        child: const Center(
                          child: Text(
                            'Center',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text('6', style: TextStyle(color: Colors.purple)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Align Center Right',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 10.0),
                  child: Container(
                    height: 300,
                    color: Colors.orange,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                        ),
                        height: 50,
                        width: 120,
                        child: const Center(
                          child: Text(
                            'Center Right',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text('7', style: TextStyle(color: Colors.yellow)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Bottom Left',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 10.0),
                  child: Container(
                    height: 300,
                    color: Colors.orange,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                        ),
                        height: 50,
                        width: 120,
                        child: const Center(
                          child: Text(
                            'Bottom Left',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text('8', style: TextStyle(color: Colors.purple)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Align Bottom Center',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 10.0),
                  child: Container(
                    height: 300,
                    color: Colors.orange,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                        ),
                        height: 50,
                        width: 120,
                        child: const Center(
                          child: Text(
                            'Bottom Center',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text('9', style: TextStyle(color: Colors.yellow)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Bottom Right',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 10.0),
                  child: Container(
                    height: 300,
                    color: Colors.orange,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                        ),
                        height: 50,
                        width: 120,
                        child: const Center(
                          child: Text(
                            'Bottom Right',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.purpleAccent,
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }
}