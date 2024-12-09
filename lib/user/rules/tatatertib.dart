import 'package:flutter/material.dart';
import '../../login_screen.dart';

class LibranicRulesScreen extends StatefulWidget {
  const LibranicRulesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LibranicRulesScreenState createState() => _LibranicRulesScreenState();
}

class _LibranicRulesScreenState extends State<LibranicRulesScreen> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tata Tertib Perpustakaan Nawasena",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[50]!,
              Colors.blue[100]!,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionHeader("Jam Operasional Perpustakaan"),
                          _buildContentText(
                            "Senin      : Pukul 08.00 - 16.00\n"
                            "Selasa-Kamis : Pukul 07.15 - 15.00\n"
                            "Jumat      : Pukul 07.00 - 14.00",
                          ),
                          _buildDivider(),
                          _buildSectionHeader("KEANGGOTAAN"),
                          _buildNumberedList([
                            "Setiap anggota perpustakaan adalah siswa, guru, karyawan sekolah.",
                            "Kartu Anggota dapat diperoleh dengan mengisi formulir dan menyerahkan foto 3x4 sebanyak 2 lembar.",
                            "Peminjaman buku/hari perpustakaan hanya dilayani dengan kartu anggota.",
                            "Kartu anggota tidak dapat dipinjamkan/dipergunakan oleh orang lain.",
                          ]),
                          _buildDivider(),
                          _buildSectionHeader("KEWAJIBAN ANGGOTA"),
                          _buildNumberedList([
                            "Mematuhi segala tata tertib/peraturan yang telah ditentukan.",
                            "Menjaga ketenangan, ketertiban, dan kenyamanan di ruang perpustakaan.",
                            "Mengembalikan buku/bahan pustaka yang telah dipinjam sesuai ketentuan yang telah ditentukan.",
                          ]),
                          _buildDivider(),
                          _buildSectionHeader("SANKSI-SANKSI"),
                          _buildBulletList([
                            "Keterlambatan mengembalikan buku dibebani denda Rp1.000,-/hari, kecuali peminjaman diperpanjang waktu peminjamannya.",
                            "Kehilangan buku harus mengganti buku yang sama.",
                            "Peminjaman yang tidak sesuai dengan waktu dan aturan akan dikenakan sanksi.",
                            "Peminjaman yang berjangka waktu 1 semester/1 tahun diwajibkan untuk mengembalikan buku.",
                            "Terlambat mengembalikan buku lebih dari 1 bulan = pindah sekolah lain.",
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isAgreed,
                        onChanged: (value) {
                          setState(() {
                            isAgreed = value!;
                          });
                        },
                        activeColor: Colors.blue[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Saya telah membaca dan menyetujui tata tertib perpustakaan.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue[900],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: isAgreed
                        ? () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.blue[600],
                      disabledBackgroundColor: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      "Oke",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom widget for section headers
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue[800],
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue[600],
          decorationThickness: 2,
        ),
      ),
    );
  }

  // Custom widget for content text
  Widget _buildContentText(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 14,
        color: Colors.blue[900],
      ),
    );
  }

  // Custom widget for numbered lists
  Widget _buildNumberedList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.asMap().entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${entry.key + 1}. ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  entry.value,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[900],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Custom widget for bullet lists
  Widget _buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.circle,
                size: 8,
                color: Colors.blue[900],
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[900],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Custom divider
  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Divider(
        color: Colors.blue[300],
        thickness: 1,
      ),
    );
  }
}