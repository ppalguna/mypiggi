import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_piggy_app/ui/theme.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget ;

  const MyInputField({Key? key,
    required this.title,
    required this.hint, 
    this.controller,
    this.widget,

  }) : super(key :key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              style: titleStyle,
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 14.0),
            decoration: BoxDecoration(
              border: Border.all(
                color:  Colors.grey,
                width: 1.0
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row( 
              children:[
                Expanded( 
                  child: TextFormField(
                    readOnly: widget==null?false:true, //mengecek apakah kalau ada WIdget, jika nuul maka nilainya false dan bisa di ketikan jika not null maka akan di read saja tidak bisa di ketik
                    autofocus: false,
                    
                    cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey,
                    controller: controller,
                    style: subTitleStyle,
                    decoration:  InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.dialogBackgroundColor,
                          width: 0
                        )
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.dialogBackgroundColor,
                          width: 0
                    ),
                  )
                )
               )
                ),
               widget==null?Container():Container(child: widget)
              ],
            ),
          )
        ],
      ),
    );
  }
}