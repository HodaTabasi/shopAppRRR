import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../../../utils/constants.dart';

class SuppourtSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 280.h,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                padding: EdgeInsets.all(16),
                alignment: AlignmentDirectional.topEnd,
                  onPressed: (){
                  Navigator.pop(context);
                  }, icon: Icon(
                Icons.clear,
                color: Colors.red,
              )),
            ),
            getSpace(h: 16.r),
            Text(
              "m1",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ).tr(),
            Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){},
                      child: SvgPicture.asset("assets/images/Telephone conversation 42_ 42.svg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){},
                      child: SvgPicture.asset("assets/images/whats.svg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){},
                      child: SvgPicture.asset("assets/images/insta.svg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){},
                      child: SvgPicture.asset("assets/images/facebook.svg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){},
                      child: SvgPicture.asset("assets/images/twitter.svg"),
                    ),
                  ),
                ],
              ),
            ),
            getSpace(h: 16.r),
            Text(
              "m2",
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ).tr(),
          ],
        ),
      ),
    );
  }
}
