import 'package:flutter/material.dart';
const simpleTextStyle=TextStyle(
  color: Colors.white,
  letterSpacing:0.5,
  fontSize: 16,
);

const textStyleButton=TextStyle(//also call mediumTextStyle
  color: Colors.white,
  fontSize:17,
  letterSpacing:0.5,


);
const textStyleSecButton=TextStyle(
  fontSize: 17,
  letterSpacing: 0.5,
  fontWeight: FontWeight.w700,
  color: Colors.black87,
);


Widget appBarMain(BuildContext context){
  return AppBar(
    title:Image.asset("assets/images/logo.png",
    height:50,),


  );
}

InputDecoration textFieldInputDecoration({String hintText}){

  return   InputDecoration(
    hintText:hintText,
    hintStyle:TextStyle(
      color: Colors.white54,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide:BorderSide(
        color: Colors.white,


      ),
    ),
    // focusedBorder:UnderlineInputBorder(
    //   borderSide:BorderSide(
    //     color:Colors.blue,
    //   ),
    // ),
  );
}