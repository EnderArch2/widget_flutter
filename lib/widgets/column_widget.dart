import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Belajar Column',
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
                    CircleAvatar(child: Text('1')),
                    SizedBox(width: 10),
                    Text(
                      'Column Paling Sederhana',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Column(
                    children: [
                      Text('Nama'),
                      Text('Alamat'),
                      Text('No. Telepon'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('2')),
                    SizedBox(width: 10),
                    Text(
                      'Column dengan Text',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Column(
                    children: [
                      Text(
                        'Belajar Flutter',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Materi Widget Column'),
                      Text('Kelas XII SIJA'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('3')),
                    SizedBox(width: 10),
                    Text(
                      'Column dengan Icon',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Container(
                    color: const Color.fromARGB(255, 107, 48, 44),
                    width: 100,
                    child: Column(
                      children: [
                        Icon(
                          Icons.home,
                          size: 50,
                          color: const Color.fromARGB(255, 68, 243, 33),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 68, 243, 33),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('4')),
                    SizedBox(width: 10),
                    Text(
                      'Column dengan SizeBox',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Column(
                    children: [
                      Text('Nama'),
                      SizedBox(height: 20),
                      Text('Alamat'),
                      SizedBox(height: 20),
                      Text('Telepon'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('5')),
                    SizedBox(width: 10),
                    Text(
                      'Column dengan mainAxisAlignment.start',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Container(
                    height: 300,
                    color: Colors.lime,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Pada Column, main axis adalah sumbu vertikal'),
                        Text('Elektronik'),
                        Text('Fashion'),
                        Text('Kesehatan'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('6')),
                    SizedBox(width: 10),
                    Text(
                      'Column dengan mainAxisAlignment.center',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Container(
                    height: 300,
                    color: Colors.lime,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Pada Column, main axis adalah sumbu vertikal'),
                        Text('Elektronik'),
                        Text('Fashion'),
                        Text('Kesehatan'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('7')),
                    SizedBox(width: 10),
                    Text(
                      'Column dengan mainAxisAlignment.end',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Container(
                    height: 300,
                    color: Colors.lime,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Pada Column, main axis adalah sumbu vertikal'),
                        Text('Elektronik'),
                        Text('Fashion'),
                        Text('Kesehatan'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('8')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Column dengan mainAxisAlignment.spacebetween',
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
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Container(
                    height: 300,
                    color: Colors.lime,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pada Column, main axis adalah sumbu vertikal'),
                        Text('Elektronik'),
                        Text('Fashion'),
                        Text('Kesehatan'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('9')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Column dengan mainAxisAlignment.spaceAround',
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
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Container(
                    height: 300,
                    color: Colors.lime,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Pada Column, main axis adalah sumbu vertikal'),
                        Text('Elektronik'),
                        Text('Fashion'),
                        Text('Kesehatan'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('10')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Column dengan mainAxisAlignment.spaceEvenly',
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
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Container(
                    height: 300,
                    color: Colors.lime,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Pada Column, main axis adalah sumbu vertikal'),
                        Text('Elektronik'),
                        Text('Fashion'),
                        Text('Kesehatan'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('11')),
                    SizedBox(width: 10),
                    Text(
                      'Column dengan crossAxisAlignment.start',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Container(
                    height: 300,
                    color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pada Column, cross axis adalah sumbu horizontal'),
                        Text('Elektronik'),
                        Text('Fashion'),
                        Text('Kesehatan'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('12')),
                    SizedBox(width: 10),
                    Text(
                      'Column dengan crossAxisAlignment.center',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Container(
                    height: 300,
                    color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Pada Column, cross axis adalah sumbu horizontal'),
                        Text('Elektronik'),
                        Text('Fashion'),
                        Text('Kesehatan'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('13')),
                    SizedBox(width: 10),
                    Text(
                      'Column dengan crossAxisAlignment.end',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Container(
                    height: 300,
                    color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Pada Column, cross axis adalah sumbu horizontal'),
                        Text('Elektronik'),
                        Text('Fashion'),
                        Text('Kesehatan'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('14')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Column dengan crossAxisAlignment.stretch',
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
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Container(
                    height: 300,
                    color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Pada Column, CrossAxisAlignment.stretch, Widget anak akan melebar memenuhi ruang horizontal yang tersedia. Sangat berguna untuk tombol full width.',
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(onPressed: () {}, child: Text('Login')),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Register'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('15')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Column dengan Button',
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
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Column(
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text('Login')),
                      ElevatedButton(onPressed: () {}, child: Text('Register')),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('16')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Column dengan TextField',
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
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock, size: 80),

                      SizedBox(height: 20),

                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 16),

                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 20),

                      ElevatedButton(onPressed: () {}, child: Text('Login')),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('17')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Column dengan Row',
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
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Card(
                    color: Colors.lime,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Card(
                        color: Colors.green,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Laptop ASUS',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 8),

                              Row(
                                children: [
                                  Icon(Icons.star),
                                  SizedBox(width: 5),
                                  Text('4.8'),
                                ],
                              ),

                              SizedBox(height: 8),

                              Text('Rp 8.000.000'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('18')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Column + Avatar + Profile',
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
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/Doni.jpg'),
                      ),

                      SizedBox(height: 16),

                      Text(
                        'Donianto Bonis Nugroho',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text('Web & Mobile Developer'),

                      SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Edit Profile'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
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