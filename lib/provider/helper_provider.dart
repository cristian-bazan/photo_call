import 'package:flutter/material.dart';
import 'package:photo_call/dataBase/contacts.dart';
import 'package:photo_call/dataBase/helper.dart';

class HelperProvider with ChangeNotifier {
  HelperProvider() {
    getContact();
  }
  Helper database = Helper();
  List<Contact> contactos = [];

  Future<void> saveContact(Contact contacto) async {
    database.insertDB(contacto);
    getContact();
  }

  Future<void> getContact() async {
    contactos = await database.getDB();
  }
}
