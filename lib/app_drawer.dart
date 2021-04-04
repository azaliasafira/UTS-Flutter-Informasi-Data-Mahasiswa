import 'package:flutter/material.dart';
import 'package:informasi_mhs/data_mhs.dart';

void main() => runApp(AppDrawer());

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataMhs(),
    );
  }
}
