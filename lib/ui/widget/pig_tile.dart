import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_piggy_app/models/pig.dart';
import '../../controllers/pig_controller.dart';
import '../theme.dart';


class PigTile extends StatelessWidget {
  final Pig? pig;
  PigTile(this.pig, {super.key});
  
  final _pigController = Get.put(PigController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: primaryClr,
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  //height: MediaQuery.of(context).size.height/33,
                  decoration:BoxDecoration(
                     color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  
                ),
               Row(
                
                 children: [
                   Text(
                      'Jenis Ternak : ',
                      style: subtitle.copyWith(fontSize: 10)
                    ),
                     SizedBox(width: 4),
                     Text(
                      pig?.jenisTernak??"",
                      style: subtitle.copyWith(fontSize: 15)
                    ),
                 ],
               ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Tipe ",
                   style: subtitle.copyWith(fontSize: 10)),
                    SizedBox(width: 4),
                    Text(
                      pig?.tipeUpdate??"",
                      style: subtitle,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'Catatan : ',
                  style: subtitle.copyWith(fontSize: 10)
                ),
                SizedBox(width: 4),
                Text(
                  pig?.catatanPig??"",
                  style: subtitle.copyWith(fontSize: 10)
                   
                ),
              ],
            ),
          ),        
           Container(
            child:    
            IconButton(
             onPressed:  ()async {
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
                              _pigController.deletepig(pig!);
                              _validateButtonDeletePig(); 
                             } 
                            ),
                            ],
                          )                         
                        ],            
                      ),
              );
            },
             icon: const Icon(
             Icons.delete_outline,
             color: Colors.white,
            ),
          ),
           
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          
          RotatedBox(
            quarterTurns: 0,
            child: Text(
              pig?.jumlah.toString()??"",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
         Text(" Ekor",
          style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
          )
         )
        ]),
        
      ),
      
    );
    
  }
_validateButtonDeletePig(){
    Get.back();
    Get.snackbar("Sukses", "Jadwal Berhasil Dihapus",
    snackPosition:  SnackPosition.BOTTOM,
    backgroundColor: primaryClr,
    icon: Icon(Icons.beenhere_outlined,color: Colors.white,) ,
    colorText: Colors.white,
    );  
  
  }
}