import 'package:chatboss/logic/singin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class request extends StatefulWidget {
  const request({Key? key}) : super(key: key);

  @override
  _requestState createState() => _requestState();
}

class _requestState extends State<request> {
  TextEditingController em = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController usr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.sizeOf(context).height;
    var wd = MediaQuery.sizeOf(context).width;
    singin con = Get.put(singin());
    return Scaffold(
      backgroundColor: Color(0xFFA4DC5D),
      body: SafeArea(
          child: Column(
        children: [
          //img
          Container(
            child:
                Image(image: AssetImage("images/logo.png"), height: hi * 0.25),
          ),

          //content
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF8FBFB),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                margin: EdgeInsets.only(top: hi * 0.05),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            child: Column(children: [
                              SizedBox(
                                height: hi * 0.05,
                              ),
                              Container(
                                child: Text(
                                  "request",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              SizedBox(
                                height: hi * 0.05,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: wd * 0.1, right: wd * 0.1),
                                child: TextField(
                                  maxLength: 10,
                                  controller: usr,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person,
                                          size: 35, color: Color(0xFFB9C6CC)),
                                      label: Text("user name",
                                          style: TextStyle(
                                              color: Color(0xFFB9C6CC),
                                              fontSize: 20)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                              SizedBox(
                                height: hi * 0.04,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: wd * 0.1, right: wd * 0.1),
                                child: TextField(
                                  controller: em,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email,
                                          size: 35, color: Color(0xFFB9C6CC)),
                                      label: Text("Email",
                                          style: TextStyle(
                                              color: Color(0xFFB9C6CC),
                                              fontSize: 20)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                              SizedBox(
                                height: hi * 0.04,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: wd * 0.1, right: wd * 0.1),
                                child: TextField(
                                  controller: pass,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock,
                                          size: 35, color: Color(0xFFB9C6CC)),
                                      label: Text("password",
                                          style: TextStyle(
                                              color: Color(0xFFB9C6CC),
                                              fontSize: 20)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                              SizedBox(
                                height: hi * 0.04,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Get.snackbar("Alert", "Wait");
                                  con.sng(
                                    em.text,
                                    pass.text,
                                    usr.text,
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: wd * 0.1, right: wd * 0.1),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFB9C6CC),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    "Create an account",
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: hi * 0.09,
                                    width: wd * 0.05,
                                  ),
                                  Container(
                                    child: const Text("You have an account",
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("Login",
                                        style: TextStyle(fontSize: 22)),
                                  )
                                ],
                              )
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ],
      )),
    );
  }
}
