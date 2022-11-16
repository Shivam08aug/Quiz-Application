// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, must_be_immutable, use_key_in_widget_constructors, non_constant_identifier_names, library_private_types_in_public_api, avoid_print, duplicate_import, use_build_context_synchronously
import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter_application/screen/question.dart';

import 'package:flutter_application/services/QuizDhandha.dart';
import 'package:flutter_application/services/checkQuizUnlock.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_application/services/localdb.dart';



class QuizIntro extends StatefulWidget {
  String QuizName;
  String QuizImgUrl;
  String QuizTopics;
  String QuizDuration;
  String QuizAbout;
  String QuizId;
  String QuizPrice;
  QuizIntro({
    required this.QuizAbout,
    required this.QuizDuration,
    required this.QuizImgUrl,
    required this.QuizName,
    required this.QuizTopics,
    required this.QuizId,
    required this.QuizPrice
  });

  @override
  _QuizIntroState createState() => _QuizIntroState();
}



class _QuizIntroState extends State<QuizIntro> {

  bool quizIsUnlcoked = false;
  getQuizUnlockStatus() async{
    await CheckQuizUnlock.checkQuizUnlockStatus(widget.QuizId).then((unlockStatus){
      setState(() {
        quizIsUnlcoked = unlockStatus;
      });
    });
  }

  @override
  void initState() {
    getQuizUnlockStatus();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(child: Text( quizIsUnlcoked ?  "START QUIZ" : "UNLOCK QUIZ" , style: TextStyle(fontSize: 20),), onPressed: (){
        quizIsUnlcoked ?
        print("QUIZ IS ALREADY UNLOCKED")
            :
        QuizDhandha.buyQuiz(QuizID: widget.QuizId , QuizPrice: int.parse(widget.QuizPrice )).then((quizKharidLiya){
          if(quizKharidLiya){
            setState(() {
              quizIsUnlcoked = true;
            });
          }else{
            return showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text("You do not have enough money to buy this QUIZ!"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("OK"))
              ],
            ));
          }
        });
      }),
      appBar: AppBar(title: Text("KBC Quiz App"),),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 40),
          child:

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.QuizName , textAlign: TextAlign.center, style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w500),)
                  ],),),


              Image.network(widget.QuizImgUrl, fit: BoxFit.cover, height: 230 , width: MediaQuery.of(context).size.width,),
              Container(
                padding: EdgeInsets.all(18),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.topic_outlined),
                        SizedBox(width: 6,),
                        Text("Related To -" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Text(widget.QuizTopics , style: TextStyle(fontSize: 17),)
                  ],),
              ) ,
              Container(
                padding: EdgeInsets.all(18),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Icon(Icons.topic_outlined),
                        SizedBox(width: 6,),
                        Text("Duration -" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Text("${widget.QuizDuration} Minutes" ,textAlign: TextAlign.left, style: TextStyle(fontSize: 17),)
                  ],),
              ) ,
              Container(
                padding: EdgeInsets.all(18),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.topic_outlined),
                        SizedBox(width: 6,),
                        Text("About Quiz -" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Text(widget.QuizAbout , style: TextStyle(fontSize: 17),)
                  ],),
              )
            ],)

          ,),
      ),
    );
  }
}