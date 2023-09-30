
import 'package:get/get.dart';
import 'package:my_piggy_app/db/db_helper.dart';
import 'package:my_piggy_app/models/pakan.dart';


class PakanController extends GetxController{
  get text => null;


  var pakanList = <Pakan>[].obs;

 Future< int > addPakan({Future? showDialog, Pakan? pakan}) async{ 
  //Task model menjadi task object 
  return await DBHelper.insertPakan(pakan);
 }
 void getPakan() async {
  List<Map<String, dynamic>> pakan =await DBHelper.query5();
  pakanList.assignAll(pakan.map((datapakan) => Pakan.fromJson(datapakan)).toList());
 }
 
 
//   void deletepakan(Pakan pakan){
//    DBHelper.deletepakan(pakan);
//   getPakan();
//  }

 
}