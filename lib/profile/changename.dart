import 'package:chatboss/logic/getdaea.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Changename extends StatefulWidget {
  const Changename({Key? key}) : super(key: key);

  @override
  _ChangenameState createState() => _ChangenameState();
}

class _ChangenameState extends State<Changename> {
  data co = Get.put(data());
  TextEditingController usr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.sizeOf(context).height;
    var wd = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xFFA4DC5D),
      body: SafeArea(
          child: Column(
        children: [
          //back button

          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: wd * 0.85, top: hi * 0.015),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  )),
            ),
          ),
          // content

          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFF8FBFB),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            margin: EdgeInsets.only(top: hi * 0.05),
            child: ListView(
              children: [
                SizedBox(
                  height: hi * 0.05,
                ),

                // name page

                Center(
                  child: Container(
                    child: Text(
                      "Change Name",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: hi * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(left: wd * 0.1, right: wd * 0.1),
                  child: TextField(
                    controller: usr,
                    maxLength: 10,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,
                            size: 35, color: Color(0xFFB9C6CC)),
                        label: Text("user name",
                            style: TextStyle(
                                color: Color(0xFFB9C6CC), fontSize: 20)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: hi * 0.04,
                ),

                //button change name

                GestureDetector(
                  onTap: () {
                    co.changenam(usr.text);
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: Container(
                      padding: EdgeInsets.only(left: wd * 0.1, right: wd * 0.1),
                      decoration: BoxDecoration(
                          color: Color(0xFFB9C6CC),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          "Change Name",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      )),
    );
  }
}
