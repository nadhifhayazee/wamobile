import 'package:flutter/material.dart';
import 'package:wamobile/page/edit_contact_page.dart';
import 'package:wamobile/widget/chat_whatsapp_button.dart';

import '../component/custom_text_area.dart';
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Detail Kontak",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        iconTheme:
        IconThemeData(color: Theme.of(context).colorScheme.onSurface),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 12),
              child: Icon(
                Icons.account_circle_rounded,
                size: 120,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "${contactData?.name}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "${contactData?.phone}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 16, left: 16),
              margin: EdgeInsets.only(top: 8, bottom: 16),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Theme.of(context).colorScheme.secondary),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditContactPage(contact: this.contactData);
                  })).then((newContact) => {
                    if (newContact != null) {
                      _updateContactData(newContact)
                    }
                  });
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
                              color: Theme.of(context).colorScheme.onSecondary,
                            )),
                      ),
                      Flexible(
                        child: Text(
                          "Edit Kontak",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.bold),
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
      child: CustomTextArea(
        label: "Pesan (Opsional)",
        hintText: "Haloo Kakak...",
        onChanged: (String value) {
          setState(() {
            _messageValue = value;
          });
        },
      ),
    );
  }

  Widget _buttonChatWhatsapp() {
    return Container(
      margin: EdgeInsets.all(25),
      child: ChatWhatsappButton(
        phoneNumber: this.contactData?.phone ?? "",
        message: this._messageValue,
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
                  child: Image.asset(
                    "images/whatsapp.png",
                    width: 20,
                    height: 20,
                    color: Theme.of(context).colorScheme.onPrimary,

                  ),
                ),
              ),
              Flexible(
                child: Text(
                  "Chat di Whatsapp",
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

  _updateContactData(newContact) {
    setState(() {
      contactData = newContact;
    });
  }
}
