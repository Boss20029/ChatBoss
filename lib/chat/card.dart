import 'package:flutter/material.dart';

class Cardm extends StatelessWidget {
  final img, name, comand, type;
  const Cardm(
      {Key? key, required this.img, required this.name, this.comand, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hi = MediaQuery.sizeOf(context).height;
    var wd = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: comand,
      child: Container(
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
                      backgroundImage: NetworkImage("$img"),
                      radius: 30,
                      /*   child: Container(
                        margin:
                            EdgeInsets.only(top: hi * 0.05, left: wd * 0.12),
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
                      "$name",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  type == "f"
                      ? Container(
                          margin: EdgeInsets.only(
                              top: hi * 0.005, left: wd * 0.005),
                          child: Icon(
                            Icons.verified,
                            color: Colors.blue,
                          ),
                        )
                      : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
