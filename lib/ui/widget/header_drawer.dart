import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:my_piggy_app/ui/theme.dart';
class MyHeaderDrawer extends StatefulWidget{
  MyHeaderDrawer({Key? key}): super(key: key);


  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();

}

class _MyHeaderDrawerState extends State <MyHeaderDrawer>{

  @override
  Widget build(BuildContext context){
    return Container(
      color: primaryClr,
      width:  double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
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
          const Text("I Putu Palguna", style: TextStyle(color: Colors.white,fontSize: 20),),
          const Text("Ulian Pig Farm", style: TextStyle(color: Colors.white,fontSize:  14),)
        ],
        
      ),
    );
  }
}