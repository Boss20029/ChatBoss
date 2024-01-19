import 'package:chatboss/public/viwephoto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Showdetilasch extends StatefulWidget {
  final name, img, type, id;
  const Showdetilasch(
      {Key? key,
      required this.img,
      required this.name,
      required this.type,
      required this.id})
      : super(key: key);

  @override
  _ShowdetilaschState createState() => _ShowdetilaschState();
}

class _ShowdetilaschState extends State<Showdetilasch> {
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
              margin: EdgeInsets.only(right: wd * 0.85, top: hi * 0.015),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ))),

          GestureDetector(
            onTap: () {
              Get.to(() => Viwephoto(
                    img: widget.img,
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(top: hi * 0.02, right: wd * 0.025),
              child: CircleAvatar(
                backgroundImage: NetworkImage("${widget.img}"),
                radius: 70,
              ),
            ),
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
                child: Column(children: [
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
                            Container(
                              margin: EdgeInsets.only(
                                  top: hi * 0.01, left: wd * 0.01),
                              child: Text(
                                "${widget.name}",
                                style: TextStyle(
                                    fontSize: 25, color: Color(0xFF797C7B)),
                              ),
                            ),
                            widget.type == "f"
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: hi * 0.015, left: wd * 0.005),
                                    child: Icon(
                                      Icons.verified,
                                      color: Colors.blue,
                                    ),
                                  )
                                : Container()
                          ]),
                        ),
                      ),
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
                                Icons.badge_outlined,
                                size: 40,
                                color: Color(0xFF797C7B),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: hi * 0.01, left: wd * 0.01),
                              child: Text(
                                "${widget.id}",
                                style: TextStyle(
                                    fontSize: 25, color: Color(0xFF797C7B)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: hi * 0.01,
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    Clipboard.setData(
                                        ClipboardData(text: "${widget.id}"));
                                  },
                                  icon: Icon(
                                    Icons.copy,
                                    size: 30,
                                    color: Color(0xFF797C7B),
                                  )),
                            )
                          ]),
                        ),
                      )
                    ],
                  )),
                ])),
          )
        ],
      )),
    );
  }
}
