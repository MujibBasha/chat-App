
import 'package:flutter/material.dart';
import 'package:notchat/helper/authenticate.dart';
import 'package:notchat/services/auth.dart';
import 'package:notchat/views/search.dart';
import 'package:notchat/views/signin.dart';

AuthMethods authMethods=AuthMethods();
class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Image.asset("assets/images/logo.png",
          height:50,),
        actions: [
          GestureDetector(
            onTap: (){
              authMethods.initializeFirebase();
              authMethods.signOut();
              Navigator.pushReplacement(context,
              MaterialPageRoute(builder:(context)=>Authenticate(),
              ),
              );
            },
            child: Container(
              padding:EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app),


            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.search),

        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder:(context)=>SearchScreen(),
          ),);
        },
      ),
    );
  }
}

