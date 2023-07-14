
import 'dart:core';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_piggy_app/controllers/task_controller.dart';
import 'package:my_piggy_app/models/task.dart';
import 'package:my_piggy_app/services/Notification_services.dart';
import 'package:my_piggy_app/services/theme_services.dart';
import 'package:my_piggy_app/ui/add_task_bar.dart';
import 'package:my_piggy_app/ui/theme.dart';
import 'package:my_piggy_app/ui/widget/button.dart';
import 'package:my_piggy_app/ui/widget/header_drawer.dart';
import 'package:my_piggy_app/ui/widget/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  DateTime _selectedDate = DateTime.now();
  final _taskController =Get.put(TaskController());
  var notifyHelper;
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
                leading: const Icon(Icons.home),
                title: const Text("Beranda"),
                onTap: ()=>  Get.back(),
              ),
              ListTile(
                leading: const Icon(Icons.health_and_safety),
                title: const Text("Kesehatan Babi"),
                onTap: ()=> print("tapped"),
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Tentang"),
                onTap: () => print("tapped"),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Keluar"),
                onTap: ()=> print("tapped")
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
        SizedBox(height: 20,),
        _showTask(), 
        ],
        
      ),
      
      floatingActionButton: FloatingActionButton(
        
        onPressed: (){
        showButtonAddChois(context, Task());
        },
        backgroundColor: primaryClr,
        child: Icon(Icons.add),
        
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
    
  }
  
_showTask(){
    return Expanded(
     child: Obx((){
        return ListView.builder(
          itemCount: _taskController.taskList.length,
         
           itemBuilder: (_, index){
      
            Task task = _taskController.taskList[index];
            print(task.toJson());//menampilkan database yang sudah di inputkan
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

  showButtonAddChois(BuildContext context, Task task){
    Get.bottomSheet(
      Container(//menambah bagian saat ditekn warna putih
        height: task.isCompleted==1?
        MediaQuery.of(context).size.height*0.20:
        MediaQuery.of(context).size.height*0.20,
        // color: Colors.white,
         decoration: BoxDecoration(
         color: Get.isDarkMode? darkGreyClr:Colors.white,
         border: Border.all(color:Get.isDarkMode? darkGreyClr:Colors.white,),
         borderRadius: const BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
         ),
        child: Column(
          children: [
            Spacer(),
             _buttonSheetButton(
              label: "Penjadwalan",
               onTap: () async {
                await  Get.to(()=>AddTaskPage());
                _taskController.getTask();
                Get.back();
               },
               clr: primaryClr,
               context:context,
               ),
               _buttonSheetButton(
                  label: "Catatan",
                  onTap: () async {
                 await  Get.to(()=>AddTaskPage());
                _taskController.getTask();
                  Get.back();
               },
                 clr: greenClr,
                  context:context,
               ),
               Spacer(),
 
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
        //   decoration: BoxDecoration(
        //   color: primaryClr,
        //  border: Border.all(color: primaryClr),
        //  borderRadius: const BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
        //  ),
          child: DatePicker(
           DateTime.now(),
           height: 110,
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
          MyBotton(label: "+ Tambah ", onTap: () async {
           await  Get.to(()=>AddTaskPage());
           
           _taskController.getTask();
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
      // actions: const [
      //  CircleAvatar(
      //   backgroundImage: AssetImage(
      //     "images/profil.jpg"
      //   ),
      //  ),
      
      //   SizedBox(width: 20,),
      // ],
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