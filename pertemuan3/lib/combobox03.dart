import 'package:flutter/material.dart';

class Combobox03 extends StatefulWidget {
  const Combobox03({super.key});

  @override
  _Combobox03State createState() => _Combobox03State();
}

class _Combobox03State extends State<Combobox03> {
  String? selectedItem;
  final List<Map<String, dynamic>> Items = [
    {'value': 'Rumah', 'icon': Icons.home},
    {'value': 'Bintang', 'icon': Icons.star},
    {'value': 'Pengaturan', 'icon': Icons.settings},
    {'value': 'Pengguna', 'icon': Icons.person},];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ComboBox dan Icon'),
      ),
      body: Center(
        child: DropdownButton<String>(
          hint: const Text('Pilih item:'),
          value: selectedItem,
          onChanged: (String? item) {
            setState(() {
              selectedItem = item;
            });
          },
          items: Items.map<DropdownMenuItem<String>>((Map<String, dynamic> item) {
            return DropdownMenuItem<String>(
              value: item['value'],
              child: Row(
                children: [
                  Icon(item['icon']),
                  const SizedBox(width: 10),
                  Text(item['value']),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
