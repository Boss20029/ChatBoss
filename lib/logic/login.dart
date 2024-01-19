import 'package:chatboss/chat/chats.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class loginm extends GetxController {
  //login

  logi(var em, var pass) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: em, password: pass);
      Get.offAll(() => Chats());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Alert", "The data is incorrect");
    }
  }
}
