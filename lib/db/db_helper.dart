
import 'package:my_piggy_app/models/profil.dart';
import 'package:sqflite/sqflite.dart';

import '../models/note.dart';
import '../models/pig.dart';
import '../models/task.dart';

class DBHelper{
  static Database? _db;
  static final int _version=1;
  static final String _tableName="tasks";
  static final String _tableNote="note";
  static final String _tableProfil="profil";
  static final String _tablePig="pig";

  static Future <void> initDb() async{
    if(_db !=null){
      return;
    }
    try{
      String _path = await getDatabasesPath()+ 'tasks.db';
      _db=await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) async{
          print("Create new one");
          await db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title STRING, note TEXT, date STRING,"
            "startTime STRING, endTime STRING,"
            "remind INTEGER, repeat STRING,"
            "color INTEGER,"
            "isCompleted INTEGER)",
            
          );
          await  db.execute(
            "CREATE TABLE  $_tableNote("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "judul STRING, keterangan TEXT, date STRING,"
            "startTime STRING, endTime STRING,"
            "repeat STRING,"
            "color INTEGER,"
            "isCompleted INTEGER)",
            
          );
           await  db.execute(
            "CREATE TABLE  $_tableProfil("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "namaPeternak STRING,"
            "namaPeternakan STRING,"
            "foto STRING)",
            
          );
          await  db.execute(
            "CREATE TABLE  $_tablePig("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "jenisTernak STRING, tipeUpdate STRING,"
            "catatanPig STRING, jumlah INTEGER)",
            
          );
          
        },
        

      );
    }catch(e){
      print(e);
    }
  }
  //Task-------------------------------------------------------------------
   static Future<List<Map<String, dynamic>>> query() async{
    print("query jadwal function called ");
    return await _db!.query(_tableName);
  }
  static Future<int> insert(Task? task)async{
    print("insert jadwal funtion called");
    return await _db?.insert(_tableName, task!.toJson())??1;
  }
 static delete(Task task) async {
  return await  _db!.delete(_tableName,where: 'id=?', whereArgs: [task.id]);
  }
  static update (int id) async{
    return await _db!.rawUpdate('''
  UPDATE tasks 
  SET isCompleted = ?
  WHERE id = ?
''',[1,id]);
  }


  //profil------------------------------------------------------------------
  static Future<List<Map<String, dynamic>>> query3() async{
    print("query profil function called ");
    return await _db!.query(_tableProfil);
  }
  static Future<int> insertprofil(Profil? profil)async{
    print("insert profil funtion called ");
    return await _db?.insert(_tableProfil, profil!.toJson())??3;
  }


  //note------------------------------------------------------------
   static Future<List<Map<String, dynamic>>> query2() async{
    print("query catatan function called " );
    return await _db!.query(_tableNote);
  }
 static Future<int> insertnote(Note? note)async{
    print("insert catatan funtion called ");
    return await _db?.insert(_tableNote, note!.toJson())??2;
  }
   static deletenote(Note note) async {
  return await  _db!.delete(_tableNote,where: 'id=?', whereArgs: [note.id]);
  }


  //pig----------------------------------------------------------------------
   static Future<List<Map<String, dynamic>>> query4() async{
    print("query pig function called " );
    return await _db!.query(_tablePig);
  }
  //piginsert
  static Future<int> insertpig(Pig? pig)async{
    print("insert pig funtion called ");
    return await _db?.insert(_tablePig, pig!.toJson())??2;
  }
  static deletepig(Pig pig) async {
  return await  _db!.delete(_tablePig,where: 'id=?', whereArgs: [pig.id]);
  }

  
}