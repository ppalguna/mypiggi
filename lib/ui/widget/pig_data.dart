import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_piggy_app/ui/theme.dart';
import 'package:my_piggy_app/ui/widget/button.dart';

class pigUpdate extends StatefulWidget {
  const pigUpdate({super.key});

  @override
  State<pigUpdate> createState() => _pigUpdateState();
}

class _pigUpdateState extends State<pigUpdate> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        
        title: 
        Text('Jumlah Babi', style: subStyle,),
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
      
      body: SingleChildScrollView(
        child: Container(
        width: MediaQuery.of(context).size.width,
        child: 
        Container(
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
         color: Get.isDarkMode?Colors.grey[800]:Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              padding: const EdgeInsets.fromLTRB(21, 23, 24, 21),
              width: MediaQuery.of(context).size.width,
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Container(
                    padding: const EdgeInsets.fromLTRB(18, 25, 22, 25),
                     width: MediaQuery.of(context).size.width,
      
                    decoration:  BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 100, 100, 100),
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: Offset(0, 1)
                        )
                      ],
                      color: Get.isDarkMode?Colors.grey[400]:Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        
                      )
                    ),
                    child: 
                    Row(
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        Container(
                        width: MediaQuery.of(context).size.width/2,
                          child: 
                          Text(
                            "Total Babi",
                            style: subHeadingStyle.copyWith(color: const Color.fromARGB(255, 110, 110, 110)),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/19,),
                        Container(
                         width: MediaQuery.of(context).size.width/8,
                          child: Text(
                            "120",
                            style: subHeadingStyle.copyWith(color: const Color.fromARGB(255, 110, 110, 110)),
                          ),
        
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/13,
                          child: Text(
                            "ekor",
                            style: subHeadingStyle.copyWith(color: const Color.fromARGB(255, 110, 110, 110),fontSize: 12, height: 0),
                          ),
        
                        )
      
      
                      ],
                    ),
                  ),
                  Container(
                  height: MediaQuery.of(context).size.height/8,
                   width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 100, 100, 100),
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: Offset(0, 1)
                        )
                      ],
                      color: primaryClr,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                         height: MediaQuery.of(context).size.height/20,
                         width: MediaQuery.of(context).size.width/1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width/33,),
                              Container(
                                
                                width: MediaQuery.of(context).size.width/5,
                                child: Text(
                                  "Indukan",
                                  style: subStyle.copyWith(color: Colors.white, fontSize: 12),
                                ),
                              ),
                               Container(
                                width: MediaQuery.of(context).size.width/5.2,
                                child: Text(
                                  "Anakan",
                                  style: subStyle.copyWith(color: Colors.white, fontSize: 12),
                                ),
                              ),
                              Container(
                                 width: MediaQuery.of(context).size.width/3.5,
                                child: Text(
                                  "Penggemukan",
                                  style: subStyle.copyWith(color: Colors.white, fontSize: 12),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width/7,
                                child: Text(
                                  "Pejantan",
                                  style: subStyle.copyWith(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.white,
      
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height/60,),
                        Container(
                          height: MediaQuery.of(context).size.height/38,
                          width: MediaQuery.of(context).size.width/1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            
                            children: [
                              SizedBox(width:MediaQuery.of(context).size.width/22,),
                              Expanded(child: 
                              Container(

                                child: Text(
                                  '160',
                                  style: subStyle.copyWith(color:Colors.white, fontSize: 17),
      
                                ),
                              ),
                              ),
                                SizedBox(width:MediaQuery.of(context).size.width/20,),
                             
                              Expanded(child: 
                              Container(
                                width: MediaQuery.of(context).size.width/1,
                                child: Text(
                                  '140',
                                  style: subStyle.copyWith(color:Colors.white, fontSize: 17),
      
                                ),
                              ),
                              ),
                              SizedBox(width:MediaQuery.of(context).size.width/12,),
                              Expanded(child: 
                              Container(
                                width: MediaQuery.of(context).size.width/1,
                                child: Text(
                                  '180',
                                  style: subStyle.copyWith(color:Colors.white, fontSize: 17),
      
                                ),
                              ),
                              ),
                                SizedBox(width:MediaQuery.of(context).size.width/10,),
                              Expanded(child: 
                              Container(
                                child: Text(
                                  '160',
                                  style: subStyle.copyWith(color:Colors.white, fontSize: 17),
      
                                ),
                              ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 13, 20, 25),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: primaryClr,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 2, 16),
                    child: Text(
                      'Update',
                      style: subStyle.copyWith(color: Colors.white,),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.white,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(143, 0, 15, 15),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 35, 0),
                          child: Text(
                            'Tambah',
                            style: subtitle,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/26,),
                        Text(
                            'Kurangi',
                            style: subtitle,
                          ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 2, 26),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/2.7,
                          child: Text(
                            'Indukan', style: subtitle,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/19,
                          width: MediaQuery.of(context).size.width/5,
                            margin: const EdgeInsets.fromLTRB(2, 0, 24, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Get.isDarkMode?Colors.grey[400]:Colors.white,
                            ),
                            child:  SizedBox(
                              
                              child:  TextFormField(
                                    cursorColor: Colors.grey,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.all(0),
                                      hintText: "0"),
                                  )
                            ),
                        ),
                         Container(
                          height: MediaQuery.of(context).size.height/19,
                          width: MediaQuery.of(context).size.width/5,
                            margin: const EdgeInsets.fromLTRB(1, 0, 10, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                             color: Get.isDarkMode?Colors.grey[400]:Colors.white,
                            ),
                            child:  SizedBox(
                              
                              child:  TextFormField(
                                    cursorColor: Colors.grey,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.all(0),
                                      hintText: "0"),
                                  )
                            ),
                        ),
                      ],
                    ),
      
                  ),
                   Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 5, 26),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                         width: MediaQuery.of(context).size.width/2.7,
                          child: Text(
                            'Anakan', style: subtitle,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/19,
                          width: MediaQuery.of(context).size.width/5,
                            margin: const EdgeInsets.fromLTRB(2, 0, 24.6, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Get.isDarkMode?Colors.grey[400]:Colors.white,
                            ),
                            child:  SizedBox(
                              
                              child:  TextFormField(
                                    cursorColor: Colors.grey,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.all(0),
                                      hintText: "0"),
                                  )
                            ),
                        ),
                         Container(
                          height: MediaQuery.of(context).size.height/19,
                          width: MediaQuery.of(context).size.width/5,
                            margin: const EdgeInsets.fromLTRB(1, 0, 10, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                             color: Get.isDarkMode?Colors.grey[400]:Colors.white,
                            ),
                            child:  SizedBox(
                              
                              child:  TextFormField(
                                    cursorColor: Colors.grey,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.all(0),
                                      hintText: "0"),
                                  )
                            ),
                        ),
                      ],
                    ),
      
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 5, 26),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/2.7,
                          child: Text(
                            'Penggemukan', style: subtitle,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/19,
                          width: MediaQuery.of(context).size.width/5,
                            margin: const EdgeInsets.fromLTRB(2, 0, 24, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Get.isDarkMode?Colors.grey[400]:Colors.white,
                            ),
                            child:  SizedBox(
                              
                              child:  TextFormField(
                                    cursorColor: Colors.grey,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.all(0),
                                      hintText: "0"),
                                  )
                            ),
                        ),
                         Container(
                          height: MediaQuery.of(context).size.height/19,
                          width: MediaQuery.of(context).size.width/5,
                            margin: const EdgeInsets.fromLTRB(1, 0, 10, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                             color: Get.isDarkMode?Colors.grey[400]:Colors.white,
                            ),
                            child:  SizedBox(
                              
                              child:  TextFormField(
                                    cursorColor: Colors.grey,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.all(0),
                                      hintText: "0"),
                                  )
                            ),
                        ),
                      ],
                    ),
      
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 5, 26),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/2.7,
                          child: Text(
                            'Pejantan', style: subtitle,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/19,
                          width: MediaQuery.of(context).size.width/5,
                            margin: const EdgeInsets.fromLTRB(2, 0, 26, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Get.isDarkMode?Colors.grey[400]:Colors.white,
                            ),
                            
                            child:  Container(
                              child: TextFormField(
                                
                                    cursorColor: Colors.grey,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.all(0),
                                      hintText: "0"),
                                  )
                            ),
                        ),
                         Container(
                          height: MediaQuery.of(context).size.height/19,
                          width: MediaQuery.of(context).size.width/5,
                            
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                             color: Get.isDarkMode?Colors.grey[400]:Colors.white,
                            ),
                            
                            child:  SizedBox(
                              
                              child: TextFormField(
                                    cursorColor: Colors.grey,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4)
                                    ],
                                    decoration:  InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.all(0),
                                      hintText: "0"),
                                  )
                            ),
                        ),
                      ],
                    ),
      
                  ),
                   Container(
                       width: MediaQuery.of(context).size.width/1,
                       height: MediaQuery.of(context).size.height/6.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
                            MyBotton(label: "Simpan ", onTap: () {})  
                          ],
                        ),
                      )
                ],
              ),
            )
          ],
        ),
      
        ),
        ),
      ),
    );
  }
}