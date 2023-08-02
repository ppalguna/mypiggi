import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_piggy_app/controllers/note_controller.dart';
//import 'package:my_piggy_app/controllers/task_controller.dart';
import 'package:my_piggy_app/models/note.dart';
//import 'package:my_piggy_app/models/task.dart';
import 'package:my_piggy_app/ui/theme.dart';
import 'package:my_piggy_app/ui/widget/button.dart';
import 'package:my_piggy_app/ui/widget/input_field.dart';

class AddNote extends StatefulWidget {
   AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
  
}

class _AddNoteState extends State<AddNote> {
 //deklarasi variabel
  //datetime di panggil dengan _selectDate
  final NoteController _noteController = Get.put(NoteController());
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _keteranganController  = TextEditingController();
  DateTime _selectedDate= DateTime.now();// hari sekarang
  String _endTime="09.30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _selectedRepeat ="Hari Ini";
  List<String> RepeatList=[
    "Hari ini",
    "Harian",
    "Mingguan",
  ];
  int _selectedColor=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: 
        Text('Catatan', style: subStyle,),
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
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
               MyInputField(title:"Nama Catatan", hint: "Masukan nama catatan anda", controller: _judulController,),
               MyInputField(title:"Catatan", hint: "Masukan catatan anda", controller: _keteranganController ,),
               MyInputField(title: "Tanggal", hint: DateFormat.yMd().format(_selectedDate),
               widget: IconButton(
                icon: Icon(Icons.calendar_today_outlined,
                color:Colors.grey
                ) ,
                onPressed: (){ //jika user klik widget akan muncul
                  _getDateFromUser();
                },

               ),
               ),
               Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "Waktu Mulai",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: (){
                            _getTimeForUser(isStartTime: true);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ),
                    const SizedBox(width: 10,),
                     Expanded(
                    child: MyInputField(
                      title: "Waktu Berakhir",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: (){
                          _getTimeForUser(isStartTime:false);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    )
                ],
               ),
              
               MyInputField(title: "Pengulangan", hint: "$_selectedRepeat ",
              widget: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down,
                color: Colors.grey,
                ),
                iconSize:  32,
                elevation: 4,
                style: subTitleStyle,
                underline: Container(height: 0,),
                onChanged : (String? newValue){
                  setState(() {
                    _selectedRepeat = newValue!;
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
               SizedBox(height: 18,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   _colorPallete(),
                   MyBotton(label: "Simpan", onTap: ()=>_validateDate())
                    ],
                    ),
                       SizedBox(height: 30,)
                  ],
                )
           
        )
         
        ),
      );
  
  }

_appBar(BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.dialogBackgroundColor,
      leading: GestureDetector(
        onTap: (){
          Get.back();  
        },
        child: Icon(Icons.arrow_back_ios,
        size: 20,
        color: Get.isDarkMode ? Colors.white:Colors.black
        ),
      ),
      
    );
  }
  //membuat fungsi(funtion)
_getDateFromUser()async{
  DateTime? _pickerDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2123)
    );
    if(_pickerDate !=null){
     setState(() {
        _selectedDate = _pickerDate;
     });
    }
    else{
      print("it's null or something");
    }
}
_getTimeForUser( {required bool isStartTime} ) async {
  var pickerTime = await _showTimePicker();
  // ignore: use_build_context_synchronously
  String formatedTime = pickerTime.format(context);
  if(pickerTime==null){
    print("Time Canceld");
  }else if(isStartTime==true){
   setState(() {
      _startTime= formatedTime;
   });
  }else if(isStartTime==false){
  setState(() {
      _endTime=formatedTime;
  });
  }
}

//membuat funtion 
_showTimePicker(){
  return  showTimePicker(
    initialEntryMode: TimePickerEntryMode.input,
    context: context, 
    initialTime: TimeOfDay(
      //string to int
      hour: int.parse(_startTime.split(":")[0]), 
      minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      )
    );
}

_colorPallete(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Warna",
      style: titleStyle,
      ),
       //wrap garis secara horizontal warnanya
      const SizedBox(height: 8.0,),
      Wrap(
       children: List<Widget>.generate(
       3,
      (int index) {
      return  GestureDetector(
      onTap: (){
        setState(() {
        _selectedColor=index;
          print("$index");
          });
          },//ketika di tap
          child : Padding (
            padding: const EdgeInsets.only(right: 6.0),
            child: CircleAvatar(
            radius: 14,
            backgroundColor: index==0?primaryClr:index==1?greenClr:yellowClr,
            child: _selectedColor==index?const Icon(Icons.done,//dimanapun di klik dan indexnya cocok maka icon tersebut akan disana ditampilkan
                color: Colors.white,
                size: 16,
                ):Container(),
               ),
              ),
             );
           }
        )
     ),
    ],
 );
}

_validateDate(){
  if(_judulController.text.isNotEmpty&&_keteranganController.text.isNotEmpty){
    //add to database
    _addNoteToDb();
    Get.back();
    Get.snackbar("Sukses", "Input Jadwal Berhasil",
    snackPosition:  SnackPosition.BOTTOM,
    backgroundColor: primaryClr,
    icon: const Icon(Icons.beenhere_outlined,color: Colors.white,) ,
    colorText: Colors.white,
    );  
    
  }else if(_judulController.text.isEmpty||_keteranganController.text.isEmpty){
    Get.snackbar("Required", "Lengkapi semua",
    snackPosition:  SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    icon: Icon(Icons.warning_amber_rounded),
    colorText: Colors.white,
    );  
  }
}
_addNoteToDb() async {
 int value = await _noteController.addNote(
  note : Note(
    judul: _judulController.text,
    keterangan: _keteranganController.text,
    date: DateFormat.yMd().format(_selectedDate),
    startTime: _startTime,
    endTime: _endTime,
    repeat: _selectedRepeat,
    color: _selectedColor,
    isCompleted: 0, 
    ),
  );
  print("my id is"+" $value");
}
}

