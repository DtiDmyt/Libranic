import 'package:flutter/material.dart';

class AksesPeminjamanScreen extends StatelessWidget {
  const AksesPeminjamanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Akses Peminjaman",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: List.generate(3, (index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Nama dan Judul Buku
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Peminjam ${index + 1}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Judul Buku ${index + 1}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                // Ikon Aksi
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Implementasi detail
                      },
                      icon: Icon(Icons.info, color: Colors.blue[300]),
                      tooltip: 'Detail',
                      iconSize: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        // Implementasi batal
                      },
                      icon: const Icon(Icons.close, color: Colors.red),
                      tooltip: 'Batal',
                      iconSize: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        // Implementasi konfirmasi
                      },
                      icon: const Icon(Icons.check, color: Colors.green),
                      tooltip: 'Konfirmasi',
                      iconSize: 20,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
      backgroundColor: Colors.white,
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AksesPeminjamanScreen(),
  ));
}
