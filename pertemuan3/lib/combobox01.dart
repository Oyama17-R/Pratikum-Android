import 'package:flutter/material.dart';

class Combobox01 extends StatefulWidget {
  const Combobox01({super.key});

  @override
  _Combobox01State createState() => _Combobox01State();
}

class _Combobox01State extends State<Combobox01> {
  String? itemPilihan;
  final List<String> listItem = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh ComboBox01'),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              hint: const Text('Pilih item:'),
              value: itemPilihan,
              onChanged: (String? pilihannya) {
                setState(() {
                  itemPilihan = pilihannya;
                });
              },
              items: listItem.map<DropdownMenuItem<String>>((String isi) {
                return DropdownMenuItem<String>(
                  value: isi,
                  child: Text(isi),
                );
              }).toList(),
            ),
            Text(
              'Pilihan: $itemPilihan',
              style: const TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
