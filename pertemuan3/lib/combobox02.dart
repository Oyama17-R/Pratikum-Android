import 'package:flutter/material.dart';

class Combobox02 extends StatefulWidget {
  const Combobox02({super.key});

  @override
  _Combobox02State createState() => _Combobox02State();
}

class _Combobox02State extends State<Combobox02> {
  String? pilihKategori;
  String? pilihItem;
  
  final List<String> categories = ['Buah', 'Sayur'];

  final Map<String, List<String>> items = {
    'Buah': ['Apel', 'Jeruk', 'Pisang'],
    'Sayur': ['Bayam', 'Kangkung', 'Sawi'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ComboBox Bersarang'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: const Text('Pilih kategori:'),
              value: pilihKategori,
              onChanged: (String? kategori) {
                setState(() {
                  pilihKategori = kategori;
                  pilihItem = null;
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String kategori) {
                return DropdownMenuItem<String>(
                  value: kategori,
                  child: Text(kategori),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              hint: const Text('Pilih item:'),
              value: pilihItem,
              onChanged: (String? item) {
                setState(() {
                  pilihItem = item;
                });
              },
              items: pilihKategori == null
                  ? []
                  : items[pilihKategori]!.map<DropdownMenuItem<String>>((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
            ),
            Text(
              'Kategori: $pilihKategori',
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              'Item: $pilihItem',
              style: const TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
