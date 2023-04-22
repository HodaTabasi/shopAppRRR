import 'dart:ui';

import 'package:flutter/material.dart';

import 'SizeConfig.dart';

Color mainColor = Color(0xff957255);

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  // border: outlineInputBorder(),
  // focusedBorder: outlineInputBorder(),
  // enabledBorder: outlineInputBorder(),
  fillColor: Colors.white,
  filled: true,
  counterStyle: TextStyle(height: double.minPositive,),
  counterText: "",
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    // borderSide: BorderSide(color: Color(0xffDCDCDC)),
  );
}