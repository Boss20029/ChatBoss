import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class sendmess extends GetxController {
  //send messge to chat
  sendmessegech(var id, mess) async {
    await FirebaseFirestore.instance
        .collection("Messge")
        .doc("$id")
        .collection("mess")
        .add({
      "mess": mess,
      "id": FirebaseAuth.instance.currentUser?.uid,
      "Time": DateTime.now(),
      "type": "text"
    });
  }

  //send messge to group
  sendmessegegroup(var id, mess) async {
    var name;
    await FirebaseFirestore.instance
        .collection("user")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        name = element.get("user");
        update();
      });
    });
    await FirebaseFirestore.instance
        .collection("group")
        .doc("$id")
        .collection("mess")
        .add({
      "name": name,
      "mess": mess,
      "id": FirebaseAuth.instance.currentUser?.uid,
      "Time": DateTime.now(),
      "type": "text"
    });
  }
}
