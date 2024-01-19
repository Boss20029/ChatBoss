import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class chat extends GetxController {
  // add chat

  var namesender,
      nameclaim,
      idsender,
      idclaim,
      typesander,
      typeclaim,
      imgsender,
      imgclaim,
      iddocsender,
      spidclaim,
      spidsender,
      iddocclaim;
  Future addchat(var m) async {
    // to chek if id to user
    var idm, id, op;
    await FirebaseFirestore.instance
        .collection("user")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        idm = element.get("spid");
        id = element.id;
        update();
      });
    });
    // to chek if the new chat is exist or not
    var one, two;
    await FirebaseFirestore.instance
        .collection("user")
        .doc("$id")
        .collection("chat")
        .where("spidclaim", isEqualTo: m)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        one = "done";
        update();
      });
    });
    await FirebaseFirestore.instance
        .collection("user")
        .doc("$id")
        .collection("chat")
        .where("spidsender", isEqualTo: m)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        two = "done";
        update();
      });
    });
    await FirebaseFirestore.instance
        .collection("user")
        .where("spid", isEqualTo: m)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        op = "done";
        update();
      });
    });
    if (idm == m) {
      Get.snackbar("Alert", "This is yor Id");
    } else if (one == "done") {
      Get.snackbar("Alert", "This chat is exist");
    } else if (two == "done") {
      Get.snackbar("Alert", "This chat is exist");
    } else if (op == "done") {
      // get data sender
      var room = Random().nextInt(10000) * 5;

      await FirebaseFirestore.instance
          .collection("user")
          .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          namesender = element.get("user");
          idsender = element.get("id");
          imgsender = element.get("img");
          typesander = element.get("type");
          iddocsender = element.id;
          spidsender = element.get("spid");
          update();
        });
      });
      // get data claim

      await FirebaseFirestore.instance
          .collection("user")
          .where("spid", isEqualTo: m)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          nameclaim = element.get("user");
          idclaim = element.get("id");
          imgclaim = element.get("img");
          typeclaim = element.get("type");
          iddocclaim = element.id;
          spidclaim = element.get("spid");
          print(nameclaim);
          update();
          print(nameclaim);
        });
      });

      //send request to sender
      await FirebaseFirestore.instance
          .collection("user")
          .doc("${iddocsender}")
          .collection("chat")
          .add({
        "imgsender": imgsender,
        "imgclaim": imgclaim,
        "idsender": idsender,
        "idclaim": idclaim,
        "typesander": typesander,
        "typeclaim": typeclaim,
        "namesender": namesender,
        "nameclaim": nameclaim,
        "roomid": room,
        "spidclaim": spidclaim,
        "spidsender": spidsender
      });
      //send request to claim

      await FirebaseFirestore.instance
          .collection("user")
          .doc("${iddocclaim}")
          .collection("chat")
          .add({
        "imgsender": imgsender,
        "imgclaim": imgclaim,
        "idsender": idsender,
        "idclaim": idclaim,
        "typesander": typesander,
        "typeclaim": typeclaim,
        "namesender": namesender,
        "nameclaim": nameclaim,
        "roomid": room,
        "spidclaim": spidclaim,
        "spidsender": spidsender
      });
      Get.snackbar("Alert", "Done");
    } else {
      Get.snackbar("Alert", "Not found");
    }
  }
}
