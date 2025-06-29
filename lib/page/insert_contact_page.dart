import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wamobile/component/custom_text_area.dart';
import 'package:wamobile/component/custom_text_field.dart';

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
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Tambah Kontak",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onSurface),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
                child: CustomTextField(
                  label: "Nama",
                  hintText: "Fulan",
                  onChanged: (String value) {
                    setState(() {
                      _nameValue = value;
                    });
                  },
                )),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
              child: CustomTextField(
                label: "Nomor Whatsapp",
                hintText: "08xxxxxxxx",
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (String value) {
                  setState(() {
                    _phoneValue = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
              child: CustomTextArea(
                label: "Pesan (Opsional)",
                hintText: "Haloo Kakak...",
                onChanged: (String value) {
                  setState(() {
                    _messageValue = value;
                  });
                },
              ),
            ),
            _button()
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_buttonChatWhatsapp(), SizedBox(width: 8), _buttonSave()],
      ),
    );
  }

  Widget _buttonChatWhatsapp() {
    return Expanded(
      child: ChatWhatsappButton(
        phoneNumber: _phoneValue,
        message: this._messageValue,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.secondary),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),
        child: Padding(
          padding: EdgeInsets.only(top: 12, bottom: 12,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 6, right: 6),
                  child: Image.asset(
                    "images/whatsapp.png",
                    width: 20,
                    height: 20,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  "Chat",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonSave() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 30),
        child: ElevatedButton(
          onPressed: _saveContact,
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.primary),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ))),
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
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    "Simpan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
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
        Navigator.pop(context);
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
