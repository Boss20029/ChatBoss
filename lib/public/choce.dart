import 'package:flutter/material.dart';

choce(context, var camer, var gallory) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SizedBox(
        height: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: camer,
              child: Container(
                child: ListTile(
                  title:
                      Text("Image from camera", style: TextStyle(fontSize: 30)),
                  leading: Icon(
                    Icons.camera_alt,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: gallory,
              child: Container(
                child: ListTile(
                  title: Text(
                    "Image from Gallery",
                    style: TextStyle(fontSize: 30),
                  ),
                  leading: Icon(
                    Icons.photo,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
