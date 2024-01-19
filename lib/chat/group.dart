import 'package:chatboss/chat/card.dart';
import 'package:chatboss/chat/chats.dart';
import 'package:chatboss/chat/groupviwe.dart';
import 'package:chatboss/logic/getdaea.dart';
import 'package:chatboss/profile/profile.dart';
import 'package:chatboss/public/genertion.dart';
import 'package:chatboss/public/viwephoto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class group extends StatefulWidget {
  const group({Key? key}) : super(key: key);

  @override
  _groupState createState() => _groupState();
}

class _groupState extends State<group> {
  data con = Get.put(data());

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
          /*  Container(
            margin: EdgeInsets.only(top: hi * 0.05),
            padding: EdgeInsets.only(left: 25, right: 25),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.search, size: 35, color: Color(0xFFB9C6CC)),
                  label: Text("Search Group",
                      style: TextStyle(color: Color(0xFFB9C6CC), fontSize: 20)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(style: BorderStyle.none, width: 0))),
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
                          .collection("group")
                          .where("id",
                              arrayContains:
                                  FirebaseAuth.instance.currentUser!.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onLongPress: () async {
                                  /*           var ids = snapshot.data!.docs[index].id;
                                  await FirebaseFirestore.instance
                                      .collection("user")
                                      .doc(con.iddoc)
                                      .collection("chat")
                                      .doc("$ids")
                                      .delete();*/
                                  var pos = snapshot.data!.docs[index].id;
                                  await FirebaseFirestore.instance
                                      .collection("group")
                                      .doc("$pos")
                                      .get()
                                      .then((value) {
                                    value.reference.update({
                                      "id": FieldValue.arrayRemove([
                                        "${FirebaseAuth.instance.currentUser?.uid}"
                                      ])
                                    });
                                  });
                                },
                                child: Cardm(
                                  comand: () {
                                    Get.to(() => groupviwe(
                                          roomid: snapshot.data!.docs[index]
                                              ["roomid"],
                                          img: snapshot.data!.docs[index]
                                              ["img"],
                                          name: snapshot.data!.docs[index]
                                              ["name"],
                                        ));
                                  },
                                  img: snapshot.data!.docs[index]["img"],
                                  name: snapshot.data!.docs[index]["name"],
                                ),
                              );
                            },
                          );
                        }
                        return const Center(
                          child: Text("dont have Group"),
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
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => Chats());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: wd * 0.1),
                              child: Icon(
                                Icons.chat,
                                size: 35,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: wd * 0.15),
                            child: Icon(
                              Icons.group,
                              size: 40,
                              color: Color(0xFFA4DC5D),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFE0E0E0),
                                borderRadius: BorderRadius.circular(30)),
                            margin: EdgeInsets.only(left: wd * 0.15),
                            child: IconButton(
                                onPressed: () {
                                  groupaction(
                                    context,
                                  );
                                  // Get.to(() => const creategroup());
                                },
                                icon: Icon(Icons.add)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => const profil());
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
