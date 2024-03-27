import 'package:photo_call/dataBase/contacts.dart';
import 'package:sqflite/sqflite.dart';

class Helper {
  Future<Database> open() async {
    return openDatabase(
      'contacts',
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE IF NOT EXISTS contacts (id INTEGER PRIMARY KEY, name TEXT, number TEXT, image TEXT)''');
      },
      version: 1,
    );
  }

  Future<void> insertDB(Contact contact) async {
    Database db = await open();
    //await db.rawInsert('''INSERT INTO Test(name, number, image) VALUES(${contact.name}, ${contact.number}, ${contact.image})''');
    db.insert('contacts', contact.toMap());
    db.close();
  }

  Future<List<Contact>> getDB() async {
    Database db = await open();
    List<Contact> lista = await (db.query('contacts',
        columns: ['name', 'number', 'image'], orderBy: 'id'));

    db.close();
    return lista;
  }
}
