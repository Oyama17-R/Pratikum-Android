import 'package:flutter/material.dart';

class Contohstatelfullwidget extends StatefulWidget {
  @override
  _ContohstatelfullwidgetState createState() => _ContohstatelfullwidgetState();
}

class _ContohstatelfullwidgetState extends State<Contohstatelfullwidget> {
  final TextEditingController _controllerPesan = TextEditingController();
  String _name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerPesan,
              decoration: InputDecoration(labelText: 'Masukkan Nama'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            Text(
              'Nama : $_name',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
