import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

class CoustomDialog extends StatelessWidget {
  late String title;
  late VoidCallback onClick;
  late String image;

  CoustomDialog(
      {required this.title, required this.onClick, required this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding:
              EdgeInsets.only(left: 16, top: 45 + 16, right: 16, bottom: 16),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.black, offset: Offset(0, 10), blurRadius: 5),
            // ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset("assets/images/$image"),
              getSpace(h: 16.r),
              Text(
                "$title",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ).tr(),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: divider,
                thickness: 1,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: onClick,
                      child: Text(
                        "yes",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ).tr(),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      color: divider,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "no",
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ).tr(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
