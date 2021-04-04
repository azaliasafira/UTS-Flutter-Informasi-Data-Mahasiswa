import 'package:flutter/material.dart';
import 'package:informasi_mhs/dbhelper.dart';
import 'package:informasi_mhs/drawerNav.dart';
import 'package:informasi_mhs/pengumuman.dart';
import 'package:informasi_mhs/pengumumanEntryForm.dart';
import 'package:sqflite/sqflite.dart';

// ignore: camel_case_types
class pengumumanHome extends StatefulWidget {
  @override
  _PengumumanState createState() => _PengumumanState();
}

class _PengumumanState extends State<pengumumanHome> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Pengumuman> pengumumanList;

  @override
  Widget build(BuildContext context) {
    updateListView();
    if (pengumumanList == null) {
      pengumumanList = [];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcement'),
      ),
      drawer: DrawerNav(),
      body: Column(
        children: [
          Expanded(
            child: createListView(),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Tambah Data Pengumuman"),
                onPressed: () async {
                  var pengumuman =
                      await navigateToPengumumanEntryForm(context, null);
                  if (pengumuman != null) {
                    int result = await dbHelper.insertPengumuman(pengumuman);
                    if (result > 0) {
                      updateListView();
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Pengumuman> navigateToPengumumanEntryForm(
      BuildContext context, Pengumuman pengumuman) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return PengumumanEntryForm(pengumuman);
    }));
    return result;
  }

  createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(
                this.pengumumanList[index].judul,
                style: textStyle,
              ),
              subtitle: Text(this.pengumumanList[index].deskripsi),
              trailing: GestureDetector(
                child: Icon(Icons.delete),
                onTap: () async {
                  int result =
                      await dbHelper.delete(this.pengumumanList[index].id);
                  if (result > 0) {
                    updateListView();
                  }
                },
              ),
              onTap: () async {
                var pengumuman = await navigateToPengumumanEntryForm(
                    context, this.pengumumanList[index]);
                if (pengumuman != null) {
                  int result = await dbHelper.update(pengumuman);
                  if (result > 0) {
                    updateListView();
                  }
                }
              },
            ),
          );
        });
  }

  // update List Item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Pengumuman>> pengumumanListFuture =
          dbHelper.getPengumumanList();
      pengumumanListFuture.then((pengumumanList) {
        setState(() {
          this.pengumumanList = pengumumanList;
          this.count = pengumumanList.length;
        });
      });
    });
  }
}
