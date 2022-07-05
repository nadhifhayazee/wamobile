import 'package:flutter/material.dart';
import 'package:wamobile/page/edit_contact_page.dart';
import 'package:wamobile/widget/chat_whatsapp_button.dart';

import '../model/contact.dart';

class ContactDetailPage extends StatefulWidget {
  final Contact contact;

  const ContactDetailPage(this.contact);

  @override
  State<StatefulWidget> createState() {
    return _ContactDetailPage();
  }
}

class _ContactDetailPage extends State<ContactDetailPage> {
  Contact? contactData;
  String _messageValue = "";

  @override
  void initState() {
    super.initState();
    contactData = this.widget.contact;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Detail Kontak",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 12),
              child: Image.asset(
                'images/person.png',
                width: 120,
                height: 120,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "${contactData?.name}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "${contactData?.phone}",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 16, left: 16),
              margin: EdgeInsets.only(top: 8, bottom: 16),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFF3F5F7)),
                    shadowColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditContactPage(contact: this.contactData);
                  })).then((newContact) => _updateContactData(newContact));
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.edit,
                              color: Colors.grey,
                            )),
                      ),
                      Flexible(
                        child: Text(
                          "Edit Kontak",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            _messageField(),
            _buttonChatWhatsapp()
          ],
        ),
      ),
    );
  }

  Widget _messageField() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(12),
            child: Text(
              "Pesan (Optional)",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey),
            )),
        Container(
          padding: EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 4),
          height: 150,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xFFF2F4F6)),
              color: Color(0xFFF2F4F6),
              borderRadius: BorderRadius.circular(20)),
          child: TextField(
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

  Widget _buttonChatWhatsapp() {
    return Container(
      margin: EdgeInsets.all(25),
      child: ChatWhatsappButton(
        phoneNumber: this.contactData?.phone ?? "",
        message: this._messageValue,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                  child: Image.asset(
                    "images/whatsapp.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  "Chat di Whatsapp",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
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

  _updateContactData(newContact) {
    setState(() {
      contactData = newContact;
    });
  }
}
