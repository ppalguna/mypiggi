import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
//import 'package:my_piggy_app/controllers/profil_controller.dart';
//import 'package:my_piggy_app/models/profil.dart';
import 'package:my_piggy_app/ui/theme.dart';

import 'edit_profil.dart';
class MyHeaderDrawer extends StatefulWidget{
  MyHeaderDrawer({Key? key}): super(key: key);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();

}
class _MyHeaderDrawerState extends State <MyHeaderDrawer>{
//final _profilControler=Get.put(ProfilController());
  @override
  Widget build(BuildContext context){
    return Container(
      width:  double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      decoration: const BoxDecoration(
        color: primaryClr,
         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 90.0,
            decoration:  const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
              image: AssetImage('images/profil.jpg')
            ),   
            ), 
          ),
         Row(
           children: [
            Padding(
             padding:  EdgeInsets.only(left: 80),
            //  child: ListView.builder(
            //   itemCount: _profilControler.profilList.length,
            //   itemBuilder:(context, index) {
            //    return ListTile(
            //     title: Text(_profilControler.profilList[index].namaPeternak ??''),
            //     subtitle: Text(_profilControler.profilList[index].namaPeternakan ??''),
            //    );
            //   },
            //  )
           ),
            IconButton(
                 onPressed: (){
                    Get.to(()=>editProfil());          
                  },
                 icon: const Icon(
                 Icons.edit_square,
                 color: Colors.white,
                 
                ),
              ), 
           ],
         ),  
        ], 
      ),
    );
  }
  
}