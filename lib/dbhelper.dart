import 'package:informasi_mhs/pengumuman.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'item.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
//untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'informasi_mhs.db';
//create, read databases
    var itemDatabase = openDatabase(path,
        version: 12, onCreate: _createDb, onUpgrade: _onUpgrade);
//mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

//update tabel baru
  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _createDb(db, newVersion);
  }

//buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    var batch = db.batch();
    batch.execute('DROP TABLE IF EXISTS item');
    batch.execute('DROP TABLE IF EXISTS pengumuman');
    batch.execute('''
      CREATE TABLE item (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nim  INTEGER,
      name TEXT,
      kelas TEXT,
      jurusan TEXT,
      jk TEXT,
      alamat TEXT
      )
      ''');
    batch.execute('''
      CREATE TABLE pengumuman(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      judul TEXT,
      deskripsi TEXT
      )
    ''');
    await batch.commit();
  }

//select databases
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('item', orderBy: 'name');
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectPengumuman() async {
    Database db = await this.initDb();
    var mapList = await db.query('pengumuman', orderBy: 'judul');
    return mapList;
  }

//create databases
  Future<int> insert(Item object) async {
    Database db = await this.initDb();
    int count = await db.insert('item', object.toMap());
    return count;
  }

  Future<int> insertPengumuman(Pengumuman object) async {
    Database db = await this.initDb();
    int count = await db.insert('pengumuman', object.toMap());
    return count;
  }

//update databases
  Future<int> update(Item object) async {
    Database db = await this.initDb();
    int count = await db
        .update('item', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  Future<int> updatePengumuman(Pengumuman object) async {
    Database db = await this.initDb();
    int count = await db.update('pengumuman', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<int> deletePengumuman(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('pengumuman', where: 'id=?', whereArgs: [id]);
    return count;
  }

//list
  Future<List<Item>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Item> itemList = [];
    for (int i = 0; i < count; i++) {
      itemList.add(Item.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  Future<List<Pengumuman>> getPengumumanList() async {
    var pengumumanMapList = await selectPengumuman();
    int count = pengumumanMapList.length;
    List<Pengumuman> pengumumanList = [];
    for (int i = 0; i < count; i++) {
      pengumumanList.add(Pengumuman.fromMap(pengumumanMapList[i]));
    }
    return pengumumanList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
