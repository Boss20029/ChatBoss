import 'package:flutter/material.dart';

addchat(context, var voidm, tdc) {
  var hi = MediaQuery.sizeOf(context).height;
  var wd = MediaQuery.sizeOf(context).width;

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
                    controller: tdc,
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
                onTap: voidm,
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
