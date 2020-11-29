import 'package:flutter/material.dart';
import 'package:notchat/services/auth.dart';
import 'package:notchat/widgets/widget.dart';

import 'chatRoomsScreen.dart';
class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp({@required this.toggle});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final signUpFormKey=GlobalKey<FormState>();
  final scaffoldKey=GlobalKey<ScaffoldState>();
  bool isLoading=false;
  AuthMethods authMethods=new AuthMethods();
  TextEditingController userNameTextEditingController=new TextEditingController();
  TextEditingController emailTextEditingController=new TextEditingController();
  TextEditingController passwordTextEditingController= new TextEditingController();

  signMeUp(){
    if(signUpFormKey.currentState.validate())
      {
        setState(() {
          isLoading=true;
        });
        authMethods.initializeFirebase();
        authMethods.signUpWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((value) => print("$value"));

        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>ChatRoom(),
        ),
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar:appBarMain(context) ,
      body: isLoading ? Container(
        child:Center(
          child:CircularProgressIndicator() ,
        ),
      )
          : Container(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 60),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize:MainAxisSize.min,
              children:[
              Form(
                key:signUpFormKey ,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value){
                        var newValue=value.trimLeft();
                        return (newValue.isEmpty || newValue.length <4) ? "Please provide a valid username":null ;
                      },
                      style: simpleTextStyle,
                      controller: userNameTextEditingController,
                      decoration:textFieldInputDecoration(hintText:'username'),
                    ),
                    TextFormField(
                      validator: (value){
                        return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value) ? null : "Please provide a valid email";
                      },
                      controller: emailTextEditingController,
                      //
                      style: simpleTextStyle,
                      decoration:textFieldInputDecoration(hintText:'email'),
                    ),
                    TextFormField(
                      validator: (value){
                        return value.length <7 ? "Please provide password with 7+ character":null ;
                      },
                      controller: passwordTextEditingController,
                      style: simpleTextStyle,
                      decoration:textFieldInputDecoration(hintText:'password'),
                    ),
                  ],
                ),
              ),
                SizedBox(height: 8.0,),
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      print("Taped");

                    },

                    child: Container(

                        padding: EdgeInsets.symmetric(horizontal: 10,vertical:8),
                        child:Text("Forgot Password?",
                            style:simpleTextStyle)
                    ),
                  ),
                ),
                SizedBox(height: 8.0,
                ),
                GestureDetector(
                  onTap: (){
                    signMeUp();
                    scaffoldKey.currentState.showSnackBar(
                        SnackBar(content: Text("Thanks for join to Our Community",
                        style:TextStyle(
                          letterSpacing: 0.6,
                          color: Colors.lightBlueAccent,

                        ),
                        ),
                        ),
                    );
                  },
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
                      child:Text('Sign Up',
                        style:textStyleButton,)
                  ),
                ),
                SizedBox(height: 16,),
                GestureDetector(
                  onTap:(){

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
                    child:Text('Sign up With Google',
                      style:textStyleSecButton,
                    ),

                  ),
                ),
                SizedBox(height: 13,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have account? ",
                      style: textStyleButton,),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                        padding:EdgeInsets.symmetric(vertical:8),
                        child: Text("SignIn now",
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
    );
  }
}
