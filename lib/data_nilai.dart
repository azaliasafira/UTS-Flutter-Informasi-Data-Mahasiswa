import 'package:flutter/material.dart';
import 'package:informasi_mhs/drawerNav.dart';

// ignore: camel_case_types
class data_nilai extends StatefulWidget {
  @override
  _DataNilaiState createState() => _DataNilaiState();
}

class _DataNilaiState extends State<data_nilai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Data Nilai Mahasiswa'),
      ),
      drawer: DrawerNav(),
    );
  }
}
