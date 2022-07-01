import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wamobile/model/contact.dart';
import 'package:wamobile/presenter/contact_presenter.dart';

class CreateContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateContactPage();
  }
}

class _CreateContactPage extends State<CreateContactPage> {
  String _nameValue = "";
  String _phoneValue = "";
  String _messageValue = "";

  var presenter = ContactPresenter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tambah Kontak"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              _nameField(),
              _phoneField(),
              _messageField(),
              _buttonOpenWhatsapp()
            ],
          ),
        ));
  }

  Widget _nameField() {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextFormField(
        onChanged: (String value) {
          setState(() {
            _nameValue = value;
          });
        },
        maxLength: 50,
        decoration: InputDecoration(
          labelText: 'Nama',
          hintText: "Fulan",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }

  Widget _phoneField() {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextFormField(
        maxLength: 15,
        onChanged: (String value) {
          setState(() {
            _phoneValue = value;
          });
        },
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: 'Nomor Whatsapp',
          hintText: "0856xxx",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }

  Widget _messageField() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(16),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        minLines: null,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          labelText: 'Pesan',
          alignLabelWithHint: true,
          hintText: "Halo kakak",
          contentPadding: EdgeInsets.all(12),
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        onChanged: (String value) {
          setState(() {
            _messageValue = value;
          });
        },
      ),
    );
  }

  Widget _buttonOpenWhatsapp() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: _onButtonChatWAClicked,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              Text(
                "Chat di Whatsapp",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onButtonChatWAClicked() async {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      var contact = Contact(name: _nameValue,phone: _phoneValue);
      await presenter.addContact(contact);
      var phone = presenter.generatePhone(_phoneValue);
      Uri url = Uri(
          scheme: "https",
          host: "wa.me",
          path: "$phone",
          queryParameters: {'text': '$_messageValue'});
      if (!await launchUrl(
        url,
        mode: LaunchMode.platformDefault,
      )) {
        throw 'Could not launch $url';
      }
    } else {}
  }
}
