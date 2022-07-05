import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Tentang Aplikasi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_header(), _about(), _footer()],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16, bottom: 16),
      alignment: Alignment.center,
      child: Text(
        "wa.me Mobile",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
            fontSize: 30),
      ),
    );
  }

  Widget _about() {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(bottom: 16),
      alignment: Alignment.center,
      child: Text(
        "Sering kali kita dihadapkan dalam situasi hendak menghubungi seseorang melalui aplikasi whatsapp "
        "namun dengan alasan tertentu kita merasa tidak perlu menyimpan nomor tersebut (seseorang yang hendak kita hubungi) di kontak kita. Karena itulah wa.me Mobile ini dibuat agar "
        "memudahkan user dalam menghubungi nomor whatsapp seseorang "
        "tanpa harus menyimpan nomor tujuannya ke kontak terlebih dahulu.",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black87, fontFamily: 'Nunito', fontSize: 16),
      ),
    );
  }

  Widget _footer() {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(bottom: 16),
      alignment: Alignment.center,
      child: Text(
        "Built with Flutter by nadhifhayazee",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
    );
  }
}
