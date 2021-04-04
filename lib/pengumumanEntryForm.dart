import 'package:informasi_mhs/pengumuman.dart';
import 'package:flutter/material.dart';

class PengumumanEntryForm extends StatefulWidget {
  final Pengumuman pengumuman;
  PengumumanEntryForm(this.pengumuman);

  @override
  PengumumanEntryFormState createState() =>
      PengumumanEntryFormState(this.pengumuman);
}

//class controller
class PengumumanEntryFormState extends State<PengumumanEntryForm> {
  Pengumuman pengumuman;
  PengumumanEntryFormState(this.pengumuman);
  TextEditingController judulController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // kondisi
    if (pengumuman != null) {
      judulController.text = pengumuman.judul;
      deskripsiController.text = pengumuman.deskripsi;
    }

    //ubah
    return Scaffold(
      appBar: AppBar(
        title: pengumuman == null ? Text('Tambah Pengumuman') : Text('ubah'),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            //Judul
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: judulController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'masukan judul'),
                onChanged: (value) {
                  //
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: deskripsiController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'masukan deskripsi'),
                onChanged: (value) {
                  //
                },
              ),
            ),
            // button
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  //simpan
                  Expanded(
                    child: ElevatedButton(
                      // color: Theme.of(context).primaryColorDark,
                      // textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if (pengumuman == null) {
                          //tambah data
                          pengumuman = Pengumuman(
                              judulController.text, deskripsiController.text);
                        } else {
                          //ubah data
                          pengumuman.judul = judulController.text;
                          pengumuman.deskripsi = deskripsiController.text;
                        }
                        Navigator.pop(context, pengumuman);
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  //tombol batal
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
