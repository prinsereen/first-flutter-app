import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail Mahasiswa',
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        brightness: Brightness.light,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade700],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                'Tampilan Grid',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    6,
                    (index) => MahasiswaCard(
                      nama: 'Prins Naval Nuzeren',
                      nim: '1301213097',
                      alamat: 'Sukabirus',
                      jurusan: 'S1 Informatika',
                      fakultas: 'Fakultas Informatika',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Tampilan List',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) => MahasiswaCard(
                    nama: 'Prins Naval Nuzeren',
                    nim: '1301213097',
                    alamat: 'Sukabirus',
                    jurusan: 'S1 Informatika',
                    fakultas: 'Fakultas Informatika',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MahasiswaCard extends StatelessWidget {
  final String nama;
  final String nim;
  final String alamat;
  final String jurusan;
  final String fakultas;

  const MahasiswaCard({
    Key? key,
    required this.nama,
    required this.nim,
    required this.alamat,
    required this.jurusan,
    required this.fakultas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailMahasiswa(
                nama: nama,
                nim: nim,
                alamat: alamat,
                jurusan: jurusan,
                fakultas: fakultas,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Text('NIM: $nim'),
              Text('Alamat: $alamat'),
              Text('Jurusan: $jurusan'),
              Text('Fakultas: $fakultas'),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailMahasiswa extends StatelessWidget {
  final String nama;
  final String nim;
  final String alamat;
  final String jurusan;
  final String fakultas;

  const DetailMahasiswa({
    Key? key,
    required this.nama,
    required this.nim,
    required this.alamat,
    required this.jurusan,
    required this.fakultas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Mahasiswa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text('NIM: $nim'),
            Text('Alamat: $alamat'),
            Text('Jurusan: $jurusan'),
            Text('Fakultas: $fakultas'),
          ],
        ),
      ),
    );
  }
}
