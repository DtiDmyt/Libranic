import 'package:flutter/material.dart';
import '../kategori/formpeminjaman_screen.dart';

class PeminjamanRulesScreen extends StatefulWidget {
  const PeminjamanRulesScreen({super.key});

  @override
  State<PeminjamanRulesScreen> createState() => _PeminjamanRulesScreenState();
}

class _PeminjamanRulesScreenState extends State<PeminjamanRulesScreen> {
  bool isAgreed = false;

  @override
  void initState() {
    super.initState();
    _showInitialPopup();
  }

  void _showInitialPopup() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            "Pemberitahuan!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),
          content: Text(
            "Harap Baca Terlebih Dahulu Tata Tertib Peminjaman!",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                "Oke",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[800],
          height: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tata Tertib Peminjaman",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildSectionTitle("KEWAJIBAN ANGGOTA:"),
                            _buildSectionContent(
                              "1. Mematuhi segala tata tertib/peraturan yang telah ditentukan.\n"
                              "2. Menjaga ketenangan, ketertiban, dan kenyamanan di ruang perpustakaan.\n"
                              "3. Mengembalikan buku/bahan pustaka yang telah dipinjam sesuai ketentuan yang telah ditentukan.",
                            ),
                            const SizedBox(height: 16),
                            _buildSectionTitle("SANKSI-SANKSI:"),
                            _buildSectionContent(
                              "- Keterlambatan mengembalikan buku dibebani denda Rp1.000,-/hari, kecuali peminjaman diperpanjang waktu peminjamannya.\n"
                              "- Kehilangan buku harus mengganti buku yang sama.\n"
                              "- Peminjaman yang tidak sesuai dengan waktu dan aturan akan dikenakan sanksi.\n"
                              "- Peminjaman yang berjangka waktu 1 semester/1 tahun diwajibkan untuk mengembalikan buku.\n"
                              "- Terlambat mengembalikan buku lebih dari 1 bulan = pindah sekolah lain.",
                            ),
                            const SizedBox(height: 16),
                            _buildSectionTitle("JUMLAH DAN LAMA PEMINJAMAN:"),
                            _buildSectionContent(
                              "1. Bagi peserta didik (SISWA):\n"
                              "   - Dapat meminjam sebanyak-banyaknya 1 buku untuk jangka waktu 1 minggu.\n"
                              "2. Bagi staf pengajar (GURU):\n"
                              "   - Dapat meminjam sebanyak-banyaknya 4 buku untuk jangka waktu 1 semester.\n"
                              "3. Bagi karyawan:\n"
                              "   - Dapat meminjam sebanyak-banyaknya 2 buku untuk jangka waktu 1 bulan.",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
                      "Saya telah membaca dan menyetujui tata tertib peminjaman.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
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
                            builder: (context) => const FormPeminjamanScreen(
                              bookTitle: "Si Anak Cahaya",
                              bookCover: "assets/buku/si_anak_cahaya.jpeg",
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue[600],
                  disabledBackgroundColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  "Oke",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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