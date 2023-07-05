import 'package:flutter/material.dart';
//late final BoxShape shape;

Widget calcbutton(String btntxt, Color btnColor, Color txtcolor){
  return Container(
    child: ElevatedButton(
      onPressed: () {},
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 35,
          color: txtcolor,
        ),
      ),

      /*style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        )
        //padding: EdgeInsets.all(20),
      ),*/

    style: ElevatedButton.styleFrom(
    shape: CircleBorder(), //<-- SEE HERE
    padding: EdgeInsets.all(20),
  ),
    ),
  );
}