import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_piggy_app/db/db_helper.dart';

import '../models/profil.dart';

class ProfilController extends GetxController {
  get text => null;

  static ProfilController get to => Get.isRegistered<ProfilController>()
      ? Get.find<ProfilController>()
      : Get.put(ProfilController());

  var profilList = <Profil>[].obs;

  final TextEditingController namaPeternakController = TextEditingController();
  final TextEditingController namaPeternakanController =
      TextEditingController();

  List<Map<String, dynamic>>? profil;

  @override
  void onReady() {
    super.onReady();
    getProfil();
  }

  Future<int> addProfil({Future? showDialog, Profil? profil}) async {
    //Task model menjadi task object
    return await DBHelper.insertprofil(profil);
  }

  void getProfil() async {
    List<Map<String, dynamic>> profil = await DBHelper.query3();
    profilList.assignAll(
        profil.map((dataprofil) => Profil.fromJson(dataprofil)).toList());

    if (profilList.isNotEmpty) {
      namaPeternakController.text = profilList.first.namaPeternak ?? "";
      namaPeternakanController.text = profilList.first.namaPeternakan ?? "";
    }
  }

  void updateprofil(int id) async {
    await DBHelper.update(id);

    getProfil();
  }
}
