import 'package:flutter/material.dart';
import 'data_mhs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambah Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataMhs(),
    );
  }
}
