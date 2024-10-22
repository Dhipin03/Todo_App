import 'package:sqflite/sqflite.dart';

class TodoScreenController {
  static late Database mydatabase;
  static List<Map> tasklist = [];
  static List<Map> userlist = [];
  static List<Map> loginresult = [];
  static Map<dynamic, dynamic> currentUser = {};
  static bool islogined = false;
  static Future initdb() async {
    mydatabase = await openDatabase('todotask2.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)');
      await db.execute(
          'CREATE TABLE todotask (id INTEGER PRIMARY KEY, task TEXT, user_id INTEGER, FOREIGN KEY (user_id) REFERENCES user(id))');
    });
  }

  static Future addUser(String name, String email, String password) async {
    await mydatabase.rawInsert(
        'INSERT INTO user(name, email, password) VALUES(?, ?, ?)',
        [name, email, password]);
    print(name);
  }

  static Future addtask(String task) async {
    if (currentUser.isEmpty) {
      throw Exception("No user logged in");
    }
    await mydatabase.rawInsert(
        'INSERT INTO todotask(task, user_id) VALUES(?, ?)',
        [task, currentUser['id']]);
  }

  static Future getUser() async {
    userlist = await mydatabase.rawQuery('SELECT * FROM user');
  }

  static Future gettask() async {
    if (currentUser.isEmpty) {
      throw Exception("No user logged in");
    }
    tasklist = await mydatabase.rawQuery(
        'SELECT * FROM todotask WHERE user_id = ?', [currentUser['id']]);
  }

  static Future<bool> isRegistered(String email, String password) async {
    loginresult = await mydatabase.rawQuery(
        'SELECT * FROM user WHERE email = ? AND password = ?',
        [email, password]);
    if (loginresult.isNotEmpty) {
      currentUser = loginresult.first;
      return true;
    }
    islogined = false;
    return false;
  }

  static Future deletetask(int taskId) async {
    if (currentUser.isEmpty) {
      throw Exception("No user logged in");
    }
    await mydatabase.rawDelete(
        'DELETE FROM todotask WHERE id = ? AND user_id = ?',
        [taskId, currentUser['id']]);
    await gettask();
  }

  static Future logout() async {
    currentUser = {};
    tasklist = [];
    islogined = false;
  }
}
