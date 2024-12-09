import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'user/home/home_screen.dart';
import 'user/kategori/category_screen.dart';
import 'user/profil/profile_screen.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBDWsVI3vRJ_uPl2mZvG9bTgioDxfNrD-w",
      authDomain: "libranic-xipplg2.firebaseapp.com",
      projectId: "libranic-xipplg2",
      storageBucket: "libranic-xipplg2.appspot.com",
      messagingSenderId: "792683162228",
      appId: "1:792683162228:web:0dd25003490daa27ac7f21",
    ),
  );
  runApp(const LibranicApp());
}

class LibranicApp extends StatelessWidget {
  const LibranicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Libranic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // Mulai dari halaman SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Fungsi untuk memeriksa status login
  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email =
        prefs.getString('email'); // Mendapatkan email dari SharedPreferences

    if (email != null) {
      // Jika email ada, arahkan ke halaman utama
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
            builder: (context) =>
                const MainScreen()), // Ganti dengan halaman utama Anda
      );
    } else {
      // Jika email tidak ada, arahkan ke halaman login
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()), // Menampilkan loading
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(), // Halaman Beranda
    const CategoryScreen(), // Halaman Kategori
    const ProfileScreen(), // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libranic'),
        backgroundColor: Colors.blue[200],
        foregroundColor: Colors.black,
        actions: [
          // Container pencarian
          Container(
            width: 210, // Lebar dari input pencarian
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          ),
          const SizedBox(width: 8), // Memberikan jarak antar elemen
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Aksi notifikasi
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
