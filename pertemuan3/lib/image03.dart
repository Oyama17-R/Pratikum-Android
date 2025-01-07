import 'package:flutter/material.dart';

class Image03 extends StatelessWidget {
  const Image03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImageCard('assets/gambar1.jpg', Colors.red),
            buildImageCard('assets/gambar2.jpg', Colors.green),
            buildImageCard('assets/gambar3.jpg', Colors.blue),
            buildImageCard('assets/gambar4.jpg', Colors.yellow),
            buildImageCard('assets/gambar5.jpg', Colors.orange),
            buildImageCard('assets/gambar6.jpg', Colors.purple),
            buildImageCard('assets/gambar7.jpg', Colors.blueGrey),
            buildImageCard('assets/gambar8.jpg', Colors.brown),

          ],
        ),
      ),
    );
  }
  Widget buildImageCard(String image, Color color) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
      
      child: Image.asset(
      image,
      fit: BoxFit.cover,
      height: 300,
      width: double.infinity,
      ),
      ),
    );
  }
}