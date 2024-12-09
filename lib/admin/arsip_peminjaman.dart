import 'package:flutter/material.dart';

class ArsipPeminjamanScreen extends StatelessWidget {
  const ArsipPeminjamanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> peminjamanList = [
      {'nama': 'Nama Peminjam 1', 'judul': 'Judul Buku 1'},
      {'nama': 'Nama Peminjam 2', 'judul': 'Judul Buku 2'},
      {'nama': 'Nama Peminjam 3', 'judul': 'Judul Buku 3'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Akses Peminjaman"),
      ),
      body: ListView.builder(
        itemCount: peminjamanList.length,
        itemBuilder: (context, index) {
          final item = peminjamanList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(item['nama']!),
              subtitle: Text(item['judul']!),
              trailing: const Icon(Icons.info_outline, color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: ArsipPeminjamanScreen()));
}
