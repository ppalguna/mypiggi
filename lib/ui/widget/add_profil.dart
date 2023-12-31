import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_piggy_app/db/db_helper.dart';
import 'package:my_piggy_app/models/profil.dart';
import 'package:my_piggy_app/ui/widget/input_field.dart';
import 'package:my_piggy_app/ui/widget/utils.dart';

import '../../controllers/profil_controller.dart';
import '../theme.dart';
import 'button.dart';


class editProfil extends StatefulWidget {
  const editProfil({super.key});

  @override
  State<editProfil> createState() => _editProfilState();
}

class _editProfilState extends State<editProfil> {
  Uint8List? _image;
  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery,50);

    setState(() {
       _image = img; 
    });
   
  }
  final ProfilController _profilController = Get.put(ProfilController());
  //  final TextEditingController _namaPeternakController = TextEditingController();
  //  final TextEditingController _namaPeternakanController= TextEditingController();
  DBHelper mydb = DBHelper();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
        title: 
        Text(
          'Edit Profil',
          style: subStyle.copyWith(
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: context.theme.dialogBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Get.isDarkMode?Colors.white:Colors.black,
          
        ),
    
      ),
      body: Container(
         color: context.theme.dialogBackgroundColor,
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
             Stack(
              children: [
                _image != null?
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),

                  ):

                const CircleAvatar(
                  radius: 64,
                  backgroundImage:AssetImage('images/profil.jpg'),
                  
                ),Positioned(bottom: -10,
                left: 80,child: IconButton(
                  onPressed: selectImage,
                  icon: const Icon(Icons.add_a_photo),
                ),
                )
              ],
             ),
             Padding(
               padding: const EdgeInsets.all(30),
               
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyInputField(
                    title: "Nama Peternak",
                    hint: "Masukan nama anda",
                    controller: _profilController.namaPeternakController,
                  ),
                  MyInputField(
                    title: "Nama Peternakan",
                    hint: "Masukan nama peternakan ",
                    controller: _profilController.namaPeternakanController,
                  ),
             
                   SizedBox(
                       width: MediaQuery.of(context).size.width/0.2,
                       height: MediaQuery.of(context).size.height/6.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
                            MyBotton(label: "Simpan ", onTap: () {
                              _addProfilToDb();
                              Get.snackbar(
                                "Sukses",
                                "Input Profil Berhasil",
                              snackPosition:  SnackPosition.BOTTOM,
                              backgroundColor: primaryClr,
                              icon: const Icon(Icons.beenhere_outlined,color: Colors.white,) ,
                              colorText: Colors.white,
                              
                              );  
                               
                            }) 
                           
                          ],
                        ),
                        
                      )
                  
                ],
                           ),
             )
            ],
            
          ),
          
        ),
        
        
      
      
    );
    
  }
  _addProfilToDb() async {
 int value = await _profilController.addProfil(
  profil : Profil(
    id: 1,
        //  namaPeternak : _namaPeternakController.text,
        //  namaPeternakan: _namaPeternakanController.text,
        namaPeternak: _profilController.namaPeternakController.text,
        namaPeternakan: _profilController.namaPeternakanController.text,
     foto: _image.toString(),
    ),
  );

  
  
  print("my id profil is"+" $value");
    _profilController.update(['header/profile']);
  _profilController.getProfil();
  
}
}