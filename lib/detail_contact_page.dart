import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wamobile/model/contact.dart';
import 'package:wamobile/presenter/contact_presenter.dart';

class DetailContactPage extends StatefulWidget {
  final Contact contact;

  DetailContactPage(this.contact);

  @override
  State<StatefulWidget> createState() {
    return _DetailContactPage();
  }
}

class _DetailContactPage extends State<DetailContactPage> {
  String _nameValue = "";
  String _phoneValue = "";
  String _messageValue = "";

  var editAble = false;
  var editButtonText = "Ubah";

  @override
  void initState() {
    super.initState();
    _nameValue = widget.contact.name ?? "";
    _phoneValue = widget.contact.phone ?? "";
  }

  var presenter = ContactPresenter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Kontak"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              _nameField(),
              _phoneField(),
              _buttonEdit(),
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
        enabled: editAble,
        initialValue: widget.contact.name,
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
        enabled: editAble,
        initialValue: widget.contact.phone,
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

  Widget _buttonEdit() {
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          if (!editAble) {
            setState(() {
              editAble = true;
              editButtonText = "Simpan";
            });
          } else {
            setState(() {
              editAble = false;
              editButtonText = "Ubah";
              updateContact();
            });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit),
            Text(
              editButtonText,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
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

  void updateContact() async {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      await presenter.editContact(widget.contact.phone, _nameValue, _phoneValue);
    } else {

    }
  }
}
