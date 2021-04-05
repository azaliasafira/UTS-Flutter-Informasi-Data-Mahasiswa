import 'package:flutter/material.dart';
import 'package:informasi_mhs/dbhelper.dart';
import 'package:informasi_mhs/drawerNav.dart';
import 'package:sqflite/sqflite.dart';
import 'package:informasi_mhs/entryform.dart';
import 'item.dart';
import 'dart:async';

class DataMhs extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<DataMhs> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Item> itemList;

  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    // updateListView();
    if (itemList == null) {
      itemList = [];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Data Mahasiswa'),
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
                child: Text("Tambah Item"),
                onPressed: () async {
                  var item = await navigateToEntryForm(context, null);
                  if (item != null) {
                    int result = await dbHelper.insert(item);
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

  Future<Item> navigateToEntryForm(BuildContext context, Item item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(item);
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
              this.itemList[index].name,
              style: textStyle,
            ),
            subtitle: Text(this.itemList[index].nim.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                int result = await dbHelper.delete(this.itemList[index].id);
                if (result > 0) {
                  updateListView();
                }
              },
            ),
            onTap: () async {
              var item =
                  await navigateToEntryForm(context, this.itemList[index]);
              if (item != null) {
                int result = await dbHelper.update(item);
                if (result > 0) {
                  updateListView();
                }
              }
            },
          ),
        );
      },
    );
  }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Item>> itemListFuture = dbHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
