import 'package:flutter/material.dart';

getSpace({w = 0.0,h = 0.0}){
  return SizedBox(
    width: w,
    height: h,
  );
}

getRichText({S1,S2,S3,mainColor,fontWeight}){
  return  RichText(
    text: TextSpan(
      text: S1,
      style:TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontFamily: 'avenir'),
      children:  <TextSpan>[
        TextSpan(text: S2, style: TextStyle(fontWeight: fontWeight,color: mainColor)),
        TextSpan(text: S3),
      ],
    ),
  );
}