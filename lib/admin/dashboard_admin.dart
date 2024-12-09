import 'package:flutter/material.dart';
import '../login_screen.dart';
import 'akses_buku.dart';
import 'kategori_buku.dart';
import 'akses_peminjaman.dart';
import 'arsip_peminjaman.dart';
import 'akses_akun.dart';
import 'akses_sanksi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeAdminScreen(),
    );
  }
}

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void _logout(BuildContext context) async {
    final confirmLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi Logout"),
        content: const Text("Apakah Anda yakin ingin logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false), // Tutup dialog
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true), // Konfirmasi logout
            child: const Text("Logout"),
          ),
        ],
      ),
    );

    if (confirmLogout == true) {
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false, // Hapus semua halaman sebelumnya dari stack
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Admin"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Card
          // Grid Menu
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  DashboardItem(
                    icon: Icons.bookmark_add,
                    label: 'Akses Buku',
                    onTap: () =>
                        navigateToScreen(context, const AksesBukuScreen()),
                  ),
                  DashboardItem(
                    icon: Icons.category,
                    label: 'Kategori Buku',
                    onTap: () =>
                        navigateToScreen(context, const KategoriBukuScreen()),
                  ),
                  DashboardItem(
                    icon: Icons.calendar_today,
                    label: 'Akses Peminjaman',
                    onTap: () => navigateToScreen(
                        context, const AksesPeminjamanScreen()),
                  ),
                  DashboardItem(
                    icon: Icons.checklist,
                    label: 'Arsip Peminjaman',
                    onTap: () => navigateToScreen(
                        context, const ArsipPeminjamanScreen()),
                  ),
                  DashboardItem(
                    icon: Icons.person,
                    label: 'Akses Akun',
                    onTap: () =>
                        navigateToScreen(context, const AksesAkunScreen()),
                  ),
                  DashboardItem(
                    icon: Icons.warning,
                    label: 'Akses Sanksi',
                    onTap: () =>
                        navigateToScreen(context, const AksesSanksiScreen()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const DashboardItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 2.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40.0, color: Colors.blue),
            const SizedBox(height: 8.0),
            Text(label, style: const TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
