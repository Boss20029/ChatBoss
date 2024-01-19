import 'package:chatboss/chat/card.dart';
import 'package:chatboss/chat/chatviwe.dart';
import 'package:chatboss/logic/getdaea.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var type, name, img, id, roomid, done;
  getuser() async {
    if (name == null) {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(con.iddoc)
          .collection("chat")
          .where("nameclaim", isEqualTo: search.text)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          setState(() {
            type = element.get("typeclaim");
            name = element.get("nameclaim");
            img = element.get("imgclaim");
            id = element.get("spidclaim");
            roomid = element.get("roomid");
            done = "d";
          });
        });
      });
    } else if (name == null) {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(con.iddoc)
          .collection("chat")
          .where("namesender", isEqualTo: search.text)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          setState(() {
            type = element.get("typesander");
            name = element.get("namesender");
            img = element.get("imgsender");
            id = element.get("spidsender");
            roomid = element.get("roomid");
            done = "d";
          });
        });
      });
    } else {
      setState(() {
        name = "no";
      });
    }
    print("done");
  }

  data con = Get.put(data());
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.sizeOf(context).height;
    var wd = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: Color(0xFFA4DC5D),
        body: SafeArea(
            child: Column(children: [
          //search
          Container(
            margin: EdgeInsets.only(top: hi * 0.05),
            padding: EdgeInsets.only(left: 25, right: 25),
            child: TextField(
              controller: search,
              autofocus: true,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () {
                        getuser();
                      },
                      child: Icon(Icons.search,
                          size: 35, color: Color(0xFFB9C6CC))),
                  label: Text("Search Chat",
                      style: TextStyle(color: Color(0xFFB9C6CC), fontSize: 20)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(style: BorderStyle.none, width: 0))),
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
                        child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("user")
                          .doc(con.iddoc)
                          .collection("chat")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return done == "d"
                              ? ListView.builder(
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
                                        type: snapshot.data?.docs[index]
                                                    ["idclaim"] ==
                                                FirebaseAuth
                                                    .instance.currentUser?.uid
                                            ? snapshot.data?.docs[index]
                                                ["typesander"]
                                            : snapshot.data?.docs[index]
                                                ["typeclaim"],
                                        comand: () {
                                          Get.to(() => Chatviwe(
                                                roomid: snapshot.data!
                                                    .docs[index]["roomid"],
                                                id: snapshot.data?.docs[index]
                                                            ["idclaim"] ==
                                                        FirebaseAuth.instance
                                                            .currentUser?.uid
                                                    ? snapshot.data?.docs[index]
                                                        ["idsender"]
                                                    : snapshot.data?.docs[index]
                                                        ["idclaim"],
                                                img: snapshot.data?.docs[index]
                                                            ["idclaim"] ==
                                                        FirebaseAuth.instance
                                                            .currentUser?.uid
                                                    ? snapshot.data?.docs[index]
                                                        ["imgsender"]
                                                    : snapshot.data?.docs[index]
                                                        ["imgclaim"],
                                                name: snapshot.data?.docs[index]
                                                            ["idclaim"] ==
                                                        FirebaseAuth.instance
                                                            .currentUser?.uid
                                                    ? snapshot.data?.docs[index]
                                                        ["namesender"]
                                                    : snapshot.data?.docs[index]
                                                        ["nameclaim"],
                                                typer: snapshot.data
                                                                ?.docs[index]
                                                            ["idclaim"] ==
                                                        FirebaseAuth.instance
                                                            .currentUser?.uid
                                                    ? snapshot.data?.docs[index]
                                                        ["typesander"]
                                                    : snapshot.data?.docs[index]
                                                        ["typeclaim"],
                                              ));
                                        },
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
                                      ),
                                    );
                                  },
                                )
                              : name != "no"
                                  ? Cardm(
                                      type: type,
                                      comand: () {
                                        Get.to(() => Chatviwe(
                                              roomid: roomid,
                                              id: id,
                                              img: img,
                                              name: name,
                                              typer: type,
                                            ));
                                      },
                                      img: img,
                                      name: name,
                                    )
                                  : Container(
                                      child: Center(
                                        child: Text("Not found"),
                                      ),
                                    );
                        }
                        return Center(
                          child: Text("dont have chat"),
                        );
                      },
                    )),
                  ],
                )),
          )
        ])));
  }
}
