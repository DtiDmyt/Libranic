import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AksesBukuScreen(),
  ));
}

class Buku {
  final String judul;
  final String pengarang;
  final String publisher;
  final String tahunTerbit;
  final int jumlahHalaman;
  final String isbn;
  final String sinopsis;
  final File? cover;

  Buku({
    required this.judul,
    required this.pengarang,
    required this.publisher,
    required this.tahunTerbit,
    required this.jumlahHalaman,
    required this.isbn,
    required this.sinopsis,
    this.cover,
  });
}

class AksesBukuScreen extends StatefulWidget {
  const AksesBukuScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AksesBukuScreenState createState() => _AksesBukuScreenState();
}

class _AksesBukuScreenState extends State<AksesBukuScreen> {
  final List<Buku> daftarBuku = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Buku'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: daftarBuku.length,
              itemBuilder: (context, index) {
                final buku = daftarBuku[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: buku.cover != null
                        ? Image.file(
                            buku.cover!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            width: 50,
                            height: 50,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image, size: 30),
                          ),
                    title: Text(buku.judul),
                    subtitle: Text(buku.pengarang),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.info_outline),
                          onPressed: () {
                            // Aksi untuk detail
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Aksi untuk edit
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              daftarBuku.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24, right: 16),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () async {
                  final bukuBaru = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TambahBukuForm(),
                    ),
                  );
                  if (bukuBaru != null) {
                    setState(() {
                      daftarBuku.add(bukuBaru);
                    });
                  }
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TambahBukuForm extends StatefulWidget {
  const TambahBukuForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TambahBukuFormState createState() => _TambahBukuFormState();
}

class _TambahBukuFormState extends State<TambahBukuForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController pengarangController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController tahunController = TextEditingController();
  final TextEditingController halamanController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController sinopsisController = TextEditingController();
  File? _selectedImage;

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tidak ada gambar yang dipilih")),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Terjadi kesalahan: $e")),
      );
    }
  }

  @override
  void dispose() {
    judulController.dispose();
    pengarangController.dispose();
    publisherController.dispose();
    tahunController.dispose();
    halamanController.dispose();
    isbnController.dispose();
    sinopsisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Buku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: _selectedImage == null
                        ? const Center(child: Text("Upload Cover Buku"))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: judulController,
                  decoration: const InputDecoration(labelText: 'Judul Buku'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul buku tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: pengarangController,
                  decoration: const InputDecoration(labelText: 'Pengarang'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pengarang tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: publisherController,
                  decoration: const InputDecoration(labelText: 'Publisher'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Publisher tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: tahunController,
                  decoration: const InputDecoration(labelText: 'Tahun Terbit'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tahun terbit tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Masukkan tahun yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: halamanController,
                  decoration:
                      const InputDecoration(labelText: 'Jumlah Halaman'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jumlah halaman tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Masukkan angka yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: isbnController,
                  decoration: const InputDecoration(labelText: 'ISBN'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ISBN tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: sinopsisController,
                  decoration: const InputDecoration(labelText: 'Sinopsis Buku'),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Sinopsis tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final bukuBaru = Buku(
                        judul: judulController.text,
                        pengarang: pengarangController.text,
                        publisher: publisherController.text,
                        tahunTerbit: tahunController.text,
                        jumlahHalaman: int.parse(halamanController.text),
                        isbn: isbnController.text,
                        sinopsis: sinopsisController.text,
                        cover: _selectedImage,
                      );
                      Navigator.pop(context, bukuBaru);
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
