import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../component/custom_text_field.dart';
import '../model/contact.dart';
import '../presenter/contact_presenter.dart';

class EditContactPage extends StatefulWidget {
  final Contact? contact;

  const EditContactPage({required this.contact});

  @override
  State<StatefulWidget> createState() {
    return _EditContactPage();
  }
}

class _EditContactPage extends State<EditContactPage> {
  String _nameValue = "";
  String _phoneValue = "";

  var presenter = ContactPresenter();

  @override
  void initState() {
    super.initState();
    _nameValue = this.widget.contact?.name ?? "";
    _phoneValue = this.widget.contact?.phone ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Edit Kontak",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onSurface),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) {
            Navigator.pop(context, widget.contact);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
                  child: CustomTextField(
                    initialValue: _nameValue,
                    label: "Nama",
                    hintText: "Fulan",
                    onChanged: (String value) {
                      setState(() {
                        _nameValue = value;
                      });
                    },
                  )),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
                child: CustomTextField(
                  label: "Nomor Whatsapp",
                  hintText: "08xxxxxxxx",
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  initialValue: _phoneValue,
                  onChanged: (String value) {
                    setState(() {
                      _phoneValue = value;
                    });
                  },
                ),
              ),
              _buttonSave()
            ],
          ),
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
          initialValue: _nameValue,
          onChanged: (String value) {
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
          onChanged: (String value) {
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

  Widget _buttonSave() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
      child: ElevatedButton(
        onPressed: _saveContact,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),
        child: Padding(
          padding: EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
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
                  "Simpan Perubahan",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _saveContact() async {
    if (_nameValue.isNotEmpty && _phoneValue.isNotEmpty) {
      await presenter.editContact(
          widget.contact?.phone, _nameValue, _phoneValue);
      ScaffoldMessenger.of(context)
          .showSnackBar(_successSnackBar("Kontak berhasil disimpan."));
      Navigator.pop(context, Contact(name: _nameValue, phone: _phoneValue));
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
