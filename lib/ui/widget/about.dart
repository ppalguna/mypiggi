import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_piggy_app/ui/theme.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class About extends StatelessWidget {
  const About({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text('Tentang Pengembang', style: subStyle.copyWith(color: Get.isDarkMode?Colors.white:Colors.black,),),
        backgroundColor: context.theme.dialogBackgroundColor,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
          color: Get.isDarkMode?Colors.white:Colors.black,
          
        ),
      ),
    
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child:Container(
                  height: MediaQuery.of(context).size.width/3,
                  margin: const EdgeInsets.only(top: 40,),
                  decoration:  const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                    image: AssetImage('images/profil.jpg')
                    
                  ),  
              )
         )
        ),   
                 Expanded(
                    child: Container(
                      padding:EdgeInsets.only(top: 40),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Gde Sastrawangsa, S.T., M.T.", style: subStyle.copyWith(color:  Get.isDarkMode?Colors.white:Colors.black,)),
                        SizedBox(height: 30),
                      Text("Dosen", style: subStyle.copyWith(color: Colors.grey)),
                      Text("ITB STIKOM Bali", style: subStyle.copyWith(color: Colors.grey)),
                      //  IconButton(
                      //     onPressed: (){
                                  
                      //     },
                      //     icon: Icon(
                      //     FontAwesomeIcons.instagram,

                      //     color: Colors.grey,
                      //     size:20,
                          
                      //   ),
                      //   ), 
                      ],
                     ),
                    ),
                  
                  ),
            ],
          ),
         Row(
            children: [
              Expanded(
                child:Container(
                  height: MediaQuery.of(context).size.width/3,
                  margin: EdgeInsets.only(top: 25),
                  decoration:  const BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border(),
                    image: DecorationImage(
                    image: AssetImage('images/profil.jpg')
                  ),  
                    )
                    )
                    ),   
                 Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 20.0 ),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("I Ketut Putu Suniantara, S.Si., M.Si", style: subStyle.copyWith(color:  Get.isDarkMode?Colors.white:Colors.black,)),
                      SizedBox(height: 30),
                      Text("Dosen", style: subStyle.copyWith(color: Colors.grey)),
                      Text("ITB STIKOM Bali", style: subStyle.copyWith(color: Colors.grey)),
                      //  IconButton(
                      //     onPressed: (){
                                  
                      //     },
                      //     icon: Icon(
                      //     FontAwesomeIcons.instagram,

                      //     color: Colors.grey,
                      //     size:20,
                          
                      //   ),
                      //   ), 
                      ],
                     ),
                    ),
                  
                  ),
            ],
          ),
            Row(
            children: [
              Expanded(
                child:Container(
                  height: MediaQuery.of(context).size.width/3,
                  margin: EdgeInsets.only(top: 25),
                  decoration:  const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                    image: AssetImage('images/myfoto.jpg')
                  ),  
                    )
                    )
                    ),   
                 Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 40 ),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("I Putu Palguna", style: subStyle.copyWith(color:  Get.isDarkMode?Colors.white:Colors.black,)),
                      SizedBox(height: 50),
                      Text("Mahasiswa", style: subStyle.copyWith(color: Colors.grey)),
                      Text("ITB STIKOM Bali", style: subStyle.copyWith(color: Colors.grey)),
                      //  IconButton(
                      //     onPressed: (){
                                  
                      //     },
                      //     icon: Icon(
                      //     FontAwesomeIcons.instagram,

                      //     color: Colors.grey,
                      //     size:20,
                          
                      //   ),
                      //   ), 
                      ],
                     ),
                    ),
                  
                  ),
            ],
          ),
        ],
      ),
    );
  }
}