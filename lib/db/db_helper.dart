
import 'dart:io';
import 'package:get/get.dart';
import 'package:my_piggy_app/models/pakan.dart';
import 'package:my_piggy_app/models/profil.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

import '../models/note.dart';
import '../models/pig.dart';
import '../models/task.dart';

class DBHelper{
  static Database? _db;
  static const int _version=1;
  static const String _tableName="tasks";
  static const String _tableNote="note";
  static const String _tableProfil="profil";
  static const String _tablePig="pig";
  static const String _tablePakan="pakan";

  static Future <void> initDb() async{
    if(_db !=null){
      return;
    }
    try{
      String _path = await getDatabasesPath()+ 'tasks.db';
      print('========= databasePath : $_path');
      Directory? externalStoragePath= await getExternalStorageDirectory();
      print('========= externalStoragePath : $externalStoragePath');
      _db=await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) async{
          print("Create new one");
          await db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title STRING, note TEXT, date STRING, tanggalLahir STRING,"
            "startTime STRING, endTime STRING,"
            "repeat STRING,"
            "color INTEGER,"
            "tanggalKebiri STRING,"
            "tanggalSapih STRING,"
            "isCompleted INTEGER)",
            
          );
          await  db.execute(
            "CREATE TABLE  $_tableNote("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "judul STRING, keterangan TEXT, date STRING,"
            "startTime STRING, endTime STRING,"
            "repeat STRING,"
            "color INTEGER,"
            "image BLOB,"
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
            "catatanPig STRING, "
            "color INTEGER,"
            "totalAnak INTEGER,"
            "totalInduk INTEGER,"
            "totalPejantan INTEGER,"
            "totalGemukan INTEGER,"
            "jumlah INTEGER,tanggal STRING)",
          );
           await  db.execute(
            "CREATE TABLE  $_tablePakan("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "tanggalPakan STRING, jumlahPakan INTEGER,"
            "hargaPakan INTEGER, "
            "catatanPakan STRING)",
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
  static Future<int>UpdateTask(int idTask,Map<String,dynamic>row)async{
    final querytask = await _db!.update(_tableName, row, where: 'id=?', whereArgs: [idTask]);
    return querytask;
  }
            // "isCompleted INTEGER
  //profil------------------------------------------------------------------
  static Future<List<Map<String, dynamic>>> query3() async{
    print("query profil function called ");
    return await _db!.query(_tableProfil);
  }
  static Future<int> insertprofil(Profil? profil)async{
    _db!.execute('delete from $_tableProfil');
    print("insert profil funtion called ");
    int count=await _db?.insert(_tableProfil, profil!.toJson())??3;
    return count;
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
  static updateNote (int id) async{
    return await _db!.rawUpdate('''
  UPDATE note 
  SET isCompleted = ?
  WHERE id = ?
''',[1,id]);
  }
   static Future<int>UpdateNote(int idNote,Map<String,dynamic>row)async{
    final queryNote = await _db!.update(_tableNote, row, where: 'id=?', whereArgs: [idNote]);
    return queryNote;
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

//pakan
  static Future<List<Map<String, dynamic>>> query5() async{
    print("query pakan function called ");
    return await _db!.query(_tablePakan);
  }
  static Future<int> insertPakan(Pakan? pakan)async{
    print("insert pakan funtion called");
    return await _db?.insert(_tablePakan, pakan!.toJson())??4;
  }
//calculate
  static Future calculateInduk()async{
   var db=  _db;
    var result = await db!.rawQuery("SELECT SUM(CASE tipeUpdate "
    "WHEN 'Masuk' THEN jumlah WHEN 'Keluar' THEN -jumlah END)"
    " AS totalInduk  FROM $_tablePig WHERE jenisTernak='Indukan'");
    print(result.toList());
    return result;
  }

static Future calculateAnakan()async{
   var db=  _db;
    var result = await db!.rawQuery("SELECT SUM(CASE tipeUpdate "
    "WHEN 'Masuk' THEN jumlah WHEN 'Keluar' THEN -jumlah END)"
    " AS totalAnak  FROM $_tablePig WHERE jenisTernak='Anakan'");
    print(result.toList());
    return result;
  }
  // static Future calculatePenggemukan()async{
  //   var db= _db;
  //   var result = await db!.rawQuery("SELECT SUM(jumlah) AS TOTALGEMUKAN FROM $_tablePig WHERE jenisTernak='Gemukan' AND tipeUpdate='Masuk'");
  //   print(result.toList());
  //   return result.toList();
  // }

static Future p()async{
    var db=  _db;
    var result = await db!.rawQuery("SELECT SUM(CASE tipeUpdate "
    "WHEN 'Masuk' THEN jumlah WHEN 'Keluar' THEN -jumlah END)"
    " AS totalPejantan  FROM $_tablePig WHERE jenisTernak='Pejantan'");
    print(result.toList());
    return result;
  }
static Future totalGemukan()async{
    var db=  _db;
    var result = await db!.rawQuery("SELECT SUM(CASE tipeUpdate "
    "WHEN 'Masuk' THEN jumlah WHEN 'Keluar' THEN -jumlah END)"
    " AS totalGemukan FROM $_tablePig WHERE jenisTernak='Gemukan' ");
    print(result.toList());
    return result.obs;
  }
}