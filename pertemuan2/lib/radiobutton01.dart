import 'package:flutter/material.dart';

class Radiobutton01 extends StatefulWidget{
  const Radiobutton01({super.key});
  @override
 _Radiobutton01State createState() => _Radiobutton01State();
}

class _Radiobutton01State extends State<Radiobutton01>{
  String? _selectedOption ;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh Radio Button'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Pilih Hobi Anda :'),
            RadioListTile<String>(
              title: const Text('Bermain Musik'),
              value: 'Bermain Musik',
              groupValue: _selectedOption,
              onChanged: (String? value){
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Olahraga'),
              value: 'Olahraga',
              groupValue: _selectedOption,
              onChanged: (String? value){
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Membaca'),
              value: 'Membaca',
              groupValue: _selectedOption,
              onChanged: (String? value){
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                _selectedOption != null 
                ? 'Hobi yang dipilih : $_selectedOption'
                : 'Silakan pilih hobi',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}