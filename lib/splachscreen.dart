import 'dart:async';

import 'package:chatboss/chat/chats.dart';
import 'package:chatboss/login%20and%20request/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splachscreen extends StatefulWidget {
  const Splachscreen({Key? key}) : super(key: key);

  @override
  _SplachscreenState createState() => _SplachscreenState();
}

class _SplachscreenState extends State<Splachscreen> {
  move() async {
    var id = await FirebaseAuth.instance.currentUser?.uid;
    Timer(Duration(seconds: 4), () {
      if (id != null) {
        Get.offAll(() => const Chats());
      } else {
        Get.offAll(() => const login());
      }
      //  Get.offAll(() => const login());
    });
  }

  @override
  void initState() {
    move();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA4DC5D),
      body: SafeArea(
          child: Column(
        children: [Expanded(child: Image.asset("images/logo.png"))],
      )),
    );
  }
}
