class Item {
  int _id;
  int _nim;
  String _name;
  String _kelas;
  String _alamat;
  String _jurusan;
  String _jk;

  int get id => _id;

  get nim => this._nim;
  set nim(int value) => this._nim = value;

  String get name => this._name;
  set name(String value) => this._name = value;

  String get kelas => this._kelas;
  set kelas(String value) => this._kelas = value;

  String get alamat => this._alamat;
  set alamat(String value) => this.alamat = value;

  String get jurusan => this._jurusan;
  set jurusan(String value) => this._jurusan = value;

  String get jk => this._jk;
  set jk(String value) => this._jk = value;

  // konstruktor versi 1
  Item(this._nim, this._name, this._kelas, this._alamat, this._jurusan,
      this._jk);

  // konstruktor versi 2: konversi dari Map ke Item
  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nim = map['nim'];
    this._name = map['name'];
    this._kelas = map['kelas'];
    this._alamat = map['alamat'];
    this._jurusan = map['jurusan'];
    this._jk = map['jk'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nim'] = nim;
    map['name'] = name;
    map['kelas'] = kelas;
    map['alamat'] = alamat;
    map['jurusan'] = jurusan;
    map['jk'] = jk;
    return map;
  }
}
