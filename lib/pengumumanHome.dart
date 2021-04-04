import 'package:flutter/material.dart';
import 'package:informasi_mhs/drawerNav.dart';

// ignore: camel_case_types
class pengumumanHome extends StatefulWidget {
  @override
  _pengumumanState createState() => _pengumumanState();
}

class _pengumumanState extends State<pengumumanHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcement'),
      ),
      drawer: DrawerNav(),
    );
  }
}
