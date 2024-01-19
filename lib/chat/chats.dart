import 'package:chatboss/chat/card.dart';
import 'package:chatboss/chat/chatviwe.dart';
import 'package:chatboss/chat/group.dart';
import 'package:chatboss/logic/addchat.dart';
import 'package:chatboss/logic/getdaea.dart';
import 'package:chatboss/profile/profile.dart';
import 'package:chatboss/public/viwephoto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  var m;
  getid() async {
    await FirebaseFirestore.instance
        .collection("user")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        setState(() {
          m = element.id;
        });
      });
    });
  }

  @override
  void initState() {
    getid();
    super.initState();
  }

  data con = Get.put(data());
  chat co = Get.put(chat());
  TextEditingController id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.sizeOf(context).height;
    var wd = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xFFA4DC5D),
      body: SafeArea(
          child: Column(
        children: [
          //img and hi name
          Container(
            margin: EdgeInsets.only(top: hi * 0.03, left: wd * 0.07),
            child: Row(
              children: [
                Container(child: GetBuilder<data>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => Viwephoto(img: controller.img));
                      },
                      child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              "${controller.img != null ? controller.img : "https://w7.pngwing.com/pngs/691/765/png-transparent-primary-profile-illustration-computer-icons-person-anonymous-miscellaneous-silhouette-black.png"}")),
                    );
                  },
                )),
                Container(
                  margin: EdgeInsets.only(left: wd * 0.05),
                  child: GetBuilder<data>(
                    builder: (controller) {
                      return Text(
                        'Hi, ${controller.name}',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          //search
          /*  GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: hi * 0.05),
              padding: EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                autofocus: false,
                enabled: false,
                decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.search, size: 35, color: Color(0xFFB9C6CC)),
                    label: Text("Search Chat",
                        style:
                            TextStyle(color: Color(0xFFB9C6CC), fontSize: 20)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(style: BorderStyle.none, width: 0))),
              ),
            ),
          ),*/
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
                    //cardm genration
                    Expanded(
                        child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("user")
                          .doc(con.iddoc)
                          .collection("chat")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                /*   onLongPress: () async {
                                  /*           var ids = snapshot.data!.docs[index].id;
                                  await FirebaseFirestore.instance
                                      .collection("user")
                                      .doc(con.iddoc)
                                      .collection("chat")
                                      .doc("$ids")
                                      .delete();*/
                                },*/
                                child: Cardm(
                                  type: snapshot.data?.docs[index]["idclaim"] ==
                                          FirebaseAuth.instance.currentUser?.uid
                                      ? snapshot.data?.docs[index]["typesander"]
                                      : snapshot.data?.docs[index]["typeclaim"],
                                  comand: () {
                                    Get.to(() => Chatviwe(
                                          roomid: snapshot.data!.docs[index]
                                              ["roomid"],
                                          id: snapshot.data?.docs[index]
                                                      ["idclaim"] ==
                                                  FirebaseAuth
                                                      .instance.currentUser?.uid
                                              ? snapshot.data?.docs[index]
                                                  ["idsender"]
                                              : snapshot.data?.docs[index]
                                                  ["idclaim"],
                                          img: snapshot.data?.docs[index]
                                                      ["idclaim"] ==
                                                  FirebaseAuth
                                                      .instance.currentUser?.uid
                                              ? snapshot.data?.docs[index]
                                                  ["imgsender"]
                                              : snapshot.data?.docs[index]
                                                  ["imgclaim"],
                                          name: snapshot.data?.docs[index]
                                                      ["idclaim"] ==
                                                  FirebaseAuth
                                                      .instance.currentUser?.uid
                                              ? snapshot.data?.docs[index]
                                                  ["namesender"]
                                              : snapshot.data?.docs[index]
                                                  ["nameclaim"],
                                          typer: snapshot.data?.docs[index]
                                                      ["idclaim"] ==
                                                  FirebaseAuth
                                                      .instance.currentUser?.uid
                                              ? snapshot.data?.docs[index]
                                                  ["typesander"]
                                              : snapshot.data?.docs[index]
                                                  ["typeclaim"],
                                        ));
                                  },
                                  img: snapshot.data?.docs[index]["idclaim"] ==
                                          FirebaseAuth.instance.currentUser?.uid
                                      ? snapshot.data?.docs[index]["imgsender"]
                                      : snapshot.data?.docs[index]["imgclaim"],
                                  name: snapshot.data?.docs[index]["idclaim"] ==
                                          FirebaseAuth.instance.currentUser?.uid
                                      ? snapshot.data?.docs[index]["namesender"]
                                      : snapshot.data?.docs[index]["nameclaim"],
                                ),
                              );
                            },
                          );
                        }
                        return Center(
                          child: Text("dont have chat"),
                        );
                      },
                    )),
                    //bottom bar
                    Container(
                      height: hi * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
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
                          Container(
                            margin: EdgeInsets.only(left: wd * 0.1),
                            child: Icon(
                              Icons.chat,
                              size: 40,
                              color: Color(0xFFA4DC5D),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => group());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: wd * 0.15),
                              child: Icon(
                                Icons.group,
                                size: 35,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFE0E0E0),
                                borderRadius: BorderRadius.circular(30)),
                            margin: EdgeInsets.only(left: wd * 0.15),
                            child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: Color(0xFFA4DC5D),
                                        content: Container(
                                          height: hi * 0.3,
                                          child: Column(
                                            children: [
                                              //name

                                              Container(
                                                child: Text("Add chat",
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        color:
                                                            Color(0xFFF8FBFB))),
                                              ),
                                              //search

                                              GestureDetector(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: hi * 0.05),
                                                  padding: EdgeInsets.only(
                                                      left: 25, right: 25),
                                                  child: TextField(
                                                    controller: id,
                                                    autofocus: true,
                                                    decoration: InputDecoration(
                                                        prefixIcon: Icon(
                                                            Icons.search,
                                                            size: 35,
                                                            color: Color(
                                                                0xFFB9C6CC)),
                                                        label: Text("User id",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFFB9C6CC),
                                                                fontSize: 20)),
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            borderSide:
                                                                BorderSide(
                                                                    style:
                                                                        BorderStyle
                                                                            .none,
                                                                    width: 0))),
                                                  ),
                                                ),
                                              ),

                                              // space

                                              SizedBox(
                                                height: hi * 0.05,
                                              ),
                                              // button to add chat

                                              GestureDetector(
                                                onTap: () async {
                                                  Get.snackbar("Alert", "Wait");
                                                  await co.addchat(id.text);
                                                  print("done");
                                                  id.clear();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: wd * 0.1,
                                                      right: wd * 0.1),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFF8FBFB),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: Text(
                                                    "Add",
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.add)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => profil());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: wd * 0.12),
                              child: Icon(
                                Icons.person,
                                size: 35,
                              ),
                            ),
                          )
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
