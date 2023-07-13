import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/ex_model.dart';

class DB_Helper {
  Database? database;

  final String dbPath = "dbase.db";
  final String dbTname="datatable";

  Future<Database?> creatDB() async {
    if (database != null) {
      return database;
    }
    else {
      return await ininDB();
    }
  }

  Future<Database> ininDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbPath);
    String query='CREATE TABLE $dbTname (id INTEGER PRIMARY KEY AUTOINCREMENT,amount INTEGER ,date TEXT,category TEXT,status )';
    return await openDatabase(path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute(query);
      },
    );
  }


  Future<void> insertinDb(ExpenceModel expenceModel)
  async{
    database = await creatDB();
    //return await database!.insert('expencetable',{'note':notes,'amount':amount,'date':dates,'status':status,'time':time,'category':category});
    await database!.insert(dbTname, {
      'category':expenceModel.category,
      'amount':expenceModel.amount,
      'date':expenceModel.date,
      'status':expenceModel.status,
      //'time':expenceModel.time,
    });
  }

  Future<List<Map>> read_Db()
  async {
    database= await creatDB();
    String query='SELECT * FROM $dbTname';
    List <Map> l1= await database!.rawQuery(query);
    return l1;

  }

  Future<void> read1_DB()
  async {
    database=await creatDB();
    String query1='SELECT * FROM $dbTname WHERE category="food"';

  }

  Future<void> deleteDb(int id)
  async {
    database=await creatDB();
    database!.delete(dbTname,where: "id=?",whereArgs: [id]);
  }


  Future<void> updateDB(ExpenceModel model)
  async {
    database = await creatDB();

    database!.update(dbTname, {
      'category':model.category,
      'amount': model.amount,
      'date': model.date,
      'status':model.status
    },where: "id=?",whereArgs:[model.id]
    );

  }




}