
import 'package:get/get.dart';
import 'package:my_piggy_app/db/db_helper.dart';

import '../models/profil.dart';


class ProfilController extends GetxController{
  get text => null;


  @override
  void onReady(){
    super.onReady();
  }
  var profilList = <Profil>[].obs;

 Future< int > addProfil({Future? showDialog, Profil? profil}) async{ 
  //Task model menjadi task object 
  return await DBHelper.insertprofil(profil);
 }
 void getProfil() async {
  List<Map<String, dynamic>> profil =await DBHelper.query3();
  profilList.assignAll(profil.map((dataprofil) => Profil.fromJson(dataprofil)).toList());
 }
//  void getTask() async {
//   List<Map<String, dynamic>> tasks =await DBHelper.query();
//   taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
//  }
//  void delete(Task task){
//    DBHelper.delete(task);
//   getTask();
//  }
void updateprofil(int id) async{
await DBHelper.update(id);
getProfil();
}

}