
import 'package:get/get.dart';
import 'package:my_piggy_app/db/db_helper.dart';

import '../models/note.dart';


class NoteController extends GetxController{
  get text => null;


  @override
  void onReady(){
    super.onReady();
  }
  var taskList = <Note>[].obs;

 Future< int > addNote({Future? showDialog, Note? note}) async{ 
  //Task model menjadi task object 
  return await DBHelper.insertnote(note);
 }
 void getTask() async {
  List<Map<String, dynamic>> note =await DBHelper.query2();
  taskList.assignAll(note.map((datanote) => Note.fromJson(datanote)).toList());
 }
//  void getTask() async {
//   List<Map<String, dynamic>> tasks =await DBHelper.query();
//   taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
//  }
//  void delete(Task task){
//    DBHelper.delete(task);
//   getTask();
//  }
//  void markTaskCompleted(int id) async{
//  await DBHelper.update(id);
//  getTask();
//  }

}