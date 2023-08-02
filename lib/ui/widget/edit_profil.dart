import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class editProfil extends StatefulWidget {
  const editProfil({super.key});

  @override
  State<editProfil> createState() => _editProfilState();
}

class _editProfilState extends State<editProfil> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
        title: 
        Text('Edit Profil', style: subStyle,),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Container(
          child: IconButton(
            onPressed: ()=>Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
            color: Get.isDarkMode?Colors.white:Colors.black,
            
          ),
        ),
    
      ),
    );
  }
}