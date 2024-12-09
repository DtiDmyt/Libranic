import 'package:flutter/material.dart';

class TentangKamiScreen extends StatelessWidget {
  const TentangKamiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tentang Kami', 
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.blue[200],
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                _buildSectionHeader('Tentang Kami'),
                const SizedBox(height: 16),
                
                // Introduction Card
                _buildCard(
                  child: Text(
                    'Libranic adalah aplikasi perpustakaan digital yang dirancang untuk memudahkan siswa mengakses koleksi buku sekolah, meminjam, dan mengelola peminjaman secara online.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),

                // Features Section
                _buildSectionHeader('Fitur Unggulan'),
                const SizedBox(height: 8),
                _buildFeaturesList(),
                const SizedBox(height: 16),

                // Vision Section
                _buildSectionHeader('Visi'),
                const SizedBox(height: 8),
                _buildCard(
                  child: Text(
                    'Menjadi perpustakaan digital terbaik yang mendukung budaya literasi di lingkungan sekolah.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue[900],
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),

                // Mission Section
                _buildSectionHeader('Misi'),
                const SizedBox(height: 8),
                _buildFeaturesList(
                  features: [
                    'Meningkatkan akses ke buku bagi seluruh siswa.',
                    'Memanfaatkan teknologi untuk efisiensi perpustakaan.',
                    'Mendukung pembelajaran berbasis literasi.',
                  ],
                ),
                const SizedBox(height: 16),

                // Contact Information Section
                _buildSectionHeader('Informasi Sekolah'),
                const SizedBox(height: 8),
                _buildCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Perpustakaan Nawasena',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: const [
        Icon(Icons.location_on, color: Colors.blue),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Jl. Raya Laladon, Kec. Ciomas, Kab. Bogor, Jawa Barat',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
    const SizedBox(height: 8),
    Row(
      children: const [
        Icon(Icons.email, color: Colors.blue),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Email: smkn1_ciomas@yahoo.co.id',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
    const SizedBox(height: 8),
    Row(
      children: const [
        Icon(Icons.phone, color: Colors.blue),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Telepon: +62 251-7520-933',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  ],
),

                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Closing Quote
                _buildQuoteCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom widget for section headers
  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.blue[800],
        decoration: TextDecoration.underline,
        decorationColor: Colors.blue[600],
        decorationThickness: 2,
      ),
    );
  }

  // Custom card widget for sections
  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blue[100]!,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  // Features list with icons
  Widget _buildFeaturesList({List<String>? features}) {
    final defaultFeatures = [
      'Peminjaman Buku Online: Proses peminjaman tanpa perlu antri di perpustakaan.',
      'Pencarian Buku: Cari buku berdasarkan judul, penulis, atau kategori.',
      'Notifikasi Pengembalian: Ingatkan siswa tentang tenggat pengembalian.',
      'Riwayat Peminjaman: Melihat buku-buku yang pernah dipinjam.',
    ];

    return _buildCard(
      child: Column(
        children: (features ?? defaultFeatures).map((feature) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle_outline, color: Colors.blue[600], size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    feature,
                    style: TextStyle(fontSize: 16, color: Colors.blue[900]),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // Quote card with decorative elements
  Widget _buildQuoteCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[500]!, Colors.blue[700]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blue[200]!,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        '"Buku adalah jendela dunia. Dengan Libranic, mari buka lebih banyak jendela untuk masa depan yang lebih cerah."',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontStyle: FontStyle.italic,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}