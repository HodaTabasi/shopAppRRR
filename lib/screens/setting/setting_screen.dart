import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/model/user.dart';
import 'package:rrr_shop_app/utils/constants.dart';

import '../../controller/get/languages_getx_controoler.dart';
import '../../controller/get/product_controller/api_getx_controller.dart';
import '../../controller/preferences/shared_pref_controller.dart';
import '../../core/app_button.dart';
import '../../utils/helper.dart';
import 'change_phone_number_sheet.dart';

class SettingScreen extends StatefulWidget {

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // Country value = Country();
  int  langValue = 0;

  var isExpand1 = false;
  bool visable = false;
  late TextEditingController _phoneController;
  late TextEditingController _newPhoneController;

@override
  void initState() {
  langValue = SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name)=='ar'?0:1;
  _phoneController = TextEditingController();
  _newPhoneController = TextEditingController();
  super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: background,
        title: Text("setting",style: TextStyle(color: Colors.black,fontSize: 18.sp),).tr(),
        elevation: 0,
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black),
        ),
        // actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  child: InkWell(
                    onTap: (){
                      visable = !visable;
                      setState(() {
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "chang_phone",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ).tr(),
                         Text(
                          "${APIGetxController.to.phoneNumber}",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ).tr(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),),
            ),
            Visibility(
              visible: visable,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      getSpace(h: 15.h),
                      Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "mobile_number",
                            style: TextStyle(
                                color: Color(0xff6E6E6F),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w200),
                          ).tr()),
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset("assets/images/16_22.svg",
                                  semanticsLabel: 'Acme Logo'),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "new_mobile_number",
                            style: TextStyle(
                                color: Color(0xff6E6E6F),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w200),
                          ).tr()),
                      TextField(
                        controller: _newPhoneController,
                        decoration: InputDecoration(
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset("assets/images/16_22.svg",
                                  semanticsLabel: 'Acme Logo'),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      getSpace(h: 20.h),
                      BtnApp(
                          title: "chang_phone".tr(),
                          prsee: (){
                            _performChangePhone();
                          }),
                    ],
                  ),
                )),
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
                                      langValue = value!;
                                      context.setLocale(Locale('ar'));
                                      LanguageGETXController.to.changeLanguage('ar',context);

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
                                      langValue = value!;
                                      context.setLocale(Locale('en'));
                                      LanguageGETXController.to.changeLanguage('en',context);
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
                                langValue ==0 ?"ar":"en",
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
            // getSpace(h: 8.0.r),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.r),
            //   child: DecoratedBox(decoration: decoration(radius: 25.0.r, blurRadius: 2),
            //     child: Padding(
            //       padding: EdgeInsets.all(12.0.r),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           const Text(
            //             "location_p",
            //             style: TextStyle(
            //                 color: Colors.black, fontWeight: FontWeight.w600),
            //           ).tr(),
            //          SizedBox(
            //            height: 25.h,
            //            child: Switch(value: true, onChanged: (value) {
            //            },),
            //          )
            //         ],
            //       ),
            //     ),),
            // ),
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
                        "1",
                        style: TextStyle(
                            color: mainColor),
                      ).tr(),
                    ],
                  ),
                ),),
            ),

          ],
        ),
      ),
    );
  }
  Future<void> _performChangePhone() async {
    if(_phoneController.text.isNotEmpty &&
        _newPhoneController.text.isNotEmpty){
     ApiResponse response = await APIGetxController.to.changePhone(phone: _phoneController.text,newPhone: _newPhoneController.text);
     showSnackBar(context: context,message: response.message,error: !response.success);
     if(response.success){
       User u = SharedPrefController().user;
       u.phoneNumber = int.parse(_newPhoneController.text);
       SharedPrefController().user = u;
       Navigator.pop(context);
     }
    }
  }

}

