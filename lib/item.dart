class Item {
  int _id;
  int _nim;
  String _name;
  String _kelas;
  String _jurusan;
  String _jk;
  String _almt;

  int get id => _id;

  get nim => this._nim;
  set nim(int value) => this._nim = value;

  String get name => this._name;
  set name(String value) => this._name = value;

  String get kelas => this._kelas;
  set kelas(String value) => this._kelas = value;

  String get jurusan => this._jurusan;
  set jurusan(String value) => this._jurusan = value;

  String get jk => this._jk;
  set jk(String value) => this._jk = value;

  get almt => this._almt;
  set almt(value) => this._almt = value;

  // konstruktor versi 1
  Item(this._nim, this._name, this._kelas, this._jurusan, this._jk, this._almt);

  // konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nim = map['nim'];
    this._name = map['name'];
    this._kelas = map['kelas'];
    this._jurusan = map['jurusan'];
    this._jk = map['jk'];
    this._almt = map['alamat'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nim'] = nim;
    map['name'] = name;
    map['kelas'] = kelas;
    map['jurusan'] = jurusan;
    map['jk'] = jk;
    map['alamat'] = almt;
    return map;
  }
}
