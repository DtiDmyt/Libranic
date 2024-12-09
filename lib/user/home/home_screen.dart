import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Banner Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue.shade200,
                        Colors.blue.shade400,
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: PageView(
                      children: [
                        _buildBannerImage('assets/logo/tampilan1.jpg'),
                        _buildBannerImage('assets/logo/tampilan2.jpg'),
                        _buildBannerImage('assets/logo/tampilan3.jpg'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Popular Books Section
              _buildSectionHeader('Buku Populer', () {
                // Add view all functionality
              }),
              const SizedBox(height: 16),

              // Popular Books ListView
              SizedBox(
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: 16),
                  children: [
                    _buildBookCard(
                      title: 'Si Anak Cahaya',
                      author: 'Tere Liye',
                      description:
                          'Novel ini mengisahkan kehidupan Zaman, seorang anak dari keluarga sederhana di Belitong, yang memiliki semangat tinggi untuk belajar dan bertualang. Kisah ini sarat nilai-nilai tentang perjuangan, cinta, dan persahabatan.',
                      image: 'assets/buku/si_anak_cahaya.jpeg',
                    ),
                    _buildBookCard(
                      title: 'Dilan: Dia adalah Dilanku Tahun 1990',
                      author: 'Pidi Baiq',
                      description:
                          'Berlatar di Bandung tahun 1990, novel ini mengisahkan perjalanan cinta antara Dilan, seorang pemuda yang unik dan humoris, dengan Milea, gadis pindahan dari Jakarta.',
                      image: 'assets/buku/dilan.jpg',
                    ),
                    _buildBookCard(
                      title: 'Laskar Pelangi',
                      author: 'Andrea Hirata',
                      description:
                          'Kisah tentang sepuluh anak dari keluarga miskin di Belitung yang berjuang mendapatkan pendidikan. Buku ini mengangkat nilai persahabatan, semangat belajar, dan harapan.',
                      image: 'assets/buku/laskar_pelangi.jpg',
                    ),
                    _buildBookCard(
                      title: 'Perahu Kertas',
                      author: 'Dewi Lestari (Dee)',
                      description:
                          'Mengisahkan Kugy dan Keenan, dua anak muda dengan impian besar yang bertemu dan menjalani kehidupan penuh lika-liku. Perjalanan mereka menggambarkan cinta, mimpi, dan keberanian untuk bertindak.',
                      image: 'assets/buku/perahu_kertas.jpg',
                    ),
                    _buildBookCard(
                      title: 'Hujan Bulan Juni',
                      author: 'Sapardi Djoko Damono',
                      description:
                          'Sebuah karya puisi yang mengangkat tema cinta, alam, dan hubungan manusia dengan waktu. Puisi "Hujan Bulan Juni" menjadi salah satu karya paling ikonik Sapardi.',
                      image: 'assets/buku/hujan_bulan_juni.jpg',
                    ),
                    _buildBookCard(
                      title: 'Tentang Kamu',
                      author: 'Tere Liye',
                      description:
                          'Kisah seorang pengacara muda yang menyelidiki kehidupan kliennya, Sri Ningsih, seorang perempuan sederhana dengan kisah hidup luar biasa.',
                      image: 'assets/buku/tentang_kamu.jpeg',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Magazine Section
              _buildSectionHeader('Majalah Populer', () {
                // Add view all functionality
              }),
              const SizedBox(height: 16),

              // Magazine ListView
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(right: 16),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final magazines = [
                      {
                        'title': 'Tempo',
                        'author': 'Majalah Berita',
                        'description':
                            'Laporan investigasi mendalam, berita politik, dan ekonomi.',
                        'image': 'assets/buku/tempo.jpg',
                      },
                      {
                        'title': 'Gatra',
                        'author': 'Majalah Analisis',
                        'description':
                            'Berita nasional dan internasional dengan fokus politik dan ekonomi.',
                        'image': 'assets/buku/gatra.jpg',
                      },
                      {
                        'title': 'Intisari',
                        'author': 'Gaya Hidup',
                        'description':
                            'Artikel inspiratif, pengetahuan umum, dan kesehatan.',
                        'image': 'assets/buku/intisari.jpg',
                      },
                      {
                        'title': 'Bobo',
                        'author': 'Majalah Anak',
                        'description':
                            'Cerita, komik, dan pengetahuan mendidik untuk anak-anak.',
                        'image': 'assets/buku/bobo.jpeg',
                      },
                      {
                        'title': 'National Geographic',
                        'author': 'Sains dan Alam',
                        'description':
                            'Eksplorasi keindahan alam dan budaya Indonesia.',
                        'image': 'assets/buku/national_geographic.jpg',
                      },
                      {
                        'title': 'Teras Indonesia',
                        'author': 'Majalah Wisata',
                        'description':
                            'Destinasi wisata, budaya lokal, dan keindahan alam.',
                        'image': 'assets/buku/teras.jpeg',
                      },
                      {
                        'title': 'KaWanku',
                        'author': 'Majalah Remaja',
                        'description':
                            'Artikel remaja, tips kecantikan, mode, dan cerita fiksi.',
                        'image': 'assets/buku/kawanku.jpg',
                      },
                    ];

                    return _buildBookCard(
                      title: magazines[index]['title']!,
                      author: magazines[index]['author']!,
                      description: magazines[index]['description']!,
                      image: magazines[index]['image']!,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for section headers with view all option
  Widget _buildSectionHeader(String title, VoidCallback onViewAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for banner images with overlay
  Widget _buildBannerImage(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookCard({
    required String title,
    required String author,
    required String description,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 140,
                    maxHeight: 170,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      letterSpacing: -0.1,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    author,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[800],
                      height: 1.3,
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
}
