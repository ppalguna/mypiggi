import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../theme.dart';

class pigHealth extends StatefulWidget {
  const pigHealth({super.key});

  @override
  State<pigHealth> createState() => _pigHealthState();
}

class _pigHealthState extends State<pigHealth> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: 
        Text('Kesehatan Babi', style: subStyle,textAlign: TextAlign.end,),
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
          color: Get.isDarkMode?const Color.fromARGB(255, 10, 10, 10):Colors.black,
          
        ),
    
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Get.isDarkMode?Colors.white:Colors.white,
          child:  SizedBox(
             width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 5),
                  decoration: BoxDecoration(
                     boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 100, 100, 100),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 2)
                            )
                          ],
                    color: primaryClr,
                    borderRadius: BorderRadius.circular(10)
                    
                  ),
                  child: const GFAccordion(
                    
                    title: "Kesehatan Kandang Ternak Babi", textStyle: TextStyle(
                      color: Colors.white
                    ),
                    
                    collapsedTitleBackgroundColor: primaryClr,
                    expandedTitleBackgroundColor: primaryClr,
                    content: "Kandang induk yang efisien ialah "
                    "jika kandang tersebut nyaman bagi induk "
                    "dan sekaligus nyaman bagi anak-anak yang dilahirkan, "
                    "sehingga anak-anaknya bisa mendapatkan kesempatan hidup "
                    "pada kandang tersebut. Pada pokoknya kadang babi induk bisa "
                    "dibedakan antara kandang individual dan kelompok.", 
                    contentBackgroundColor: primaryClr,
                    
                    
                  ),
                  
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 100, 100, 100),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 2)
                            )
                          ],
                    color: primaryClr,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const GFAccordion(
                    title: "Kesehatan Kandang Ternak Babi", textStyle: TextStyle(
                      color: Colors.white
                    ),
                    
                    collapsedTitleBackgroundColor: primaryClr,
                    expandedTitleBackgroundColor: primaryClr,
                    content: "Kandang induk yang efisien ialah "
                    "jika kandang tersebut nyaman bagi induk "
                    "dan sekaligus nyaman bagi anak-anak yang dilahirkan, "
                    "sehingga anak-anaknya bisa mendapatkan kesempatan hidup "
                    "pada kandang tersebut. Pada pokoknya kadang babi induk bisa "
                    "dibedakan antara kandang individual dan kelompok.", 
                    contentBackgroundColor: primaryClr,
                    
                    
                  ),
                  
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  decoration: BoxDecoration(
                    boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 100, 100, 100),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 2)
                            )
                          ],
                    color: primaryClr,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const GFAccordion(
                    title: "Kesehatan Kandang Ternak Babi", textStyle: TextStyle(
                      color: Colors.white
                    ),
                    
                    collapsedTitleBackgroundColor: primaryClr,
                    expandedTitleBackgroundColor: primaryClr,
                    content: "Kandang induk yang efisien ialah "
                    "jika kandang tersebut nyaman bagi induk "
                    "dan sekaligus nyaman bagi anak-anak yang dilahirkan, "
                    "sehingga anak-anaknya bisa mendapatkan kesempatan hidup "
                    "pada kandang tersebut. Pada pokoknya kadang babi induk bisa "
                    "dibedakan antara kandang individual dan kelompok.", 
                    contentBackgroundColor: primaryClr,
                    
                    
                  ),
                  
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 100, 100, 100),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: Offset(0, 2)
                            )
                          ],
                    color: primaryClr,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const GFAccordion(
                    title: "Kesehatan Kandang Ternak Babi", textStyle: TextStyle(
                      color: Colors.white
                    ),
                    
                    collapsedTitleBackgroundColor: primaryClr,
                    expandedTitleBackgroundColor: primaryClr,
                    content: "Kandang induk yang efisien ialah "
                    "jika kandang tersebut nyaman bagi induk "
                    "dan sekaligus nyaman bagi anak-anak yang dilahirkan, "
                    "sehingga anak-anaknya bisa mendapatkan kesempatan hidup "
                    "pada kandang tersebut. Pada pokoknya kadang babi induk bisa "
                    "dibedakan antara kandang individual dan kelompok.", 
                    contentBackgroundColor: primaryClr,
                    
                    
                  ),
                  
                ),
                
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}