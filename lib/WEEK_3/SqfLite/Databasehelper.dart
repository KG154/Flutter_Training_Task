import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> CreateDataBase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE MyData (id INTEGER PRIMARY KEY, tname TEXT, temail TEXT, tpass TEXT,image STRING)');
    });
    return database;
  }

  Future<void> insertdata(
      Database database, String name, String email, String password,
      [String? image]) async {
    String qry =
        "insert into MyData(tname,temail,tpass,image) values('$name','$email','$password','$image')";
    var cnt = await database.rawInsert(qry);
    print(cnt);
  }

  Future<List<Map>> viewdata(Database database) async {
    String qry = "select * from MyData";
    List<Map> list = await database.rawQuery(qry);
    return list;
  }

  static deleteUser(Database database, int userid) async {
    String qry = "delete from MyData where id = '$userid'";
    await database.rawDelete(qry);
  }

  Future<void> updateData(
      Database database, int userid, String name, String email, String password,
      [String? image]) async {
    String qry =
        "update MyData set tname = '$name',temail = '$email',tpass = '$password' ,image='$image' where id = '$userid'";
    await database.rawUpdate(qry);
  }
}
