import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/contact.dart';
import '../presenter/contact_presenter.dart';
import '../widget/chat_whatsapp_button.dart';

class InsertContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InsertContactPage();
  }
}

class _InsertContactPage extends State<InsertContactPage> {
  String _nameValue = "";
  String _phoneValue = "";
  String _messageValue = "";

  var presenter = ContactPresenter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Buat Kontak",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [_nameField(), _phoneField(), _messageField(), _button()],
        ),
      ),
    );
  }

  Widget _nameField() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 10),
      child: Column(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Text(
              "Nama",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey),
            )),
        TextFormField(
          onChanged: (String value){
            setState(() {
              _nameValue = value;
            });
          },
          decoration: InputDecoration(
              fillColor: Color(0xFFF2F4F6),
              filled: true,
              hintText: "Fulan",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  ))),
        )
      ]),
    );
  }

  Widget _phoneField() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
      child: Column(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Text(
              "Nomor Whatsapp",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey),
            )),

        TextFormField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLength: 15,
          onChanged: (String value){
            setState(() {
              _phoneValue = value;
            });
          },
          decoration: InputDecoration(
              fillColor: Color(0xFFF2F4F6),
              filled: true,
              hintText: "08xxxxxxxx",
              counterText: "",
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  ))),
        )
      ]),
    );
  }

  Widget _messageField() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
      child: Column(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Text(
              "Pesan (Optional)",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey),
            )),
        Container(
          padding: EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 4),
          height: 120,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xFFF2F4F6)),
              color: Color(0xFFF2F4F6),
              borderRadius: BorderRadius.circular(30)),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            minLines: null,
            maxLines: null,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: "Halo kakak",
              contentPadding: EdgeInsets.all(12),
              border: InputBorder.none,
              isDense: true,
            ),
            onChanged: (String value) {
              setState(() {
                _messageValue = value;
              });
            },
          ),
        ),
      ]),
    );
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_buttonChatWhatsapp(), _buttonSave()],
      ),
    );
  }

  Widget _buttonChatWhatsapp() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 6, top: 30, bottom: 30),
        child: ChatWhatsappButton(
          phoneNumber: _phoneValue,
          message: this._messageValue,
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          child: Padding(
            padding: EdgeInsets.only(left: 4, top: 12, bottom: 12, right: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 6, right: 6),
                    child: Image.asset(
                      "images/whatsapp.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    "Chat Whatsapp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonSave() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 6, top: 30, bottom: 30),
        child: ElevatedButton(
          onPressed: _saveContact,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.blue)))),
          child: Padding(
            padding: EdgeInsets.only(left: 4, top: 12, bottom: 12, right: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 6, right: 6),
                    child: Icon(
                      Icons.save,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    "Simpan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveContact() async {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      var contact = Contact(name: _nameValue, phone: _phoneValue);
      bool addContact = await presenter.addContact(contact);
      if (addContact) {
        ScaffoldMessenger.of(context)
            .showSnackBar(_successSnackBar("Kontak berhasil ditambahkan"));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(_errorSnackBar(
            "Kontak gagal disimpan. Nomor whatsapp sudah pernah disimpan"));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(_errorSnackBar("Nama dan nomor whatsapp harus diisi!"));
    }
  }

  SnackBar _successSnackBar(String message) {
    return SnackBar(content: Text(message));
  }

  SnackBar _errorSnackBar(String message) {
    return SnackBar(backgroundColor: Colors.red, content: Text(message));
  }
}
