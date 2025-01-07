import 'package:flutter/material.dart';
import 'page02.dart';

class Page01 extends StatefulWidget {
  const Page01({Key? key}) : super(key: key);

  @override
  State<Page01> createState() => _Page01State();
}

class _Page01State extends State<Page01> {
  final String pnama = 'Rizky Khapidsyah';
  final String pnpm = '20180801168';  
  final String pprodi = 'Teknik Informatika';
  final String psemester = 'V';
  final List<String> listprogram = ['Dart', 'Java', 'PHP', 'Javascript', 'C++','Flutter'];
  final Map<String, String> mapData = {
    'IPS-1': '3.54',
    'IPS-2': '3.35',
    'IPS-3': '3.20',
    'Grade': 'Memuaskan',
  };

  @override
  Widget build(BuildContext){
    return Scaffold(appBar: AppBar(title: const Text('Halaman Pertama')),
    body: Center(
      child: ElevatedButton(
        child: const Text('Go to Page 02'),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Page02(
                npm: pnpm,
                nama: pnama,
                prodi: pprodi,
                semester: psemester,
                pemrograman: listprogram,
                mapData: mapData,

              ),
            ),
          );
        }),
    ),);
  }
}