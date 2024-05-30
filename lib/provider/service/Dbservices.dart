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
       "BRANCHCODE TEXT NOT NULL,"
       "ACCOUNT TEXT NOT NULL,"
       "CUSTID TEXT NOT NULL,"
       "DEPOSITCODE TEXT NOT NULL,"
       "tran_date_ad TEXT NOT NULL,"
       "tran_date_bs TEXT NOT NULL,"
       "CUSTOMERNAME TEXT NOT NULL,"
       "DEPOSIT TEXT NOT NULL"
       ")");
         await db.execute("CREATE TABLE POSTLOANCOLLECTION("
       "id INTEGER PRIMARY KEY AUTOINCREMENT,"
       "BRANCHCODE TEXT NOT NULL,"
       "ACCOUNT TEXT NOT NULL,"
       "CUSTID TEXT NOT NULL,"
       "DEPOSITCODE TEXT NOT NULL,"
       "tran_date_ad TEXT NOT NULL,"
       "tran_date_bs TEXT NOT NULL,"
       "CUSTOMERNAME TEXT NOT NULL,"
       "DEPOSIT TEXT NOT NULL"
       ")");
      await db.execute("CREATE TABLE ACCOUNTS("
       "id INTEGER PRIMARY KEY AUTOINCREMENT,"
       "CUSTID TEXT NOT NULL,"
       "CUSTOMERNAME TEXT NOT NULL,"
       "MOBILE TEXT NOT NULL,"
       "ACCOUNT TEXT NOT NULL,"
       "BAL INTEGER NOT NULL,"
       "DEPOSITTYPE TEXT NOT NULL,"
       "DEPOSITCODE TEXT NOT NULL,"
       "TYPE TEXT NOT NULL"
       ")");
      },
    );
  }
///POST SAVING COLLECTION
newsavingcollection(Entries newEntries) async {
  final db = await database;
  var res = await db.insert("POSTSAVINGCOLLECTION", newEntries.toJson());

  if (res != -1) {
    print("Data inserted successfully with ID: $res");
     var insertedData = await db.query("POSTSAVINGCOLLECTION", where: "id = ?", whereArgs: [res]);
    if (insertedData.isNotEmpty) {
      print("Inserted Data: ${insertedData.first}");
    
    } else {
      print("Failed to fetch inserted data");
    }
  } else {
    print("Failed to insert data");
  }
  
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

//account
newaccount(DepositAccounts newAccount) async {
  final db = await database;
  var res = await db.insert("ACCOUNTS", newAccount.toJson());
  if (res != -1) {
    print("Data inserted successfully with ID: $res");
    // Fetch the inserted data
    var insertedData = await db.query("ACCOUNTS", where: "id = ?", whereArgs: [res]);
    if (insertedData.isNotEmpty) {
      print("Inserted Data: ${insertedData.first}");
    
    } else {
      print("Failed to fetch inserted data");
    }
  } else {
    print("Failed to insert data");
  }
  return res;
}
  getaccount(int id) async {
    final db = await database;
    var res =await  db.query("ACCOUNTS", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? DepositAccounts.fromJson(res.first) : Null ;
  }

 Future<List<DepositAccounts>> getAllgetaccount() async { 
  final db = await database;
  var res = await db.query("ACCOUNTS");
  print(res);
  List<DepositAccounts> list = 
  res.isNotEmpty ? res.map((c) => DepositAccounts.fromJson(c)).toList() : [];
  return list;
}
  Future<List<DepositAccounts>>getAlldepositeaccount(String type) async {
  final db = await database;
  var res = await db.query("ACCOUNTS", where: "TYPE = ?", whereArgs: [type]);
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