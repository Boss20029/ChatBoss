import 'dart:math';

import 'package:chatboss/login%20and%20request/imgeup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class singin extends GetxController {
  //sing in

  sng(
    var em,
    var pass,
    var usr,
  ) async {
    int k = Random().nextInt(1000) * 2;
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: em,
        password: pass,
      );

      await FirebaseFirestore.instance.collection("user").add({
        "user": usr,
        "email": em,
        "pass": pass,
        "type": "",
        "img": "",
        "id": FirebaseAuth.instance.currentUser?.uid,
        "spid": "$k"
      });

      Get.offAll(() => const Imgeup());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Alert", "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Alert", "The account already exists for that email");
      }
    } catch (e) {
      print(e);
    }
  }
}
