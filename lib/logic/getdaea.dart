import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class data extends GetxController {
  var name, id, img, type, email, iddoc;

  //جلب البيانات

  getdata() async {
    await FirebaseFirestore.instance
        .collection("user")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        name = element.get("user");
        img = element.get("img");
        type = element.get("type");
        email = element.get("email");
        id = element.get("spid");
        iddoc = element.id;
        update();
        print(name);
      });
    });
  }
  //change name

  changenam(var name) async {
    await FirebaseFirestore.instance
        .collection("user")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.update({"user": name});
      });
    });
    getdata();
    Get.snackbar("Alert", "Done");
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
