import 'package:flutter/material.dart';
import 'package:informasi_mhs/data_mhs.dart';
import 'package:informasi_mhs/data_nilai.dart';

class DrawerNav extends StatefulWidget {
  @override
  _DrawerNavState createState() => _DrawerNavState();
}

class _DrawerNavState extends State<DrawerNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Azalia Fira"),
              accountEmail: Text("azalia@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://data.whicdn.com/images/327744867/original.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.face),
              title: Text("Data Mahasiswa"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DataMhs())),
            ),
            ListTile(
              leading: Icon(Icons.library_add),
              title: Text("Nilai Mahasiswa"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => data_nilai())),
            ),
          ],
        ),
      ),
    );
  }
}
