// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, camel_case_types, library_private_types_in_public_api, avoid_print, avoid_function_literals_in_foreach_calls, use_build_context_synchronously, use_key_in_widget_constructors, non_constant_identifier_names, must_be_immutable
// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application/screen/AskTheExpert.dart';
// import 'package:flutter_application/screen/AudiencePoll.dart';
// import 'package:flutter_application/screen/Fifty50.dart';
// import 'package:flutter_application/screen/question.dart';
// import 'package:flutter_application/services/localdb.dart';


class Lifeline_Drawer extends StatefulWidget {
  const Lifeline_Drawer({ Key? key }) : super(key: key);

  @override
  _Lifeline_DrawerState createState() => _Lifeline_DrawerState();
}

class _Lifeline_DrawerState extends State<Lifeline_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container( margin: EdgeInsets.symmetric(vertical: 12),  child: Text("LifeLine" , style: TextStyle(fontSize: 20 ,fontWeight : FontWeight.bold,))),
            Row(
              mainAxisAlignment : MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      child: Container(
                        padding : EdgeInsets.all(12),
                        decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.purpleAccent),
                      child : Icon(Icons.people ,size : 32,color : Colors.white)
                      ),
                    ),
                    SizedBox(height:5),
                    Text("Audience\n Poll" , textAlign : TextAlign.center),
                  ],
                ),
                     Column(
                  children: [
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      child: Container(
                        padding : EdgeInsets.all(12),
                        decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.black54),
                      child : Icon(Icons.change_circle ,size : 32,color : Colors.white)
                      ),
                    ),
                    SizedBox(height:5),
                    Text("Joker\n Question" , textAlign : TextAlign.center),
                  ],
                ),
                     Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      child: Container(
                        padding : EdgeInsets.all(12),
                        decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.purpleAccent),
                      child : Icon(Icons.two_k_plus_sharp ,size : 32,color : Colors.white)
                      ),
                    ),
                    SizedBox(height:5),
                    Text("Double\n Dip" , textAlign : TextAlign.center),
                  ],
                ),
                     Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                      child: Container(
                        padding : EdgeInsets.all(12),
                        decoration: BoxDecoration(shape: BoxShape.circle , color: Colors.purpleAccent),
                      child : Icon(Icons.desktop_mac ,size : 32,color : Colors.white)
                      ),
                    ),
                    SizedBox(height:5),
                    Text("Ask The\n Expert" , textAlign : TextAlign.center),
                  ],
                ),

              ],
            ),
SizedBox(height: 5),
            Divider(color: Colors.black12 , thickness: 1,),
            Container( margin: EdgeInsets.symmetric(vertical: 12),  child: Text("PRIZES" , style: TextStyle(fontSize: 20 ,fontWeight : FontWeight.bold,))),
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: 500,
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount :13,itemBuilder: (context , index){
                    return ListTile(leading: Text("${index+1}." , style: TextStyle(fontSize :  20 ,color:Colors.grey),),title: Text("Rs.${(5000)*(index+1)}" , style: TextStyle(fontWeight: FontWeight.bold , fontSize : 20),),trailing: Icon(Icons.circle),);
                  }  ),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}