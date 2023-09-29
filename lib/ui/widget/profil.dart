import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_piggy_app/controllers/profil_controller.dart';
import 'package:my_piggy_app/models/profil.dart';
import 'package:my_piggy_app/ui/theme.dart';
import 'package:my_piggy_app/ui/widget/updateProfil.dart';


class profilHeader extends StatelessWidget {
  final Profil?profil;
  const profilHeader({super.key, this.profil});

  @override
  Widget build(BuildContext context) {
    ProfilController _profilController =ProfilController();
    return  Container(
     
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
            const Padding(
             padding:  EdgeInsets.only(left: 80),
           ),
            IconButton(
                 onPressed: (){
                     Get.to(()=>updateProfil(profilModel: profil,));         
                  },
                 icon: const Icon(
                 Icons.edit_square,
                 color: Colors.white,
                 
                ),
              ), 
           ],
         ),
        ]
      )
    
    );
  }
}