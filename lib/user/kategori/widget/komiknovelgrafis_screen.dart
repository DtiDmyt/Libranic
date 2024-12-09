import 'package:flutter/material.dart';
import '../../rules/tatatertib_peminjaman.dart';

class KomiknovelgrafisScreen extends StatelessWidget {
  const KomiknovelgrafisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Book> books = [
      //Komik
      Book(
        title: 'Si Juki: Kisah Kusut Dunia Dongeng',
        author: 'Faza Meonk',
        publisher: 'Elex Media Komputindo',
        publicationYear: '2017',
        totalPages: '120 halaman',
        isbn: '978-602-02-9845-3',
        synopsis:
            'Si Juki, karakter humor khas Indonesia, kali ini terjebak di dunia dongeng yang penuh kekacauan. Cerita lucu dan segar untuk pembaca semua usia.',
        image: 'assets/buku/si_juki.jpg',
      ),
      Book(
        title: 'H2O Reborn',
        author: 'Sweta Kartika',
        publisher: 'Kosmik',
        publicationYear: '2018',
        totalPages: '160 halaman',
        isbn: '978-602-511-921-6',
        synopsis:
            'Petualangan seorang anak dengan kekuatan misterius yang mencoba menyelamatkan bumi dari kehancuran ekologis.',
        image: 'assets/buku/reborn.jpg',
      ),
      Book(
        title: 'Eggnoid',
        author: 'Archie The RedCat',
        publisher: 'Elex Media Komputindo',
        publicationYear: '2015',
        totalPages: '180 halaman',
        isbn: '978-602-02-6885-2',
        synopsis:
            'Cerita tentang seorang gadis bernama Ran yang menemukan seorang manusia misterius keluar dari telur raksasa di kamarnya.',
        image: 'assets/buku/eggnoid.jpeg',
      ),
      Book(
        title: 'Garudayana',
        author: 'Is Yuniarto',
        publisher: 'KOLONI (Imprint Elex Media Komputindo)',
        publicationYear: '2010',
        totalPages: '150 halaman',
        isbn: '978-602-02-1734-8',
        synopsis:
            'Komik fantasi dengan latar cerita epik mitologi Indonesia, mengisahkan petualangan Kinara bersama Garuda dalam melawan musuh-musuh magis.',
        image: 'assets/buku/garudayana.jpg',
      ),
      //Novel
      Book(
        title: 'Si Anak Cahaya',
        author: 'Tere Liye',
        publisher: 'Republika',
        publicationYear: '2019',
        totalPages: '400 Halaman',
        isbn: '978-602-5734-71-5',
        synopsis:
            'Novel ini mengisahkan kehidupan Zaman, seorang anak dari keluarga sederhana di Belitong, yang memiliki semangat tinggi untuk belajar dan bertualang. Kisah ini sarat nilai-nilai tentang perjuangan, cinta, dan persahabatan.',
        image: 'assets/buku/si_anak_cahaya.jpeg',
      ),
      Book(
        title: 'Laskar Pelangi ',
        author: 'Andrea Hirata',
        publisher: 'Bentang Pustaka',
        publicationYear: '2005',
        totalPages: '529 halaman',
        isbn: '978-979-3062-79-3',
        synopsis:
            'Kisah tentang sepuluh anak dari keluarga miskin di Belitung yang berjuang mendapatkan pendidikan. Buku ini mengangkat nilai persahabatan, semangat belajar, dan harapan.',
        image: 'assets/buku/laskar_pelangi.jpg',
      ),
      Book(
        title: 'Teruslah Bodoh Jangan Pinter',
        author: 'Tere Liye',
        publisher: 'PT. Sabak Grib Nusantara',
        publicationYear: '1 Februari 2024',
        totalPages: '250 halaman',
        isbn: '978-602-1234-567',
        synopsis:
            'Apakah kalian akan menutup mata, tutup mulut, tidak peduli dengan apa yang terjadi? Atau...',
        image: 'assets/buku/TeruslahBodohJanganPintar.png',
      ),
      Book(
        title: 'Dilan: Dia adalah Dilanku Tahun 1990',
        author: 'Pidi Baiq',
        publisher: 'Pastel Books',
        publicationYear: '2014',
        totalPages: '332 halaman',
        isbn: '978-602-7870-41-1',
        synopsis:
            'Berlatar di Bandung tahun 1990, novel ini mengisahkan perjalanan cinta antara Dilan, seorang pemuda yang unik dan humoris, dengan Milea, gadis pindahan dari Jakarta.',
        image: 'assets/buku/dilan.jpg',
      ),
      Book(
        title: 'Tentang Kamu',
        author: 'Tere Liye',
        publisher: 'Republika',
        publicationYear: '2016',
        totalPages: '524 halaman',
        isbn: '978-602-5734-35-7',
        synopsis:
            'Kisah seorang pengacara muda yang menyelidiki kehidupan kliennya, Sri Ningsih, seorang perempuan sederhana dengan kisah hidup luar biasa.',
        image: 'assets/buku/tentang_kamu.jpeg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Komik & Novel'),
        backgroundColor: Colors.blue[300],
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookCard(book: books[index]);
        },
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String publisher;
  final String publicationYear;
  final String totalPages;
  final String isbn;
  final String synopsis;
  final String image;

  Book({
    required this.title,
    required this.author,
    required this.publisher,
    required this.publicationYear,
    required this.totalPages,
    required this.isbn,
    required this.synopsis,
    required this.image,
  });
}

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image section - Explicitly non-interactive
            Container( // Changed from SizedBox to Container
              width: 150,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Image.asset(
                  book.image,
                  height: 220,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 150,
                      height: 220,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported, color: Colors.grey),
                    );
                  },
                ),
              ),
            ),
            // Content section
            Expanded(
              child: Material( // Add Material widget
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => BookDetailDialog(book: book),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Penulis: ${book.author}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Penerbit: ${book.publisher}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Tahun Terbit: ${book.publicationYear}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Total Halaman: ${book.totalPages}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'ISBN: ${book.isbn}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          book.synopsis,
                          style: const TextStyle(fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookDetailDialog extends StatelessWidget {
  final Book book;

  const BookDetailDialog({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        book.title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    book.image,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 250,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Penulis: ${book.author}',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'Penerbit: ${book.publisher}',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'Tahun Terbit: ${book.publicationYear}',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'Total Halaman: ${book.totalPages}',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'ISBN: ${book.isbn}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              book.synopsis,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[200],
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Tutup'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[200],
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PeminjamanRulesScreen(),
              ),
            );
          },
          child: const Text('Pinjam Buku'),
        ),
      ],
    );
  }
}