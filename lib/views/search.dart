import 'package:flutter/material.dart';
import 'package:notchat/widgets/widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body:
        Column(
          children:[ Container(
            color: Color(0X54FFFFFF),
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    style:TextStyle(
                      color:Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "search username ...",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0X00FFFFFF),//transparent color
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:Color(0XFF2f84ea),
                        ),
                      ),

                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){

                  },

                  child: Container(
                    height: 40.0,
                      width: 40.0,
                      margin:EdgeInsets.only(left: 10),
                      padding:EdgeInsets.all(12),
                      decoration: BoxDecoration(

                       gradient: LinearGradient(
                         colors: [
                           const Color(0X36FFFFFF),
                           const Color(0X0FFFFFFF),

                         ],
                       ),
                        shape: BoxShape.circle,
                      ),

                      child: Image.asset("assets/images/search_white.png")),
                ),
              ],
            ),
          ),
    ]
        ),

    );
  }
}
