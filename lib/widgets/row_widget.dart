import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row Widget', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '1. Row Paling Sederhana',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [Text('Flutter'), Text('Dart'), Text('Mobile')],
              ),
              const SizedBox(height: 20),

              const Text(
                '2. Row dengan Icon',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.home),
                  Icon(Icons.search),
                  Icon(Icons.person),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '3. Row dengan Icon dan Text',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(height: 20),
                  Text('Gio'),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '4. Row dengan SizedBox',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(height: 20),
                  Text('Gio'),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '5. Row dengan MainAxisAlignment start',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Budi'), Text('Andi'), Text('Putri')],
              ),
              const SizedBox(height: 20),

              const Text(
                '6. Row dengan MainAxisAlignment center',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Budi'), Text('Andi'), Text('Putri')],
              ),
              const SizedBox(height: 20),

              const Text(
                '7. Row dengan MainAxisAlignment end',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('Budi'), Text('Andi'), Text('Putri')],
              ),
              const SizedBox(height: 20),

              const Text(
                '8. Row dengan MainAxisAlignment spaceBetween',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Budi'), Text('Andi'), Text('Putri')],
              ),
              const SizedBox(height: 20),

              const Text(
                '9. Row dengan MainAxisAlignment spaceAround',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('Budi'), Text('Andi'), Text('Putri')],
              ),
              const SizedBox(height: 20),

              const Text(
                '10. Row dengan MainAxisAlignment spaceEvenly',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('Budi'), Text('Andi'), Text('Putri')],
              ),
              const SizedBox(height: 20),

              const Text(
                '11. Row dengan CrossAxisAlignment start',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 40, height: 40, color: Colors.red),
                  const SizedBox(width: 10),
                  Container(width: 40, height: 60, color: Colors.green),
                  const SizedBox(width: 10),
                  Container(width: 40, height: 50, color: Colors.blue),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '12. Row dengan CrossAxisAlignment center',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: 40, height: 40, color: Colors.red),
                  const SizedBox(width: 10),
                  Container(width: 40, height: 60, color: Colors.green),
                  const SizedBox(width: 10),
                  Container(width: 40, height: 50, color: Colors.blue),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '13. Row dengan CrossAxisAlignment end',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(width: 40, height: 40, color: Colors.red),
                  const SizedBox(width: 10),
                  Container(width: 40, height: 60, color: Colors.green),
                  const SizedBox(width: 10),
                  Container(width: 40, height: 50, color: Colors.blue),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '14. Row dengan MainAxisSize min',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.grey.shade200,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Item A'),
                    SizedBox(width: 10),
                    Text('Item B'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                '15. Row dengan MainAxisSize max',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.grey.shade200,
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Item A'), Text('Item B')],
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                '16. Row dengan Expanded',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Text(
                        '1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 40,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: const Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '17. Row dengan Flexible',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 40,
                      color: Colors.orange,
                      alignment: Alignment.center,
                      child: const Text(
                        'Flex 1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 40,
                      color: Colors.teal,
                      alignment: Alignment.center,
                      child: const Text(
                        'Flex 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '18. Row dengan Spacer',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(children: [Text('Kiri'), Spacer(), Text('Kanan')]),
              const SizedBox(height: 20),

              const Text(
                '19. Row dengan SizedBox width',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text('Pertama'),
                  SizedBox(width: 25),
                  Text('Kedua'),
                  SizedBox(width: 25),
                  Text('Ketiga'),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '20. Row dengan Padding',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Menu 1'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Menu 2'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Menu 3'),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '21. Row dengan Container Berwarna',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.amber,
                    child: const Text('Kuning'),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.cyan,
                    child: const Text('Sian'),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '22. Row dengan ElevatedButton',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('Simpan')),
                  const SizedBox(width: 10),
                  ElevatedButton(onPressed: () {}, child: const Text('Batal')),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '23. Row dengan OutlinedButton',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  OutlinedButton(onPressed: () {}, child: const Text('Edit')),
                  const SizedBox(width: 10),
                  OutlinedButton(onPressed: () {}, child: const Text('Hapus')),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '24. Row dengan TextButton',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Text('Detail')),
                  const SizedBox(width: 10),
                  TextButton(onPressed: () {}, child: const Text('Bantuan')),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '25. Row dengan IconButton',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_down),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '26. Row dengan CircleAvatar',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  CircleAvatar(child: Text('A')),
                  SizedBox(width: 10),
                  CircleAvatar(child: Text('B')),
                  SizedBox(width: 10),
                  CircleAvatar(child: Text('C')),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '27. Row dengan Card',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('Kartu 1'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('Kartu 2'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '28. Row dengan Icon dan Deskripsi',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 8),
                  Text('Rating: 4.8'),
                  SizedBox(width: 16),
                  Icon(Icons.visibility, color: Colors.blue),
                  SizedBox(width: 8),
                  Text('120 views'),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '29. Row dengan Badge / Indikator',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Status Akun:'),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Aktif',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '30. Row dengan Text Style Berbeda',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text('Normal ', style: TextStyle(fontSize: 14)),
                  Text('Tebal ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Miring', style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '31. Row dengan Chip',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Chip(label: Text('Flutter')),
                  SizedBox(width: 8),
                  Chip(label: Text('Dart')),
                  SizedBox(width: 8),
                  Chip(label: Text('Mobile')),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                '32. Row Kompleks (Profil)',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const CircleAvatar(radius: 20, child: Icon(Icons.person)),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Giovanni',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Siswa SIJA',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
