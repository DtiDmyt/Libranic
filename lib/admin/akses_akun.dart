import 'package:flutter/material.dart';

class AksesAkunScreen extends StatelessWidget {
  const AksesAkunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> emailList = [
      'email1@example.com',
      'email2@example.com',
      'email3@example.com',
      'email4@example.com',
      'email5@example.com',
      'email6@example.com',
      'email7@example.com',
      'email8@example.com',
      'email9@example.com',
      'email10@example.com',
      'email11@example.com',
      'email12@example.com',
      'emai13@example.com',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Akses Akun"),
      ),
      body: ListView.builder(
        itemCount: emailList.length,
        itemBuilder: (context, index) {
          final email = emailList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(email),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Aksi untuk menghapus email
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Menghapus $email')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: AksesAkunScreen()));
}
