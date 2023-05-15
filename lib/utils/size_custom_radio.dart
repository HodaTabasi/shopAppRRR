import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rrr_shop_app/controller/data/model/product.dart';
import 'package:rrr_shop_app/utils/constants.dart';

class SizeRadioItem extends StatelessWidget {
  final RadioModel _item;

  SizeRadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0.r),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            // height: 40.0,
            // width: 40.0,
            padding:  EdgeInsets.all(2.0.r),
            child: CircleAvatar(
              radius: 12.r,
              child: Text(_item.text,style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
            ),
            decoration:  BoxDecoration(
                border:  Border.all(
                    width: 2.0.r,
                    color: _item.isSelected ? Colors.red: Colors.grey),
                shape: BoxShape.circle
              // borderRadius:  BorderRadius.all( Radius.circular(50.r)),
            ),
          ),
        ],
      ),
    );
  }

  // getColor(String hexColor) {
  //   Color color =
  //   Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
  //   return color;
  // }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}

