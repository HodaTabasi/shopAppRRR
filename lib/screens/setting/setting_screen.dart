import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rrr_shop_app/utils/constants.dart';

import '../../utils/helper.dart';

class SettingScreen extends StatefulWidget {

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // Country value = Country();
  int  langValue = 0;
  // SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)=='ar'?0:1;


  var isExpand1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text("setting",style: TextStyle(color: Colors.black,fontSize: 18.sp),).tr(),
        elevation: 0,
        toolbarHeight: 60.h,
        centerTitle: true,
        actions: [IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_forward_ios,color: Colors.black),
        )],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSpace(h: 15.0.r),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
            child: Text(
              "profile_info",
              style: TextStyle(color: Colors.black,),
            ).tr(),
          ),
          getSpace(h: 8.0.r),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: DecoratedBox(decoration: decoration(radius: 25.0.r, blurRadius: 2),
              child: Padding(
                padding: EdgeInsets.all(12.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "chang_phone",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ).tr(),
                    const Text(
                      "0597046766",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ).tr(),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),),
          ),
          Container(
            margin: EdgeInsets.all(16.r),
            decoration: decoration(radius: 20.r,blurRadius: 3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 100),
                elevation: 2,

                children: [
                  ExpansionPanel(
                      isExpanded: isExpand1,
                      body: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.0.r),
                                child: Text("ar",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold)).tr(),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0.r),
                                child: Radio(
                                  value: 0,
                                  groupValue: langValue,
                                  onChanged: (int? value) {
                                    // langValue = value!;
                                    // LanguageGetxController.to.changeLanguage(langValue);

                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.0.r),
                                child: Text("en",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold)).tr(),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0.r),
                                child: Radio(
                                  value: 1,
                                  groupValue: langValue,
                                  onChanged: (int? value) {
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12.0.r),
                              child: Text("lang",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold)).tr(),
                            ),
                            Text(
                              "ar",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.sp,)
                              // SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)=='ar'?"العربية":"English",
                            ).tr(),
                          ],
                        );
                      }),
                ],
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    isExpand1 = !isExpand1;
                    // visable = !isExpand;
                  });
                },
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: divider,
            indent: 16.r,
            endIndent: 16.r,
          ),
          getSpace(h: 15.0.r),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.r),
            child: Text(
              "more",
              style: TextStyle(color: Colors.black,),
            ).tr(),
          ),
          getSpace(h: 8.0.r),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: DecoratedBox(decoration: decoration(radius: 25.0.r, blurRadius: 2),
              child: Padding(
                padding: EdgeInsets.all(12.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "location_p",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ).tr(),
                   SizedBox(
                     height: 25.h,
                     child: Switch(value: true, onChanged: (value) {
                     },),
                   )
                  ],
                ),
              ),),
          ),
          getSpace(h: 20.0.r),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: DecoratedBox(decoration: decoration(radius: 25.0.r, blurRadius: 2),
              child: Padding(
                padding: EdgeInsets.all(12.0.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "upgrade",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ).tr(),
                    Spacer(),
                     Text(
                      "0597046766",
                      style: TextStyle(
                          color: mainColor),
                    ).tr(),
                  ],
                ),
              ),),
          ),

        ],
      ),
    );
  }
}
