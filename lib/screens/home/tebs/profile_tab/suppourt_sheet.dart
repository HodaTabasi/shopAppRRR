import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rrr_shop_app/utils/helper.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      onTap: (){
                        _launchUrl(Uri.parse("tel:0905305315"));
                      },
                      child: SvgPicture.asset("assets/images/Telephone conversation 42_ 42.svg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        await launch(
                            "https://wa.me/0905305315?text=Hello");
                      },
                      child: SvgPicture.asset("assets/images/whats.svg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        print("object");
                        _launchUrl(Uri.parse("https://instagram.com/rrr_store103?igshid=ZGUzMzM3NWJiOQ=="));
                      },
                      child: Image.asset("assets/images/instagram.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        _launchFaceBookUrl("https://www.facebook.com/profile.php");
                      },
                      child: SvgPicture.asset("assets/images/facebook.svg"),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: InkWell(
                  //     onTap: (){},
                  //     child: SvgPicture.asset("assets/images/twitter.svg"),
                  //   ),
                  // ),
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
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  Future<void> _launchFaceBookUrl(url) async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'fb://profile/100092446166287';
    } else {
      fbProtocolUrl = 'fb://profile/100092446166287';
      // fbProtocolUrl = 'fb://page/100092446166287';
    }
//https://www.facebook.com/profile.php?id=100092446166287
    String fallbackUrl = "https://www.facebook.com/profile.php";

    try {
      Uri fbBundleUri = Uri.parse(fbProtocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);

      if (canLaunchNatively) {
        launchUrl(fbBundleUri);
      } else {
        await launchUrl(Uri.parse(fbProtocolUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e, st) {
      // Handle this as you prefer
    }
  }

}
