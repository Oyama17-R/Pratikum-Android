import 'package:flutter/material.dart';
class HalamanKedua extends StatefulWidget {
  const HalamanKedua({Key? key}) : super(key: key);
  @override
  _HalamanKeduaState createState() => _HalamanKeduaState();
}

class _HalamanKeduaState extends State<HalamanKedua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Kedua'),
      ),
      body: Center(
        child: Text('INI HALAMAN KEDUA', style: TextStyle(color: Colors.blueAccent, fontSize: 20,),),
            
      ),
    );
  }
}