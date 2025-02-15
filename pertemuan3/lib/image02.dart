import 'package:flutter/material.dart';

class Image02 extends StatelessWidget {
  const Image02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/gambar1.jpg'),
            Image.asset('assets/gambar2.jpg'),
            Image.asset('assets/gambar3.jpg'),
            Image.asset('assets/gambar4.jpg'),
            Image.asset('assets/gambar5.jpg'),
            Image.asset('assets/gambar6.jpg'),
            Image.asset('assets/gambar7.jpg'),
            Image.asset('assets/gambar8.jpg'),
          ],
        ),
      ),
    );
  }
}