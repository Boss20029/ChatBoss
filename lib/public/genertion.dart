import 'package:chatboss/chat/creategroup.dart';
import 'package:chatboss/logic/uplodimg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

loding(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: CircularProgressIndicator(),
      );
    },
  );
}

groupaction(
  context,
) {
  var hi = MediaQuery.sizeOf(context).height;
  var wd = MediaQuery.sizeOf(context).width;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color(0xFFA4DC5D),
        content: Container(
          height: hi * 0.25,
          child: Column(
            children: [
              SizedBox(
                height: hi * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  joingroup(
                    context,
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: wd * 0.1, right: wd * 0.1),
                  decoration: BoxDecoration(
                      color: Color(0xFFF8FBFB),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Join a group",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: hi * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.to(() => const creategroup());
                },
                child: Container(
                  padding: EdgeInsets.only(left: wd * 0.1, right: wd * 0.1),
                  decoration: BoxDecoration(
                      color: Color(0xFFF8FBFB),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Create  group",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

joingroup(
  context,
) {
  var hi = MediaQuery.sizeOf(context).height;
  var wd = MediaQuery.sizeOf(context).width;
  img con = Get.put(img());
  TextEditingController id = TextEditingController();
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
                    style: TextStyle(fontSize: 30, color: Color(0xFFF8FBFB))),
              ),
              //search

              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: hi * 0.05),
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: TextField(
                    controller: id,
                    autofocus: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                            size: 35, color: Color(0xFFB9C6CC)),
                        label: Text("User id",
                            style: TextStyle(
                                color: Color(0xFFB9C6CC), fontSize: 20)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(style: BorderStyle.none, width: 0))),
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
                  await con.Joingroup(id.text);
                  id.clear();
                  print(id.text);
                },
                child: Container(
                  padding: EdgeInsets.only(left: wd * 0.1, right: wd * 0.1),
                  decoration: BoxDecoration(
                      color: Color(0xFFF8FBFB),
                      borderRadius: BorderRadius.circular(30)),
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
}

lodings(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Container(
          height: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}
