import 'package:easy_localization/easy_localization.dart' as data;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/get/fillter_getx.dart';

import '../../core/btn_layout.dart';

class Choosere extends StatefulWidget {

  @override
  _ChoosereState createState() => _ChoosereState();
}

class _ChoosereState extends State<Choosere> {
  var _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: [
          Flexible(
              child: BtnLayout(
                title: data.tr("trend"),
                value: 0,
                groupValue: _value,
                onChanged: (value) => setState(() {
                  _value = value;
                  FillterGetXController.to.valueType = _value;
                   }),
              )),
          Flexible(
              child: BtnLayout(
                  title: data.tr("new2"),
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) => setState(() {
                    _value = value;
                    FillterGetXController.to.valueType = _value;
                  } ))),
          Flexible(
              child: BtnLayout(
                  title: data.tr("offer"),
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) => setState(() {
                    _value = value;
                    FillterGetXController.to.valueType = _value;
                  } ))),
        ],
      ),
    );
  }
}