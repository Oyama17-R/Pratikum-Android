import 'package:flutter/material.dart';

class Checkbox02 extends StatefulWidget {
  const Checkbox02({super.key});
  @override
  State<Checkbox02> createState() => _Checkbox02State();
}

class _Checkbox02State extends State<Checkbox02> {
  final List<String> _hobbies = <String>["Bermain Musik", "Membaca", "Menulis", "Menonton Film"];
  
  final Map<String, bool> _hobbySelections = {
    "Bermain Musik": false,
    "Membaca": false,
    "Menulis": false,
    "Menonton Film": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Hobi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Column(
              children: _hobbies.map((hobi) {
                return CheckboxListTile(
                  title: Text(hobi),
                  value: _hobbySelections[hobi],
                  onChanged: (bool? value) {
                    setState(() {
                      _hobbySelections[hobi] = value ?? false;
                    });
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Hobi yang dipilih : ${_hobbies.where((hobby) => _hobbySelections[hobby] == true).join(', ')}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
