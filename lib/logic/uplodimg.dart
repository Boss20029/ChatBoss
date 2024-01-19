import 'dart:io';
import 'dart:math';

import 'package:chatboss/chat/chats.dart';
import 'package:chatboss/chat/group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class img extends GetxController {
  // back up img from gallerry
  late File i;

  var name;
  gallerry() async {
    var m = ImagePicker();
    var img = await m.pickImage(source: ImageSource.gallery);
    if (img != null) {
      i = File(img!.path);
      name = basename(img!.path);
      update();
    } else {
      Get.defaultDialog(
        title: "Alert",
        content: Text("Choose an image"),
      );
    }
  }

  //  from camera
  camer() async {
    var m = ImagePicker();
    var img = await m.pickImage(source: ImageSource.camera);
    if (img != null) {
      i = File(img!.path);
      name = basename(img!.path);
      update();
    } else {
      Get.defaultDialog(
        title: "Alert",
        content: Text("Choose an image"),
      );
    }
  }

//uploud img to data base
  senddata() async {
    if (name != null) {
      var red = FirebaseStorage.instance.ref("images/$name");
      await red.putFile(i);
      var url = await red.getDownloadURL();
      var m = await FirebaseAuth.instance.currentUser?.uid;
      await FirebaseFirestore.instance
          .collection("user")
          .where("id", isEqualTo: m)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          element.reference.update({
            "img": url,
          });
        });
      });
      Get.offAll(() => const Chats());
    } else {
      Get.defaultDialog(
        title: "Alert",
        content: Text("Enter data"),
      );
    }
  }

  // change photo

  changeph() async {
    if (name != null) {
      var red = FirebaseStorage.instance.ref("images/$name");
      await red.putFile(i);
      var url = await red.getDownloadURL();
      var m = await FirebaseAuth.instance.currentUser?.uid;
      await FirebaseFirestore.instance
          .collection("user")
          .where("id", isEqualTo: m)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          element.reference.update({
            "img": url,
          });
        });
      });
      Get.snackbar("Alert", "Done");
    } else {
      Get.defaultDialog(
        title: "Alert",
        content: Text("Enter data"),
      );
    }
  }

  //uploud img to data base
  groupphoto(
    var namem,
  ) async {
    if (name != null && namem != "") {
      Get.snackbar("Alet", "wait");
      var red = FirebaseStorage.instance.ref("group/$name");
      await red.putFile(i);
      var url = await red.getDownloadURL();
      var m = await FirebaseAuth.instance.currentUser?.uid;
      var roomid = Random().nextInt(10000) * 5;
      await FirebaseFirestore.instance.collection("group").doc("$roomid").set({
        "roomid": roomid,
        "name": namem,
        "img": url,
        "id": ["${FirebaseAuth.instance.currentUser?.uid}"]
      });

      Get.offAll(() => const group());
    } else {
      Get.defaultDialog(
        title: "Alert",
        content: Text("Enter data"),
      );
    }
  }

  // join group
  Joingroup(var idsm) async {
    var done;

    await FirebaseFirestore.instance
        .collection("group")
        .doc("$idsm")
        .get()
        .then((value) {
      done = "d";
      update();
    });
    if (done == "d") {
      await FirebaseFirestore.instance
          .collection("group")
          .doc("$idsm")
          .get()
          .then((value) {
        value.reference.update({
          "id": FieldValue.arrayUnion(
              ["${FirebaseAuth.instance.currentUser?.uid}"]),
        });
      });
      Get.snackbar("Alert", "Done");
      Get.back();
    } else {
      Get.snackbar("Alert", "Not found");
    }
  }
}
