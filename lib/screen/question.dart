// ignore_for_file: unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, must_be_immutable, unnecessary_new, use_key_in_widget_constructors, non_constant_identifier_names, use_build_context_synchronously, avoid_print
import 'dart:ui';
// import 'dart:async';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application/screen/loser.dart';
// import 'package:flutter_application/screen/win.dart';
// import 'package:flutter_application/services/QuestionModel.dart';
// import 'package:flutter_application/services/QuizQueCreator.dart';
// import 'package:flutter_application/services/firedb.dart';
import 'package:flutter_application/widgets/lifeline_sidebar.dart';

class Question extends StatefulWidget {
  const Question({ Key? key }) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image:AssetImage("assets/img/background.png") )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text("Rs.20,000" , style: TextStyle(fontSize: 25),), centerTitle: true,),
        drawer: Lifeline_Drawer(),
        floatingActionButton: ElevatedButton(child: Text("QUIT GAME" , style: TextStyle(fontSize: 27),),onPressed: (){},),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(

              height: 100,
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [

                  CircularProgressIndicator(strokeWidth: 12,backgroundColor: Colors.green,),
Center(child: Text("46" , style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.white),))
                ],
              ),
            ),
            SizedBox(height: 20,),
         Container(
           padding: EdgeInsets.all(14),
           margin: EdgeInsets.all(17),
           decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(20)),
           child : Text("Which language is used to create this app _______ - " , style: TextStyle(fontSize: 22), textAlign: TextAlign.center, )
         ),
SizedBox(height: 10,),
Container(
  width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.all(14),
           margin: EdgeInsets.symmetric(horizontal: 17,vertical: 5),
           decoration: BoxDecoration(color: Colors.red.withOpacity(0.8) , borderRadius: BorderRadius.circular(34)),
           child : Text("A. C++" , style: TextStyle(fontSize: 17 ,color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center, )
         ),
         Container(
             width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.all(14),
    margin: EdgeInsets.symmetric(horizontal: 17,vertical: 5),
           decoration: BoxDecoration(color: Colors.green.withOpacity(0.8) , borderRadius: BorderRadius.circular(34)),
           child : Text("B. Flutter" , style: TextStyle(fontSize: 17 ,color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center, )
         ),
           Container(
             width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.all(14),
    margin: EdgeInsets.symmetric(horizontal: 17,vertical: 5),
           decoration: BoxDecoration(color: Colors.yellow.withOpacity(0.8) , borderRadius: BorderRadius.circular(34)),
           child : Text("C. Photoshop" , style: TextStyle(fontSize: 17 ,color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center, )
         ),
           Container(
             width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.all(14),
    margin: EdgeInsets.symmetric(horizontal: 17,vertical: 5),
           decoration: BoxDecoration(color: Colors.white.withOpacity(0.4) , borderRadius: BorderRadius.circular(34)),
           child : Text("D. ReactNative" , style: TextStyle(fontSize: 17 ,color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center, )
         ),
        ],),
      ),
    );
  }
}
