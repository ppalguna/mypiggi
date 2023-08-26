import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:my_piggy_app/ui/widget/pig_tile.dart';
// import 'package:my_piggy_app/db/db_helper.dart';
// import 'package:my_piggy_app/models/pig.dart';

import '../../controllers/pig_controller.dart';
import '../../models/pig.dart';
import '../theme.dart';

class historyTernak extends StatefulWidget {
  const historyTernak({super.key});

  @override
  State<historyTernak> createState() => _historyTernakState();
}

class _historyTernakState extends State<historyTernak> {
  final _pigControler=Get.put(PigController());
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        
        title: 
        Text('Riwayat Ternak', style: subStyle.copyWith( color: Get.isDarkMode?Colors.white:Colors.black,),),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: context.theme.dialogBackgroundColor,
        leading: Container(
          child: IconButton(
            onPressed: ()=>Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
            color: Get.isDarkMode?Colors.white:Colors.black,
            
          ),
        ),
    
      ),
      backgroundColor: context.theme.dialogBackgroundColor,
      body: Container(
        color: context.theme.dialogBackgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
      
            children: [
              _showPig(),
            ],
          // child: Container(
          //   color: Colors.white,
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     itemCount: _jenisTernak.pigList.length,
          //     itemBuilder: (_, index) { 
          //       return Text(_jenisTernak.pigList[index].jenisTernak.toString()) ;
            
          //    },
            
          //   ),
          // ),
        ),
      ) ,

    );
    
  }

  _showPig(){
    return Expanded(
      child: Obx((){
        return ListView.builder(
          
          itemCount: _pigControler.pigList.length,
          itemBuilder:(_, context){
            Pig pig = _pigControler.pigList[context];
            print(pig.toJson());
            print(_pigControler.pigList.length);
           return AnimationConfiguration.staggeredList(
                position: context, 
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          
                          child: PigTile(pig),
                        )
                      ],
                    ),
                    
                  ),
                )
                );
          });
      }),
    );
  }

}
