// ignore_for_file: avoid_print, unused_local_variable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/services/localdb.dart';


class FireDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  createNewUser(String name, String email, String photoUrl, String uid) async {
    final User? current_user = _auth.currentUser;
    if (await getUser()) {
      print("USER ALREADY EXISTS");
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(current_user!.uid)
          .set({
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
        "money": "0",
        "rank" :  "NA",
        "level" : "0"
      }).then((value) async {
        await LocalDB.saveMoney("0");
        await LocalDB.saveRank("NA");
        await LocalDB.saveLevel("0");
        print("User Registered Successfully");
      });
    }
  }

  Future<bool> getUser() async {
    final User? current_user = _auth.currentUser;
    String user = "";

    await FirebaseFirestore.instance
        .collection("users")
        .doc(current_user!.uid)
        .get()
        .then((value) async {
      user = value.data().toString();
      print(user);
      await LocalDB.saveMoney("999989");
      await LocalDB.saveRank("444");
      await LocalDB.saveLevel("45");
    });
    if (user.toString() == "null") {
      return false;
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(current_user.uid)
          .get()
          .then((value) async {
        user = value.data().toString();
        print(user);
        await LocalDB.saveMoney(value["money"]);
        await LocalDB.saveRank(value["rank"]);
        await LocalDB.saveLevel(value["level"]);
      });
      return true;
    }
  }
}