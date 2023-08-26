
import 'dart:core';
import 'dart:io';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_piggy_app/controllers/note_controller.dart';
import 'package:my_piggy_app/controllers/pig_controller.dart';
import 'package:my_piggy_app/controllers/task_controller.dart';
import 'package:my_piggy_app/models/task.dart';
import 'package:my_piggy_app/services/Notification_services.dart';
import 'package:my_piggy_app/services/theme_services.dart';
import 'package:my_piggy_app/ui/add_task_bar.dart';
import 'package:my_piggy_app/ui/theme.dart';
import 'package:my_piggy_app/ui/widget/about.dart';
import 'package:my_piggy_app/ui/widget/add_note.dart';
import 'package:my_piggy_app/ui/widget/button.dart';
import 'package:my_piggy_app/ui/widget/header_drawer.dart';
import 'package:my_piggy_app/ui/widget/note_Tile.dart';
import 'package:my_piggy_app/ui/widget/pigHealth.dart';
import 'package:my_piggy_app/ui/widget/pig_data.dart';
import 'package:my_piggy_app/ui/widget/task_tile.dart';

import '../models/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  DateTime _selectedDate = DateTime.now();
  final _taskController =Get.put(TaskController());
  final _noteController =Get.put(NoteController());
  final _pigController = Get.put(PigController());
  var notifyHelper;
  List<String> tabs = [
    "Penjadwalan",
    "Catatan",
    
  ];
 
  int current = 0;
    double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 100;
     
      default:
        return 0;
    }
  }
   double changeContainerWidth() {
    switch (current) {
      case 0:
        return 95;
      case 1:
        return 60;
     
      default:
        return 0;
    }
  }
   
  @override
  void initState() {
  
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: context.theme.dialogBackgroundColor,
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
             children: [
              MyHeaderDrawer(),
              ListTile(
                leading: const Icon(Icons.health_and_safety),
                title: const Text("Kesehatan Babi"),
                onTap: () async {
                 await  Get.to(()=>pigHealth());
               },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Tentang"),
                onTap: () async {
                 await  Get.to(()=>About());
               },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Keluar"),
               onTap: () {
                exit(0);
               },
              )
             ],
          ),
        ),
      ),
      appBar: _appBar(),
      body: Column(
        children:  [
        _addTaskBar(),
        _addDateBar(),
         Container(
              margin: const EdgeInsets.only(top: 15,left: 12),
               width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height/25,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: tabs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 10 : 23, top: 0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: Text(
                                  tabs[index],
                                  style: GoogleFonts.ubuntu(
                                    fontSize: current == index ? 16 : 14,
                                    fontWeight: current == index
                                        ? FontWeight.w400
                                        : FontWeight.w300,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.fastLinearToSlowEaseIn,
                    bottom: 0,
                    left: changePositionedOfLine(),
                    duration: const Duration(milliseconds: 1000),
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(left: 10),
                      width: changeContainerWidth(),
                      height: 3,
                      decoration: BoxDecoration(
                        color:primaryClr,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.fastLinearToSlowEaseIn,
                    ),
                  )
                ],
              ),
            ),
          SizedBox(height: 10,),
          current==0? _showTask(): _showNote(),
        ],
        
      ),
      
      floatingActionButton: FloatingActionButton(
        
        onPressed: ()async {
          await Get.to(()=>pigUpdate());
          _pigController.getPig();        
          },
       
        backgroundColor: Get.isDarkMode?primaryClr:Colors.white,
        child: Icon(Icons.edit_document,
        color: Get.isDarkMode?Colors.white:primaryClr,
        ),
        
        
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape:  CircularNotchedRectangle(),
          // notchMargin: 10,
          child: Container(
            
            height: 67,
            decoration: BoxDecoration(
              color:  Get.isDarkMode?primaryClr:Colors.white,
              boxShadow: [
                        BoxShadow(
                          color:  Get.isDarkMode?Colors.white:Colors.grey,
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: Offset(0, 1)
                        )
                      ], 
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () async {
                      await  Get.to(()=>AddTaskPage());
                      _taskController.getTask();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notification_add_outlined,
                           color: Get.isDarkMode?Colors.white:primaryClr,
                          ),
                          Text(
                            'Jadwal',
                            style: subStyle.copyWith(color: Get.isDarkMode?Colors.white:Colors.black,),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: ()async {
                        await Get.to(()=>AddNote());
                        _noteController.getNote();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event_note_rounded ,
                            color: Get.isDarkMode?Colors.white:primaryClr,
                          ),
                          Text(
                            'Catatan',
                            style: subStyle.copyWith(color: Get.isDarkMode?Colors.white:Colors.black,),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
    );
    
  }
 _showNote(){
   return Expanded(
     child: Obx((){
        return ListView.builder(
          itemCount: _noteController.noteList.length,
          
         
           itemBuilder: (_, indexn){
      
            Note note = _noteController.noteList[indexn];
            
            print(note.toJson());
            // print(_noteController.noteList.length);
            //menampilkan database yang sudah di inputkan
             if(note.repeat=="Harian"){
             DateTime date = DateFormat.Hm().parse(note.startTime.toString());
             var myTimenote = DateFormat("HH:mm").format(date);
             notifyHelper.scheduledNotification(
              int.parse(myTimenote.toString().split(":")[0]),
              int.parse(myTimenote.toString().split(":")[1]),
              note 
             );

                return AnimationConfiguration.staggeredList(
                position: indexn, 
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            showButtonSheetNote(context, note);
                          },
                          child: NoteTile(note),
                        )
                      ],
                    ),
                    
                  ),
                )
                );
             }
             if(note.date==DateFormat.yMd().format(_selectedDate)){
                 return AnimationConfiguration.staggeredList(
                position: indexn, 
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            showButtonSheetNote(context, note);
                          },
                          child: NoteTile(note),
                        )
                      ],
                    ),
                    
                  ),
                )
                );
             }else{
                return Container();
             }
           
          });
          
          
     }),
     
    );
 } 
_showTask(){
    return Expanded(
     child: Obx((){
        return ListView.builder(
          itemCount: _taskController.taskList.length,
          
         
           itemBuilder: (_, index){
      
            Task task = _taskController.taskList[index];
            
            print(task.toJson());
            // print(_noteController.noteList.length);
            //menampilkan database yang sudah di inputkan
             if(task.repeat=="Harian"){
             DateTime date = DateFormat.Hm().parse(task.startTime.toString());
             var myTime = DateFormat("HH:mm").format(date);
             notifyHelper.scheduledNotification(
              int.parse(myTime.toString().split(":")[0]),
              int.parse(myTime.toString().split(":")[1]),
              task 
             );

                return AnimationConfiguration.staggeredList(
                position: index, 
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            showButtonSheet(context, task);
                          },
                          child: TaskTile(task),
                        )
                      ],
                    ),
                    
                  ),
                )
                );
             }
             if(task.date==DateFormat.yMd().format(_selectedDate)){
                 return AnimationConfiguration.staggeredList(
                position: index, 
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            showButtonSheet(context, task);
                          },
                          child: TaskTile(task),
                        )
                      ],
                    ),
                    
                  ),
                )
                );
             }else{
                return Container();
             }
           
          });
          
          
     }),
     
    );
    
    
  }
   showButtonSheetNote(BuildContext context, Note note){
    Get.bottomSheet(
      Container(//menambah bagian saat ditekn warna putih
        padding: const EdgeInsets.only(top: 4),
        height: note.isCompleted==1?
        MediaQuery.of(context).size.height*0.20:
        MediaQuery.of(context).size.height*0.25,
        decoration: BoxDecoration(
         color: Get.isDarkMode? darkGreyClr:Colors.white,
         border: Border.all(color:Get.isDarkMode? darkGreyClr:Colors.white,),
         borderRadius: const BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
         ),
        
        child: Column(
          children: [
            Container(
              height: 5,
              width: 120,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:Get.isDarkMode?Colors.grey[600]:Colors.grey[300]
              ),
            ),
            Spacer(),
          note.isCompleted==1
          ?Container()
            : _buttonSheetButton(
              label: "Task Completed",
               onTap: (){
                Get.back();
                _taskController.markTaskCompleted(note.id!);
                _validateButtonCompleted();
        
               },
               clr: primaryClr,
               context:context,
               ),
              
                _buttonSheetButton(
                  label: "Delete",
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                          title: const Text("Apakah anda yakin ingin menghapus data ini ?"),
                          actions: [
                        Column(
                            children: [
                            TextButton(
                            child: Text('Batal'),
                            onPressed: () => Get.back()
                          ),
                            ],
                          ),
                        Column(
                          children: [
                            TextButton(
                            child: Text('Ya'),
                            onPressed: (){
                              Get.back();
                              _noteController.deletenote(note);
                              _validateButtonDelete();
                             } 
                            ),
                            ],
                          )                         
                        ],            
                      ),
                  );
                  
                  },
                  clr: Colors.red[300]!,
                  context:context,
               ),
                const SizedBox(
                  height: 10,
                ),
               _buttonSheetButton(
                  label: "Close",
                  onTap: (){
                    Get.back();
                  },
                 clr: primaryClr,
                  isColese: true,
                  context:context,
               ),
 
          ],
        ),
      )
    );
  }
  showButtonSheet(BuildContext context, Task task){
    Get.bottomSheet(
      Container(//menambah bagian saat ditekn warna putih
        padding: const EdgeInsets.only(top: 4),
        height: task.isCompleted==1?
        MediaQuery.of(context).size.height*0.20:
        MediaQuery.of(context).size.height*0.25,
        decoration: BoxDecoration(
         color: Get.isDarkMode? darkGreyClr:Colors.white,
         border: Border.all(color:Get.isDarkMode? darkGreyClr:Colors.white,),
         borderRadius: const BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
         ),
        
        child: Column(
          children: [
            Container(
              height: 5,
              width: 120,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:Get.isDarkMode?Colors.grey[600]:Colors.grey[300]
              ),
            ),
            Spacer(),
          task.isCompleted==1
          ?Container()
            : _buttonSheetButton(
              label: "Task Completed",
               onTap: (){
                Get.back();
                _taskController.markTaskCompleted(task.id!);
                _validateButtonCompleted();
        
               },
               clr: primaryClr,
               context:context,
               ),
              
                _buttonSheetButton(
                  label: "Delete",
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                          title: const Text("Apakah anda yakin ingin menghapus data ini ?"),
                          actions: [
                        Column(
                            children: [
                            TextButton(
                            child: Text('Batal'),
                            onPressed: () => Get.back()
                          ),
                            ],
                          ),
                        Column(
                          children: [
                            TextButton(
                            child: Text('Ya'),
                            onPressed: (){
                              Get.back();
                              _taskController.delete(task);
                              _validateButtonDelete();
                             } 
                            ),
                            ],
                          )                         
                        ],            
                      ),
                  );
                  
                  },
                  clr: Colors.red[300]!,
                  context:context,
               ),
                const SizedBox(
                  height: 10,
                ),
               _buttonSheetButton(
                  label: "Close",
                  onTap: (){
                    Get.back();
                  },
                 clr: primaryClr,
                  isColese: true,
                  context:context,
               ),
 
          ],
        ),
      )
    );
  }

  
_buttonSheetButton({
required String label, 
  required Function()? onTap,
  required Color clr,
  bool isColese=false,
  required BuildContext context,
}){
  return GestureDetector(
    onTap:onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 4, ),
      height: 50,
      width: MediaQuery.of(context).size.width*0.7,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: isColese==true?Get.isDarkMode?primaryClr:primaryClr:clr,


        ),
        borderRadius: BorderRadius.circular(20),
         color: isColese==true?Colors.transparent:clr,
      ),
      
      child: Center(//agar ditengah tulisannya
        child: Text(
          label,
          style: isColese?titleStyle:titleStyle.copyWith(color: Colors.white),
        ),
      ),

 )
  );
}


  _addDateBar(){
    return   Container(
          margin: const EdgeInsets.only(top:20, left: 20, right: 20),
       
          child: DatePicker(
          
          DateTime.now(),
           height: 90,
            width: 80,
            locale: 'id',

            initialSelectedDate: DateTime.now(),
            selectionColor: primaryClr,
            selectedTextColor: Colors.white,
            dateTextStyle: GoogleFonts.lato(
             textStyle: const TextStyle(
              fontSize: 20,
              fontWeight:  FontWeight.w600,
              color:  Colors.grey
             )
            ),
            dayTextStyle: GoogleFonts.lato(
             textStyle: const TextStyle(
               fontSize: 16,
              fontWeight:  FontWeight.w600,
              color:  Colors.grey
             )
            ),
            monthTextStyle: GoogleFonts.lato(
             textStyle: const TextStyle(
               fontSize: 14,
              fontWeight:  FontWeight.w600,
              color:  Colors.grey
             )
            ),
            
            onDateChange: (date){
             setState(() {
                _selectedDate=date;
             });
            },
          ),
          
         );
         
  }
  _addTaskBar(){
     return Container(
        margin: const EdgeInsets.only(left: 0, right:0, top: 0 ),
        decoration: BoxDecoration(
        color: primaryClr,
         border: Border.all(color: primaryClr),
         borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
         ),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
            margin: const EdgeInsets.only(left: 20,bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hari ini",
                style: headingStyle,
                ),
                Text(DateFormat.yMMMd().format(DateTime.now()),
                style: subHeadingStyle,
                ),
              ],
            )
            ),
          MyBotton(label: "120 ekor ", onTap: () async {
           await  Get.to(()=>const pigUpdate());
           
          // _taskController.getTask();
            }
          )
          ],
         )
          );
  }
  _appBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: primaryClr,
      leading: GestureDetector(
        onTap: (){
              ThemeService().switchTheme();
              notifyHelper.displayNotification(
                title : "Theme Change",
                body : Get.isDarkMode?"Activated Ligth Theme":"Activeted Dart Theme"
              );
              //notifyHelper.scheduledNotification();
                
        },
        
        child: Icon(Get.isDarkMode  ? Icons.wb_sunny_outlined: Icons.nightlight_round,
        size: 20,
        color: Get.isDarkMode ? Colors.white:Colors.black
        ),
       ),
      
    );
  }
  
  _validateButtonCompleted(){
    Get.snackbar("Sukses", "Jadwal Berhasil Diselesaikan",
    snackPosition:  SnackPosition.BOTTOM,
    backgroundColor: primaryClr,
    icon: Icon(Icons.beenhere_outlined,color: Colors.white,) ,
    colorText: Colors.white,
    );  
  }
_validateButtonDelete(){
    Get.snackbar("Sukses", "Jadwal Berhasil Dihapus",
    snackPosition:  SnackPosition.BOTTOM,
    backgroundColor: primaryClr,
    icon: Icon(Icons.beenhere_outlined,color: Colors.white,) ,
    colorText: Colors.white,
    );  
  
  }
  
} 
