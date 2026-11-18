import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Belajar Stack',
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
                      'Sintak Stack Dasar',
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
                  child: Stack(
                    children: [
                      Container(width: 200, height: 200, color: Colors.blue),
                      const Text(
                        'Pada contoh ini, Text berada di atas Container.',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('2')),
                    SizedBox(width: 10),
                    Text(
                      'Stack dengan dua Container',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Stack(
                    children: [
                      Container(width: 200, height: 200, color: Colors.blue),
                      Container(width: 120, height: 120, color: Colors.orange),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Contoh paling sederhana untuk memahami konsep tumpukan. Container Orange berada di atas Container Biru. Container Biru berada di bawah Container Orange.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('3')),
                    SizedBox(width: 10),
                    Text(
                      'Stack menggunakan Positioned',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Stack(
                    children: [
                      Container(width: 300, height: 200, color: Colors.blue),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          width: 100,
                          height: 60,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Positioned digunakan untuk menentukan posisi widget di dalam Stack. Widget oranye akan berada 20 piksel dari sisi atas dan 20 piksel dari sisi kiri area Stack.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('4')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Stack untuk menempatkan teks di atas gambar',
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
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/Sinon_GGO.webp',
                        width: 300,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      const Positioned(
                        right: 10,
                        bottom: 50,
                        child: Text(
                          'Jelajahi Mall Terbaik',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 10,
                        bottom: 35,
                        child: Text(
                          'Suasana belanja yang nyaman dan menyenangkan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 10,
                        bottom: 20,
                        child: Text(
                          'menanti Anda di mall terbaik.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('5')),
                    SizedBox(width: 10),
                    Text(
                      'Stack dengan Ikon di atas Container',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      const Positioned(
                        top: 45,
                        left: 45,
                        child: Icon(Icons.home, size: 60, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Contoh ini dapat digunakan untuk membuat kartu menu aplikasi.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('6')),
                    SizedBox(width: 10),
                    Text(
                      'Stack untuk Foto profil dengan ikon edit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.person,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                      const Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Pola ini umum ditemukan pada aplikasi profil pengguna. Widget CircleAvatar kedua ditempatkan di sudut kanan bawah foto profil.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('7')),
                    SizedBox(width: 10),
                    Text(
                      'Stack untuk Badge notifikasi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Stack(
                    children: [
                      const Icon(Icons.notifications, size: 45),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Contoh ini cocok untuk ikon pesan atau keranjang belanja. Konsepnya: ikon lonceng menjadi lapisan belakang, sedangkan angka 3 menjadi badge di bagian kanan atas.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('8')),
                    SizedBox(width: 10),
                    Text(
                      'Stack untuk Label diskon pada produk',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Stack(
                    children: [
                      Container(
                        width: 220,
                        height: 180,
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.shopping_bag,
                          size: 90,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'DISKON 25%',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Stack memudahkan label diskon menempel pada gambar produk tanpa perlu memindahkan gambar tersebut.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('9')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Mengatur posisi dengan Positioned.fill dan Align',
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
                  child: Stack(
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        color: Colors.blue.shade100,
                      ),

                      // Ikon di kanan atas
                      const Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(
                          Icons.star_border_rounded,
                          size: 50,
                          color: Colors.orange,
                        ),
                      ),

                      // Teks di kiri bawah
                      const Positioned(
                        left: 10,
                        bottom: 10,
                        child: Text(
                          'Produk Unggulan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Hasilnya, ikon bintang berada di kanan atas dan teks berada di kiri bawah.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Menggunakan Positioned.fill, kita dapat memakai Align untuk menempatkan widget pada posisi tertentu. Nilai Alignment yang umum: ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Alignment.topLeft, Alignment.topCenter, Alignment.topRight, Alignment.centerLeft, Alignment.center, Alignment.centerRight, Alignment.bottomLeft, Alignment.bottomCenter, dan Alignment.bottomRight',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('10')),
                    SizedBox(width: 10),
                    Text(
                      'Stack dengan Positioned.fill dan Center',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: Stack(
                    children: [
                      Container(
                        width: 300,
                        height: 200,
                        color: Colors.green.shade100,
                      ),
                      const Positioned.fill(
                        child: Center(
                          child: Icon(
                            Icons.play_circle_fill,
                            size: 70,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Pola ini cocok untuk tombol play di atas thumbnail video.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Gunakan Positioned.fill dan Center jika widget harus berada tepat di tengah area Stack.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('11')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Stack untuk Background dengan teks dan tombol',
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
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 220,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.blue],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        top: 30,
                        child: Text(
                          'Belajar Flutter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 25,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Mulai Belajar'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Widget Container menjadi background, Text berada di kiri atas, dan tombol berada di kiri bawah.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('12')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Stack menggunakan fit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 0),
                  child: SizedBox(
                    width: 300,
                    height: 200,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(color: Colors.blue),
                        const Center(
                          child: Text(
                            'Flutter',
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Property fit pada Stack mengatur bagaimana anak-anak yang positioned mengisi ruang yang tersedia. StackFit.expand memberikan batas ukuran seluas mungkin kepada anak yang tidak memiliki posisi eksplisit. Gunakan ini jika area Stack sudah mendapatkan ukuran yang jelas dari parent. Nilai yang perlu dikenali:',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Property fit pada Stack mengatur bagaimana anak-anak yang positioned mengisi ruang yang tersedia. StackFit.expand memberikan batas ukuran seluas mungkin kepada anak yang tidak memiliki posisi eksplisit. Gunakan ini jika area Stack sudah mendapatkan ukuran yang jelas dari parent. Nilai yang perlu dikenali:',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'StackFit.loose = Anak non-positioned mendapatkan batas ukuran yang longgar',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'StackFit.expand  = Anak non-positioned diminta mengisi ruang yang tersedia',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'StackFit.passthrough = Meneruskan batas ukuran dari parent',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('13')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Mengontrol urutan lapisan dengan Stack',
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
                  child: Stack(
                    children: [
                      Container(width: 200, height: 200, color: Colors.red),
                      Positioned(
                        left: 30,
                        top: 30,
                        child: Container(
                          width: 120,
                          height: 120,
                          color: Colors.green,
                        ),
                      ),
                      const Positioned(
                        left: 50,
                        top: 70,
                        child: Text(
                          'Paling Depan',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Widget terakhir dalam children akan tampil di atas widget sebelumnya jika area keduanya saling tumpang tindih.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Urutan lapisannya:',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Lapisan 3: Text "Paling Depan"',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Lapisan 2: Container hijau',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Lapisan 1: Container merah',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(child: Text('14')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Stack dengan IgnorePointer',
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
                  child: Stack(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          debugPrint('Tombol ditekan');
                        },
                        child: const Text('Klik Saya'),
                      ),
                      IgnorePointer(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint('Tombol Tidak bisa ditekan');
                            },
                            child: const Text('Klik Aja Kalo Bisa'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'IgnorePointer membuat widget tertentu tidak menerima interaksi sentuhan.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 20),
                  child: const Text(
                    'Pada contoh ini, Tombol Klik Aja Kalo Bisa tidak menangkap sentuhan sehingga tombol di belakangnya tetap dapat menerima interaksi. Perlu diingat, IgnorePointer bukan untuk mengatur posisi; posisinya diatur oleh Align.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(height: 60),
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