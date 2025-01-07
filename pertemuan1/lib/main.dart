import 'package:flutter/material.dart';
import 'package:pertemuan01/kolom.dart';
import 'package:pertemuan01/baris.dart';
import 'package:pertemuan01/kotak.dart';
import 'studikasus01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 01',
      home: Studikasus01(),
    );
  }
}

