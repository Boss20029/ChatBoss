import 'package:flutter/material.dart';

class Viwephoto extends StatefulWidget {
  final img;
  const Viwephoto({Key? key, required this.img}) : super(key: key);

  @override
  _ViwephotoState createState() => _ViwephotoState();
}

class _ViwephotoState extends State<Viwephoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("${widget.img}"), fit: BoxFit.cover)),
      ),
    );
  }
}
