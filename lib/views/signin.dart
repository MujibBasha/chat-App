
import 'package:flutter/material.dart';
import 'package:notchat/widgets/widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn({@required this.toggle});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController=  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBarMain(context) ,
      body: Container(

        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 50),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              child: Column(

                mainAxisSize:MainAxisSize.min,
                children:[
                  TextField(
                    controller: emailTextEditingController,
                    style: simpleTextStyle,
                    decoration:textFieldInputDecoration(hintText:'email'),
                  ),
                  TextField(
                    controller: passwordTextEditingController,
                    style: simpleTextStyle,
                    decoration:textFieldInputDecoration(hintText:'password'),
                  ),
                  SizedBox(height: 8.0,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (){

                        print("Taped");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical:8),
                        child:Text("Forgot Password?",
                        style:simpleTextStyle)
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0,
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.center,
                     //to get the total width in this widget
                     width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(30),

                        gradient: LinearGradient(
                          colors:[
                           const  Color(0XFF007EF4),
                           const  Color(0XFF2A75BC),
                           // Colors.blue.shade400,
                          ]
                        ),
                      ),
                      child:Text('Sign In',
                      style:textStyleButton,)
                    ),
                  ),
                  SizedBox(height: 16,),
                  GestureDetector(
                    onTap: (){

                      },
                    child: Container(

                        padding: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,

                        //to get the total width in this widget
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.circular(30),
                          ),
                        child:Text('Sign In With Google',
                          style:textStyleSecButton,
                        ),

                    ),
                  ),
                  SizedBox(height: 13,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have account? ",
                      style: textStyleButton,),
                      GestureDetector(
                        onTap: (){
                          widget.toggle();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Register now",
                          style:TextStyle(//also call mediumTextStyle
                            color: Colors.white,
                            fontSize:17,
                            letterSpacing:0.5,
                            decoration:TextDecoration.underline,
                          ) ,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
