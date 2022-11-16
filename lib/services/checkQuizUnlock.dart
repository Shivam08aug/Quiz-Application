// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/services/localdb.dart';

class CheckQuizUnlock{

   static Future<bool> checkQuizUnlockStatus(String quiz_doc_id) async{
    String user_id = "";
    bool unlocked = false;
    await LocalDB.getUserID().then((value){
      user_id = value!;
    });
  await FirebaseFirestore.instance.collection("users").doc(user_id).collection("unlocked_quiz").doc(quiz_doc_id).get().then((value){
    unlocked = value.data().toString() != "null";
  });

    return unlocked;
  }
}