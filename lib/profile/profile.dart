import 'package:chatboss/chat/chats.dart';
import 'package:chatboss/chat/group.dart';
import 'package:chatboss/logic/getdaea.dart';
import 'package:chatboss/login%20and%20request/login.dart';
import 'package:chatboss/profile/changename.dart';
import 'package:chatboss/profile/changephoto.dart';
import 'package:chatboss/profile/profileviwe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profil extends StatefulWidget {
  const profil({Key? key}) : super(key: key);

  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  data con = Get.put(data());

  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.sizeOf(context).height;
    var wd = MediaQuery.sizeOf(context).width;
    var typer = "f";
    return Scaffold(
      backgroundColor: Color(0xFFA4DC5D),
      body: SafeArea(
          child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => profileviwe(
                    email: con.email,
                    id: con.id,
                    img: con.img,
                    name: con.name,
                    type: con.type,
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(left: wd * 0.028),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: hi * 0.05),
                    height: hi * 0.13,
                    width: wd * 0.85,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFFFFFFF)),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: wd * 0.05),
                          child: GetBuilder<data>(
                            builder: (controller) {
                              return CircleAvatar(
                                backgroundColor: Colors.black,
                                backgroundImage: NetworkImage(
                                    "${controller.img != null ? controller.img : "https://w7.pngwing.com/pngs/691/765/png-transparent-primary-profile-illustration-computer-icons-person-anonymous-miscellaneous-silhouette-black.png"}"),
                                radius: 30,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: hi * 0.05, left: wd * 0.12),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 10,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: wd * 0.05),
                          child: GetBuilder<data>(
                            builder: (controller) {
                              return Text(
                                "${controller.name}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              );
                            },
                          ),
                        ),
                        GetBuilder<data>(
                          builder: (controller) {
                            return controller.type == "f"
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: hi * 0.005, left: wd * 0.005),
                                    child: Icon(
                                      Icons.verified,
                                      color: Colors.blue,
                                    ),
                                  )
                                : Container();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
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
                    //cardm genration
                    Expanded(
                        child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            margin: EdgeInsets.only(top: hi * 0.05),
                            height: hi * 0.13,
                            width: wd * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Row(children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: wd * 0.1,
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Color(0xFF797C7B),
                                ),
                              ),

//name

                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const Changename());
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: hi * 0.01, left: wd * 0.01),
                                  child: const Text(
                                    "Change name",
                                    style: TextStyle(
                                        fontSize: 25, color: Color(0xFF797C7B)),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const changephoto());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Container(
                              margin: EdgeInsets.only(top: hi * 0.05),
                              height: hi * 0.13,
                              width: wd * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Row(children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: wd * 0.1,
                                  ),
                                  child: const Icon(
                                    Icons.photo,
                                    size: 40,
                                    color: Color(0xFF797C7B),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: hi * 0.01, left: wd * 0.01),
                                  child: Text(
                                    "Change photo",
                                    style: TextStyle(
                                        fontSize: 25, color: Color(0xFF797C7B)),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            Get.offAll(() => login());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Container(
                              margin: EdgeInsets.only(top: hi * 0.05),
                              height: hi * 0.13,
                              width: wd * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Row(children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: wd * 0.1,
                                  ),
                                  child: Icon(
                                    Icons.exit_to_app,
                                    size: 40,
                                    color: Color(0xFF797C7B),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: hi * 0.01, left: wd * 0.01),
                                  child: Text(
                                    "Log out",
                                    style: TextStyle(
                                        fontSize: 25, color: Color(0xFF797C7B)),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        )
                      ],
                    )),
                    //bottom bar
                    Container(
                      height: hi * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                            ),
                          ],
                          color: Colors.white),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => const Chats());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: wd * 0.15),
                              child: const Icon(
                                Icons.chat,
                                size: 35,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => group());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: wd * 0.2),
                              child: const Icon(
                                Icons.group,
                                size: 35,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: wd * 0.25),
                            child: const Icon(
                              Icons.person,
                              size: 40,
                              color: Color(0xFFA4DC5D),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      )),
    );
  }
}
