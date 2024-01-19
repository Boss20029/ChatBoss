import 'package:chatboss/logic/getdaea.dart';
import 'package:chatboss/logic/uplodimg.dart';
import 'package:chatboss/public/choce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class changephoto extends StatefulWidget {
  const changephoto({Key? key}) : super(key: key);

  @override
  _changephotoState createState() => _changephotoState();
}

class _changephotoState extends State<changephoto> {
  img con = Get.put(img());
  data co = Get.put(data());
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
                      Expanded(
                          child: ListView(
                        children: [
                          SizedBox(
                            height: hi * 0.05,
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
                          GestureDetector(
                            onTap: () async {
                              await con.changeph();
                              co.getdata();
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
                                  "Continuo",
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
