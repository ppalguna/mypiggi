
import 'package:get/get.dart';
import 'package:my_piggy_app/db/db_helper.dart';

import '../models/pig.dart';


class PigController extends GetxController{
  get text => null;


  var pigList = <Pig>[].obs;

 Future< int > addPig({Future? showDialog, Pig? pig}) async{ 
  //Task model menjadi task object 
  return await DBHelper.insertpig(pig);
 }
 void getPig() async {
  List<Map<String, dynamic>> pig =await DBHelper.query4();
  pigList.assignAll(pig.map((datapig) => Pig.fromJson(datapig)).toList());
 }
  void deletepig(Pig pig){
   DBHelper.deletepig(pig);
  getPig();
 }

var dbh =DBHelper.calculateInduk();
var dbanakan =DBHelper.calculateAnakan();
var dbpenggemukan =DBHelper.totalGemukan();
//var dbpejantan =DBHelper.calculatePejantan();
var p =DBHelper.p();
}