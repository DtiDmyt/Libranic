import 'package:flutter/material.dart';

class MangaScreen extends StatelessWidget {
  const MangaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seni, Musik & Fotografi')),
      body: const Center(child: Text('Content for Seni, Musik & Fotografi')),
    );
  }
}