import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_piggy_app/ui/theme.dart';
import 'package:my_piggy_app/ui/widget/history_ternak.dart';
// import 'package:my_piggy_app/ui/widget/button.dart';
//import 'package:number_inc_dec/number_inc_dec.dart';
// import 'input_field.dart';
import '../../controllers/pig_controller.dart';
import '../../models/pig.dart';
import 'button.dart';
import 'input_field_pig_data.dart';

class pigUpdate extends StatefulWidget {
  const pigUpdate({super.key});

  @override
  State<pigUpdate> createState() => _pigUpdateState();
}

class _pigUpdateState extends State<pigUpdate> {
  // final TextEditingController _tambah = TextEditingController();
  // final TextEditingController _kurang = TextEditingController();
  final PigController _pigController = Get.put(PigController());
  final TextEditingController _catatanPig= TextEditingController();
  final  _jumlahController= TextEditingController();
  //var _jumlah;
  var dataanakan =0 ;
  String _jenisTernak ="Jenis Ternak";
  List<String> RepeatList=[
    "Anakan",
    "Indukan",
    "Gemukan",
    "Pejantan",
  ];
  String _tipeUpdate ="Tipe update";
  List<String> RepeatList2=[
    "Masuk",
    "Keluar",
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        
        title: 
        Text('Jumlah Babi', style: subStyle.copyWith(color: Get.isDarkMode?Colors.white:Colors.black,),),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor:context.theme.dialogBackgroundColor,
        leading: Container(
          child: IconButton(
            onPressed: ()=>Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
            color: Get.isDarkMode?Colors.white:Colors.black,
            
          ),
        ),
        
        actions:<Widget> [
          IconButton(
            icon: const Icon(Icons.history_edu,
            color: Colors.grey,),
            iconSize:30,
            tooltip: 'Riwayat',
            onPressed: () {
              Get.to(()=>const historyTernak()); 
              _pigController.getPig();
            },
          ),
        ],
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
            // Container(
            //   padding: const EdgeInsets.fromLTRB(20, 13, 20, 25),
            //   width: MediaQuery.of(context).size.width,
            //   decoration: const BoxDecoration(
            //     color: primaryClr,
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(30),
            //       topRight: Radius.circular(30),
            //     )
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Container(
            //         margin: const EdgeInsets.fromLTRB(0, 0, 2, 16),
            //         child: Text(
            //           'Update',
            //           style: subStyle.copyWith(color: Colors.white,),
            //         ),
            //       ),
            //       Container(
            //         margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            //         width: MediaQuery.of(context).size.width,
            //         height: 1,
            //         color: Colors.white,
            //       ),
            //       Container(
            //         margin: const EdgeInsets.fromLTRB(143, 0, 15, 15),
            //         width: MediaQuery.of(context).size.width,
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Container(
            //               margin: const EdgeInsets.fromLTRB(0, 0, 35, 0),
            //               child: Text(
            //                 'Tambah',
            //                 style: subtitle,
            //               ),
            //             ),
            //             SizedBox(width: MediaQuery.of(context).size.width/26,),
            //             Text(
            //                 'Kurangi',
            //                 style: subtitle,
            //               ),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         margin: const EdgeInsets.fromLTRB(0, 0, 2, 26),
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Container(
            //               width: MediaQuery.of(context).size.width/2.7,
            //               child: Text(
            //                 'Indukan', style: subtitle,
            //               ),
            //             ),
            //             Container(
            //               height: MediaQuery.of(context).size.height/19,
            //               width: MediaQuery.of(context).size.width/5,
            //                 margin: const EdgeInsets.fromLTRB(2, 0, 24, 0),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                   color: Get.isDarkMode?Colors.grey[400]:Colors.white,
            //                 ),
            //                 child:  SizedBox(
                              
            //                   child:  TextFormField(
            //                     controller: _tambah,
            //                         cursorColor: Colors.grey,
            //                         keyboardType: TextInputType.number,
            //                         textAlign: TextAlign.center,
            //                         inputFormatters: [
            //                           LengthLimitingTextInputFormatter(4)
            //                         ],
            //                         decoration:  InputDecoration(
            //                           border: InputBorder.none,
            //                           focusedBorder: InputBorder.none,
            //                           enabledBorder: InputBorder.none,
            //                           errorBorder: InputBorder.none,
            //                           disabledBorder: InputBorder.none,
            //                           contentPadding:
            //                           EdgeInsets.all(0),
            //                           hintText: "0", ),
            //                       )
            //                 ),
            //             ),
            //              Container(
            //               height: MediaQuery.of(context).size.height/19,
            //               width: MediaQuery.of(context).size.width/5,
            //                 margin: const EdgeInsets.fromLTRB(1, 0, 10, 0),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                  color: Get.isDarkMode?Colors.grey[400]:Colors.white,
            //                 ),
            //                 child:  SizedBox(
                              
            //                   child:  TextFormField(
            //                     controller:_kurang,
            //                         cursorColor: Colors.grey,
            //                         keyboardType: TextInputType.number,
            //                         textAlign: TextAlign.center,
            //                         inputFormatters: [
            //                           LengthLimitingTextInputFormatter(4)
            //                         ],
            //                         decoration:  InputDecoration(
            //                           border: InputBorder.none,
            //                           focusedBorder: InputBorder.none,
            //                           enabledBorder: InputBorder.none,
            //                           errorBorder: InputBorder.none,
            //                           disabledBorder: InputBorder.none,
            //                           contentPadding:
            //                           EdgeInsets.all(0),
            //                           hintText: "0"),
            //                       )
            //                 ),
            //             ),
                        
            //           ],
            //         ),
      
            //       ),
            //        Container(
            //         margin: const EdgeInsets.fromLTRB(0, 0, 5, 26),
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Container(
            //              width: MediaQuery.of(context).size.width/2.7,
            //               child: Text(
            //                 'Anakan', style: subtitle,
            //               ),
            //             ),
            //             Container(
            //               height: MediaQuery.of(context).size.height/19,
            //               width: MediaQuery.of(context).size.width/5,
            //                 margin: const EdgeInsets.fromLTRB(2, 0, 24.6, 0),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                   color: Get.isDarkMode?Colors.grey[400]:Colors.white,
            //                 ),
            //                 child:  SizedBox(
                              
            //                   child:  TextFormField(
            //                         cursorColor: Colors.grey,
            //                         keyboardType: TextInputType.number,
            //                         textAlign: TextAlign.center,
            //                         inputFormatters: [
            //                           LengthLimitingTextInputFormatter(4)
            //                         ],
            //                         decoration:  InputDecoration(
            //                           border: InputBorder.none,
            //                           focusedBorder: InputBorder.none,
            //                           enabledBorder: InputBorder.none,
            //                           errorBorder: InputBorder.none,
            //                           disabledBorder: InputBorder.none,
            //                           contentPadding:
            //                           EdgeInsets.all(0),
            //                           hintText: "0"),
            //                       )
            //                 ),
            //             ),
            //              Container(
            //               height: MediaQuery.of(context).size.height/19,
            //               width: MediaQuery.of(context).size.width/5,
            //                 margin: const EdgeInsets.fromLTRB(1, 0, 10, 0),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                  color: Get.isDarkMode?Colors.grey[400]:Colors.white,
            //                 ),
            //                 child:  SizedBox(
                              
            //                   child:  TextFormField(
            //                         cursorColor: Colors.grey,
            //                         keyboardType: TextInputType.number,
            //                         textAlign: TextAlign.center,
            //                         inputFormatters: [
            //                           LengthLimitingTextInputFormatter(4)
            //                         ],
            //                         decoration:  InputDecoration(
            //                           border: InputBorder.none,
            //                           focusedBorder: InputBorder.none,
            //                           enabledBorder: InputBorder.none,
            //                           errorBorder: InputBorder.none,
            //                           disabledBorder: InputBorder.none,
            //                           contentPadding:
            //                           EdgeInsets.all(0),
            //                           hintText: "0"),
            //                       )
            //                 ),
            //             ),
            //           ],
            //         ),
      
            //       ),
            //       Container(
            //         margin: EdgeInsets.fromLTRB(0, 0, 5, 26),
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Container(
            //               width: MediaQuery.of(context).size.width/2.7,
            //               child: Text(
            //                 'Penggemukan', style: subtitle,
            //               ),
            //             ),
            //             Container(
            //               height: MediaQuery.of(context).size.height/19,
            //               width: MediaQuery.of(context).size.width/5,
            //                 margin: const EdgeInsets.fromLTRB(2, 0, 24, 0),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                   color: Get.isDarkMode?Colors.grey[400]:Colors.white,
            //                 ),
            //                 child:  SizedBox(
                              
            //                   child:  TextFormField(
            //                         cursorColor: Colors.grey,
            //                         keyboardType: TextInputType.number,
            //                         textAlign: TextAlign.center,
            //                         inputFormatters: [
            //                           LengthLimitingTextInputFormatter(4)
            //                         ],
            //                         decoration:  InputDecoration(
            //                           border: InputBorder.none,
            //                           focusedBorder: InputBorder.none,
            //                           enabledBorder: InputBorder.none,
            //                           errorBorder: InputBorder.none,
            //                           disabledBorder: InputBorder.none,
            //                           contentPadding:
            //                           EdgeInsets.all(0),
            //                           hintText: "0"),
            //                       )
            //                 ),
            //             ),
            //              Container(
            //               height: MediaQuery.of(context).size.height/19,
            //               width: MediaQuery.of(context).size.width/5,
            //                 margin: const EdgeInsets.fromLTRB(1, 0, 10, 0),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                  color: Get.isDarkMode?Colors.grey[400]:Colors.white,
            //                 ),
            //                 child:  SizedBox(
                              
            //                   child:  TextFormField(
            //                         cursorColor: Colors.grey,
            //                         keyboardType: TextInputType.number,
            //                         textAlign: TextAlign.center,
            //                         inputFormatters: [
            //                           LengthLimitingTextInputFormatter(4)
            //                         ],
            //                         decoration:  InputDecoration(
            //                           border: InputBorder.none,
            //                           focusedBorder: InputBorder.none,
            //                           enabledBorder: InputBorder.none,
            //                           errorBorder: InputBorder.none,
            //                           disabledBorder: InputBorder.none,
            //                           contentPadding:
            //                           EdgeInsets.all(0),
            //                           hintText: "0"),
            //                       )
            //                 ),
            //             ),
            //           ],
            //         ),
      
            //       ),
            //       Container(
            //         margin: EdgeInsets.fromLTRB(0, 0, 5, 26),
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Container(
            //               width: MediaQuery.of(context).size.width/2.7,
            //               child: Text(
            //                 'Pejantan', style: subtitle,
            //               ),
            //             ),
            //             Container(
            //               height: MediaQuery.of(context).size.height/19,
            //               width: MediaQuery.of(context).size.width/5,
            //                 margin: const EdgeInsets.fromLTRB(2, 0, 26, 0),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                   color: Get.isDarkMode?Colors.grey[400]:Colors.white,
            //                 ),
                            
            //                 child:  Container(
            //                   child: TextFormField(
                                
            //                         cursorColor: Colors.grey,
            //                         keyboardType: TextInputType.number,
            //                         textAlign: TextAlign.center,
            //                         inputFormatters: [
            //                           LengthLimitingTextInputFormatter(4)
            //                         ],
            //                         decoration:  InputDecoration(
            //                           border: InputBorder.none,
            //                           focusedBorder: InputBorder.none,
            //                           enabledBorder: InputBorder.none,
            //                           errorBorder: InputBorder.none,
            //                           disabledBorder: InputBorder.none,
            //                           contentPadding:
            //                           EdgeInsets.all(0),
            //                           hintText: "0"),
            //                       )
            //                 ),
            //             ),
            //              Container(
            //               height: MediaQuery.of(context).size.height/19,
            //               width: MediaQuery.of(context).size.width/5,
                            
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10),
            //                  color: Get.isDarkMode?Colors.grey[400]:Colors.white,
            //                 ),
                            
            //                 child:  SizedBox(
                              
            //                   child: TextFormField(
            //                         cursorColor: Colors.grey,
            //                         keyboardType: TextInputType.number,
            //                         textAlign: TextAlign.center,
            //                         inputFormatters: [
            //                           LengthLimitingTextInputFormatter(4)
            //                         ],
            //                         decoration:  InputDecoration(
            //                           border: InputBorder.none,
            //                           focusedBorder: InputBorder.none,
            //                           enabledBorder: InputBorder.none,
            //                           errorBorder: InputBorder.none,
            //                           disabledBorder: InputBorder.none,
            //                           contentPadding:
            //                           EdgeInsets.all(0),
            //                           hintText: "0"),
            //                       )
            //                 ),
            //             ),
            //           ],
            //         ),
      
            //       ),
            //        Container(
            //            width: MediaQuery.of(context).size.width/1,
            //            height: MediaQuery.of(context).size.height/6.3,
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.end,
            //               children: [
                            
            //                 MyBotton(label: "Simpan ", onTap: () {})  
            //               ],
            //             ),
            //           )
            //     ],
            //   ),
            // )
            
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
                    decoration: BoxDecoration(
                      color: primaryClr,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        MyInputField2(title: "Jenis Ternak", hint: "$_jenisTernak ",
                          widget: DropdownButton(
                            icon: Icon(Icons.keyboard_arrow_down,
                            color: Colors.white,
                            ),
                            iconSize:  32,
                            elevation: 4,
                            style: subtitle,
                            underline: Container(height: 0,),
                            onChanged : (String? newValue){
                              setState(() {
                                _jenisTernak = newValue!;
                              });
                            },
                            items: RepeatList.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(color:Colors.grey)),
                                );
                            }
                            ).toList(),
                          ),
                        ),
                         MyInputField2(title: "Tipe Update", hint: "$_tipeUpdate ",
                          widget: DropdownButton(
                            icon: Icon(Icons.keyboard_arrow_down,
                            color: Colors.white,
                            ),
                            iconSize:  32,
                            elevation: 4,
                            style: subtitle,
                            underline: Container(height: 0,),
                            onChanged : (String? newValue){
                              setState(() {
                                _tipeUpdate = newValue!;
                              });
                            },
                            items: RepeatList2.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(color:Colors.grey)),
                                );
                            }
                            ).toList(),
                          ),
                        ),
                        MyInputField2(title:"Catatan", hint: "Masukan catatan anda", controller: _catatanPig ,),
                      ],
                    ),
                  ),
                  // Container(
                  //   child: NumberInputWithIncrementDecrement(controller: _coba),
                  // ),
                   SizedBox(height: MediaQuery.of(context).size.height/35,),
                   Row(
                     children: [
                      Text("Jumlah", style: subtitle,),
                      SizedBox(width: MediaQuery.of(context).size.width/19,),
                       Container(
                              height: MediaQuery.of(context).size.height/19,
                              width: MediaQuery.of(context).size.width/5,     
                                decoration: BoxDecoration(
                                 color: Get.isDarkMode?primaryClr:primaryClr,
                                ),
                                child:  SizedBox(
                                  child: TextFormField(
                                        cursorColor: Colors.white,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                        controller: _jumlahController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                           RegExp(r'[0-9]')),
                                          LengthLimitingTextInputFormatter(4)
                                        ],
                                        decoration:  const InputDecoration(
                                          border: OutlineInputBorder(
                                           
                                            borderSide: BorderSide(color: Colors.white)
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                            borderSide: BorderSide(color: Colors.white,)
                                          ),
                                         enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                          borderSide: BorderSide(color: Colors.white,)
                                         ),
                                          contentPadding:
                                          EdgeInsets.all(0),
                                          hintText: "0", hintStyle:TextStyle(color: Colors.white)),
                                      )
                                ),
                            ), 
                      ],
                   ),
                    Container(
                        width: MediaQuery.of(context).size.width/1,
                        height: MediaQuery.of(context).size.height/6.3,
                        color: primaryClr,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              MyBotton(label: "Simpan ", onTap: () {
                                _validateDate();
                              })  
                          ],
                        ),
                      )
                   ]
                  )
                ),      
             ],
           ),
          ),
        ),
      ),
    );
  }
  _addPigToDb() async {
  String _jumlah= _jumlahController.text;
 int value = await _pigController.addPig(
  pig : Pig(
    jenisTernak: _jenisTernak,
    tipeUpdate: _tipeUpdate,
    catatanPig: _catatanPig.text,
    jumlah: int.parse(_jumlah),
    ),
  );
  print("my id is"+" $value");
}
_validateDate(){
  if(_jenisTernak.isNotEmpty&&_tipeUpdate.isNotEmpty){
    //add to database
    _addPigToDb();

    Get.snackbar("Sukses", "Input Jadwal Berhasil",
    snackPosition:  SnackPosition.BOTTOM,
    backgroundColor: primaryClr,
    icon: const Icon(Icons.beenhere_outlined,color: Colors.white,) ,
    colorText: Colors.white,
    );  
    
  }else if(_jenisTernak.isNotEmpty&&_tipeUpdate.isNotEmpty){
    Get.snackbar("Required", "Lengkapi semua",
    snackPosition:  SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    icon: Icon(Icons.warning_amber_rounded),
    colorText: Colors.white,
    );  
  }
  
}

// penjumlahanPig(){

// if(_jenisTernak=='Anakan'&&_tipeUpdate=='Masuk') {
// var jumanakan= int.parse(_jumlahController.text);
// dataanakan=dataanakan+jumanakan;
// }
// else if(_jenisTernak=='Anakan'&&_tipeUpdate=='Keluar'){
// var kuranakan= int.parse(_jumlahController.text);
// dataanakan+kuranakan;
// }
// return dataanakan;
// }

}