import 'package:flutter/material.dart';

class KategoriBukuScreen extends StatefulWidget {
  const KategoriBukuScreen({super.key});

  @override
  State<KategoriBukuScreen> createState() => _KategoriBukuScreenState();
}

class _KategoriBukuScreenState extends State<KategoriBukuScreen> {
  // Daftar kategori
  final List<String> categories = ['Novel', 'Sastra', 'Biografi', 'Bisnis'];

  // Data buku berdasarkan kategori
  final Map<String, List<Map<String, String>>> booksByCategory = {
    'Novel': [
      {'title': 'Novel 1', 'image': 'https://via.placeholder.com/100'},
      {'title': 'Novel 2', 'image': 'https://via.placeholder.com/100'},
    ],
    'Sastra': [
      {'title': 'Sastra 1', 'image': 'https://via.placeholder.com/100'},
      {'title': 'Sastra 2', 'image': 'https://via.placeholder.com/100'},
    ],
    'Biografi': [
      {'title': 'Biografi 1', 'image': 'https://via.placeholder.com/100'},
      {'title': 'Biografi 2', 'image': 'https://via.placeholder.com/100'},
    ],
    'Bisnis': [
      {'title': 'Bisnis 1', 'image': 'https://via.placeholder.com/100'},
      {'title': 'Bisnis 2', 'image': 'https://via.placeholder.com/100'},
    ],
  };

  // Kategori yang dipilih
  String selectedCategory = 'Novel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Akses Kategori Buku"),
      ),
      body: Column(
        children: [
          // Bagian kategori
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedCategory == category
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      child: Text(category),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          // Bagian daftar buku
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 3 / 2,
              ),
              itemCount: booksByCategory[selectedCategory]?.length ?? 0,
              itemBuilder: (context, index) {
                final book = booksByCategory[selectedCategory]![index];
                return GestureDetector(
                  onTap: () {
                    // Tambahkan logika untuk navigasi detail buku
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          book['image']!,
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          book['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan logika untuk tombol tambah
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
