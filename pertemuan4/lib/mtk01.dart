import 'package:flutter/material.dart';
import 'mtk02.dart';

class Mtk01 extends StatefulWidget {
  const Mtk01({Key? key}) : super(key: key);

  @override
  _Mtk01State createState() => _Mtk01State();
}

class _Mtk01State extends State<Mtk01> {
  final TextEditingController angka1 = TextEditingController();
  final TextEditingController angka2 = TextEditingController();
  String operation = '';

  void rumusPerhitunganMTK() {
    if (angka1.text.isEmpty || angka2.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap masukkan kedua angka')),
      );
      return;
    }

    try {
      double num1 = double.parse(angka1.text);
      double num2 = double.parse(angka2.text);
      double result = 0.0;

      switch (operation) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          result = (num2 != 0) ? num1 / num2 : double.infinity;
          break;
        default:
          return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Mtk02(hasil: result),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Input tidak valid')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perhitungan Matematika'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: angka1,
              decoration: const InputDecoration(
                hintText: 'Masukkan Angka 1',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: angka2,
              decoration: const InputDecoration(
                hintText: 'Masukkan Angka 2',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    operation = '+';
                    rumusPerhitunganMTK();
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    operation = '-';
                    rumusPerhitunganMTK();
                  },
                  child: const Text('-'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    operation = '*';
                    rumusPerhitunganMTK();
                  },
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    operation = '/';
                    rumusPerhitunganMTK();
                  },
                  child: const Text('/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
