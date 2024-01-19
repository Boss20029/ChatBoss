import 'package:chatboss/logic/uplodimg.dart';
import 'package:chatboss/public/choce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class creategroup extends StatefulWidget {
  const creategroup({Key? key}) : super(key: key);

  @override
  _creategroupState createState() => _creategroupState();
}

class _creategroupState extends State<creategroup> {
  img con = Get.put(img());
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.sizeOf(context).height;
    var wd = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xFFA4DC5D),
      body: SafeArea(
          child: Column(
        children: [
          //backbutton
          Container(
              margin: EdgeInsets.only(right: wd * 0.85, top: hi * 0.01),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ))),
          // img
          Center(
            child: Container(
                margin: EdgeInsets.only(top: hi * 0.05),
                child: GetBuilder<img>(
                  builder: (controller) {
                    return CircleAvatar(
                      backgroundImage: controller.name != null
                          ? FileImage(controller.i!) as ImageProvider<Object>
                          : NetworkImage(
                                  "https://w7.pngwing.com/pngs/691/765/png-transparent-primary-profile-illustration-computer-icons-person-anonymous-miscellaneous-silhouette-black.png")
                              as ImageProvider<Object>,
                      radius: 60,
                    );
                  },
                )),
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
                child: Container(
                  child: Column(
                    children: [
                      // name
                      Container(
                        margin: EdgeInsets.only(top: hi * 0.05),
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search,
                                  size: 35, color: Color(0xFFB9C6CC)),
                              label: Text("name",
                                  style: TextStyle(
                                      color: Color(0xFFB9C6CC), fontSize: 20)),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      style: BorderStyle.none, width: 0))),
                        ),
                      ),
                      // button uplod img
                      Expanded(
                          child: ListView(
                        children: [
                          SizedBox(
                            height: hi * 0.01,
                          ),
                          GestureDetector(
                            onTap: () {
                              choce(context, () {
                                con.camer();
                              }, () {
                                con.gallerry();
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    left: wd * 0.1, right: wd * 0.1),
                                decoration: BoxDecoration(
                                    color: Color(0xFFB9C6CC),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "Upload a photo",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //create
                          GestureDetector(
                            onTap: () async {
                              con.groupphoto(name.text);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    left: wd * 0.1, right: wd * 0.1),
                                decoration: BoxDecoration(
                                    color: Color(0xFFB9C6CC),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "Create Groub",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                )),
          )
        ],
      )),
    );
  }
}
