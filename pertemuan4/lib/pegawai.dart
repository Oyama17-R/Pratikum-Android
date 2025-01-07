import 'package:flutter/material.dart';
import 'gaji.dart';
import 'slipgaji.dart';

class Pegawai extends StatefulWidget {
  const Pegawai({Key? key}) : super(key: key);

  @override
  State<Pegawai> createState() => _PegawaiState();
}

class _PegawaiState extends State<Pegawai> {
  String _nip = '';
  String _nama = '';
  String? _pilihanGolongan;
  String? _pilihanStatus;

  final TextEditingController nipController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController masaController = TextEditingController();

  var salary = Gaji();

  final List<String> golongan = ['I', 'II', 'III', 'IV'];
  final List<String> status = ['Menikah', 'Belum Menikah'];

  void _hitungGaji() {
    if (_nip.isEmpty || _nama.isEmpty || _pilihanGolongan == null || _pilihanStatus == null || masaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap isi semua data dengan lengkap')),
      );
      return;
    }

    try {
      salary.setGolongan(_pilihanGolongan);
      salary.setStatus(_pilihanStatus);
      salary.setMasaKerja(int.parse(masaController.text));

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Slipgaji(
            nip: _nip,
            nama: _nama,
            tunjGol: salary.tunjGapok(),
            tunjStatus: salary.tunjStatus(),
            tunjMasaKerja: salary.tunjMasaKerja(),
            gajiTotal: salary.gajiTotal(),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Terjadi kesalahan, cek input Anda')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaji Pegawai'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nipController,
              decoration: const InputDecoration(
                labelText: 'NIP',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _nip = value;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Pegawai',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _nama = value;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: golongan.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Golongan Pegawai',
                border: OutlineInputBorder(),
              ),
              value: _pilihanGolongan,
              onChanged: (String? value) {
                setState(() {
                  _pilihanGolongan = value;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: status.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Status Pegawai',
                border: OutlineInputBorder(),
              ),
              value: _pilihanStatus,
              onChanged: (String? value) {
                setState(() {
                  _pilihanStatus = value;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: masaController,
              decoration: const InputDecoration(
                labelText: 'Masa Kerja (tahun)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _hitungGaji,
              child: const Text('Hitung Gaji'),
            ),
          ],
        ),
      ),
    );
  }
}
