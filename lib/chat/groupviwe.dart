import 'package:chatboss/chat/showdetilasgroup.dart';
import 'package:chatboss/logic/sendmess.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class groupviwe extends StatefulWidget {
  final img, name, roomid;
  const groupviwe({
    Key? key,
    required this.img,
    required this.name,
    this.roomid,
  }) : super(key: key);

  @override
  _groupviweState createState() => _groupviweState();
}

class _groupviweState extends State<groupviwe> {
  sendmess con = Get.put(sendmess());
  TextEditingController ms = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.sizeOf(context).height;
    var wd = MediaQuery.sizeOf(context).width;
    sendmess co = Get.put(sendmess());
    return Scaffold(
      backgroundColor: Color(0xFFA4DC5D),
      body: SafeArea(
          child: Column(
        children: [
          //backbutton
          Container(
              margin: EdgeInsets.only(right: wd * 0.85, top: hi * 0.015),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ))),
          //card
          GestureDetector(
            onTap: () {
              Get.to(() => showdetilasgroup(
                    img: widget.img,
                    name: widget.name,
                    id: widget.roomid,
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
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: NetworkImage("${widget.img}"),
                            radius: 30,
                            /* child: Container(
                              margin: EdgeInsets.only(
                                  top: hi * 0.05, left: wd * 0.12),
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 10,
                              ),
                            ),*/
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: wd * 0.05),
                          child: Text(
                            "${widget.name}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          //content
          Expanded(
              child: Container(
            margin: EdgeInsets.only(top: hi * 0.07),
            decoration: BoxDecoration(
                color: Color(0xFFF8FBFB),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35))),
            child: Column(
              children: [
                Expanded(
                    child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("group")
                      .doc("${widget.roomid}")
                      .collection("mess")
                      .orderBy("Time", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                          margin: EdgeInsets.only(top: hi * 0.015),
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            reverse: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Align(
                                      alignment: snapshot.data!.docs[index]
                                                  ["id"] ==
                                              FirebaseAuth
                                                  .instance.currentUser!.uid
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      child: Container(
                                          padding: EdgeInsets.all(10.0),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15.0, horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: snapshot.data!.docs[index]
                                                        ["id"] ==
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid
                                                ? Colors.white
                                                : Color(0xFFA4DC5D),
                                            boxShadow: snapshot.data!
                                                        .docs[index]["id"] ==
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid
                                                ? [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      blurRadius: 5,
                                                    ),
                                                  ]
                                                : [
                                                    BoxShadow(),
                                                  ],
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "${snapshot.data!.docs[index]["name"]}",
                                                style: TextStyle(
                                                    color: snapshot.data!
                                                                    .docs[index]
                                                                ["id"] ==
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid
                                                        ? Colors.limeAccent
                                                        : Colors.blueAccent,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                height: hi * 0.001,
                                              ),
                                              Text(
                                                "${snapshot.data!.docs[index]["mess"]}",
                                                style: TextStyle(
                                                  color:
                                                      snapshot.data!.docs[index]
                                                                  ["id"] ==
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid
                                                          ? Colors.black
                                                          : Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ))));
                            },
                          ));
                    }
                    return Container();
                  },
                )),
                //fill send messg
                Container(
                  height: hi * 0.12,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35))),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: ms,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF2F2F2),
                          hintText: "Type messege here",
                          hintStyle: TextStyle(
                            color: Color(0xFF9CA6AE),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                if (ms.text == "") {
                                  Get.snackbar("Alert", "Error");
                                } else {
                                  await con.sendmessegegroup(
                                      widget.roomid, ms.text);
                                  ms.clear();
                                }
                              },
                              icon: Icon(
                                Icons.send,
                                color: Color(0xFFA4DC5D),
                              )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  width: 0, style: BorderStyle.none))),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}
