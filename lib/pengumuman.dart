class Pengumuman {
  int _id;
  String _judul;
  String _deskripsi;

  int get id => this._id;

  String get judul => this._judul;
  set judul(String value) => this._judul = value;

  String get deskripsi => this._deskripsi;
  set deskripsi(String value) => this._deskripsi = value;

  //konstruktor Versi 1
  Pengumuman(this._judul, this._deskripsi);

  //konstruktor versi 2 : konversi dari Map ke Item
  Pengumuman.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._judul = map['judul'];
    this._deskripsi = map['deskripsi'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['judul'] = this._judul;
    map['deskripsi'] = this._deskripsi;
  }
}
