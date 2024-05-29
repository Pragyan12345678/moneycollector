import 'dart:io';

import 'package:moneycollection/Model/DepositAccounts.dart';
import 'package:moneycollection/Model/Postdeposite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  //create a db client
  static final DatabaseHelper instance = DatabaseHelper._();
  DatabaseHelper._();


  //setup database
static Database? _database;
  Future<Database> get database async {
    if (_database != null)
    return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
  // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(await getDatabasesPath(), 'postcollection.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){

      },
      onCreate: ( Database db, int version)async{
       await db.execute("CREATE TABLE POSTSAVINGCOLLECTION("
       "id INTEGER PRIMARY KEY AUTOINCREMENT,"
       "BRANCHCODE TEXT,"
       "ACCOUNT TEXT,"
       "CUSTID TEXT,"
       "DEPOSITCODE TEXT,"
       "tran_date_ad TEXT,"
       "tran_date_bs TEXT,"
       "CUSTOMERNAME TEXT,"
       "DEPOSIT TEXT"
       ")");
         await db.execute("CREATE TABLE POSTLOANCOLLECTION("
       "id INTEGER PRIMARY KEY AUTOINCREMENT,"
       "BRANCHCODE TEXT,"
       "ACCOUNT TEXT,"
       "CUSTID TEXT,"
       "DEPOSITCODE TEXT,"
       "tran_date_ad TEXT,"
       "tran_date_bs TEXT,"
       "CUSTOMERNAME TEXT,"
       "DEPOSIT TEXT"
       ")");
      await db.execute("CREATE TABLE ACCOUNTS("
       "id INTEGER PRIMARY KEY AUTOINCREMENT,"
       "cUSTID TEXT,"
       "cUSTOMERNAME TEXT,"
       "DEPOSITCODE TEXT,"
       "mOBILE TEXT,"
       "aCCOUNT TEXT,"
       "bAL TEXT,"
       "dEPOSITTYPE TEXT"
       "dEPOSITCODE TEXT"
       "tYPE TEXT"
       ")");
      },
    );
  }
///POST SAVING COLLECTION
   newsavingcollection(Entries newEntries) async {
    final db = await database;
    var res = await db.insert("POSTSAVINGCOLLECTION", newEntries.toJson());
    print("Inserted data: $newEntries");
    var insertedId = res as int; // Assuming the insert operation returns the ID of the inserted row
  var insertedData = await getsavingcollection(insertedId);
  print("Retrieved data: $insertedData");
    return res;
  }

  getsavingcollection(int id) async {
    final db = await database;
    var res =await  db.query("POSTSAVINGCOLLECTION", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Entries.fromJson(res.first) : Null ;
  }

  getAllgetsavingcollection() async {
    final db = await database;
    var res = await db.query("POSTSAVINGCOLLECTION");
    List<Entries> list =
        res.isNotEmpty ? res.map((c) => Entries.fromJson(c)).toList() : [];
    return list;
  }

  updatesavingcollection(Entries newEntries) async {
    final db = await database;
    var res = await db.update("POSTSAVINGCOLLECTION", newEntries.toJson(),
        where: "id = ?", whereArgs: [newEntries]);
    return res;
  }
   deletesavingcollection(int id) async {
    final db = await database;
    db.delete("POSTSAVINGCOLLECTION", where: "id = ?", whereArgs: [id]);
  }

  ///LOAN COLLECTION
   newloancollection(Entries newEntries) async {
    final db = await database;
    var res = await db.insert("POSTLOANCOLLECTION", newEntries.toJson());
    return res;
  }

  getloancollection(int id) async {
    final db = await database;
    var res =await  db.query("POSTLOANCOLLECTION", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Entries.fromJson(res.first) : Null ;
  }

  getAllgetloancollection() async {
    final db = await database;
    var res = await db.query("POSTLOANCOLLECTION");
    List<Entries> list =
        res.isNotEmpty ? res.map((c) => Entries.fromJson(c)).toList() : [];
    return list;
  }

  updateloancollection(Entries newEntries) async {
    final db = await database;
    var res = await db.update("POSTLOANCOLLECTION", newEntries.toJson(),
        where: "id = ?", whereArgs: [newEntries]);
    return res;
  }
deleteloancollection(int id) async {
    final db = await database;
    db.delete("POSTLOANCOLLECTION", where: "id = ?", whereArgs: [id]);
  }

    newaccount(DepositAccounts newAccount) async {
    final db = await database;
    var res = await db.insert("ACCOUNTS", newAccount.toJson());
    return res;
  }

  getaccount(int id) async {
    final db = await database;
    var res =await  db.query("ACCOUNTS", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? DepositAccounts.fromJson(res.first) : Null ;
  }

  getAllgetaccount() async {
    final db = await database;
    var res = await db.query("ACCOUNTS");
    List<DepositAccounts> list =
        res.isNotEmpty ? res.map((c) => DepositAccounts.fromJson(c)).toList() : [];
    return list;
  }

  updateaccount(DepositAccounts newAcccount) async {
    final db = await database;
    var res = await db.update("ACCOUNTS", newAcccount.toJson(),
        where: "id = ?", whereArgs: [newAcccount]);
    return res;
  }
deleteaccount(int id) async {
    final db = await database;
    db.delete("ACCOUNTS", where: "id = ?", whereArgs: [id]);
  }

  

}