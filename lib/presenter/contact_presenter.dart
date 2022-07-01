import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wamobile/constant/constant.dart';
import 'package:wamobile/model/contact.dart';

class ContactPresenter {
  getContactList() async {
    var pref = await SharedPreferences.getInstance();
    var contacts = pref.getString(Constant.CONTACT_LIST);
    if (contacts != null) {
      return _getListContactObject(jsonDecode(contacts));
    } else {
      return <Contact>[];
    }
  }

  List<Contact> _getListContactObject(List<dynamic> list) {
    var contactList = <Contact>[];
    list.forEach((element) {
      print(jsonDecode(jsonEncode(element)));
      contactList.add(Contact.fromJson(jsonDecode(element)));
    });
    return contactList;
  }

  addContact(Contact contact) async {
    var pref = await SharedPreferences.getInstance();
    var contacts = [];
    var contactJson = pref.getString(Constant.CONTACT_LIST);
    if (contactJson != null) {
      contacts = jsonDecode(contactJson);
    }
    contacts.add(jsonEncode(contact.toJson()));
    pref.setString(Constant.CONTACT_LIST, jsonEncode(contacts));
  }

  editContact(String? oldPhone, String newName, String newPhone) async {
    var pref = await SharedPreferences.getInstance();
    List<Contact> contactList = await getContactList();
    contactList.forEach((element) {
      if (element.phone == oldPhone) {
        element.name = newName;
        element.phone = newPhone;
      }
    });
    var c = [];
    contactList.forEach((element) {
      c.add(jsonEncode(element.toJson()));
    });
    pref.setString(Constant.CONTACT_LIST, jsonEncode(c));
  }

  deleteContact(Contact contact) async {
    var pref = await SharedPreferences.getInstance();
    List<Contact> contactList = [];
    var contacts = await getContactList();
    contactList = contacts;
    if (contactList.isNotEmpty) {
      contactList.removeWhere((element) => element.phone == contact.phone);
      var c = [];
      contactList.forEach((element) {
        c.add(jsonEncode(element.toJson()));
      });
      pref.setString(Constant.CONTACT_LIST, jsonEncode(c));
    }
  }

  String generatePhone(String phoneInput) {
    var initialNum = phoneInput[0] + phoneInput[1];
    if (initialNum != '62'){
     return "62" + phoneInput.substring(1);
    }
    return phoneInput;
  }
}
