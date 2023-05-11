import 'package:easy_localization/easy_localization.dart' as t;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../controller/data/api/api_response.dart';
import '../controller/get/api_auth_getx_controller.dart';
import '../controller/get/loading_getx_controller.dart';
import '../utils/constants.dart';
import 'home/navigation_buttom.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _phoneController;

  @override
  void initState() {
    _phoneController = TextEditingController(text: "16146716316");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff755B45).withOpacity(0.3),
      body: GetX<LoadingController>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.fill)),
            child: Stack(
              children: [
                if(!controller.isLoading.value)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getSpace(h: 30.h),
                    Text("login",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700))
                        .tr(),
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
                            Text(
                              "249+",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff0A0400)),
                            )
                          ],
                        ),
                      ),
                    ),
                    getSpace(h: 20.h),
                    BtnApp(
                        title: "login".tr(),
                        prsee: () =>_performLogin()),
                    getSpace(h: 50.h),
                    getRichText(
                        S1: "condtion1".tr(),
                        S2: "condtion2".tr(),
                        S3: "condtion3".tr(),
                        mainColor: mainColor,
                        fontWeight:FontWeight.normal),
                  ],
                ),
                if(controller.isLoading.value)
                Center(child:  SpinKitDoubleBounce(
                  color: mainColor,
                  size: 50.0,),)
              ],
            ),
          );
        }
      ),
    );
  }

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_phoneController.text.isNotEmpty) {
      return true;
    }

    showSnackBar(context:context,message: 'Enter required data!', error: true);
    return false;
  }


  Future<void> _login() async {
    LoadingController.to.changeLoading(true);
    ApiResponse isSucess = await AuthGETXController.to.login(phone:_phoneController.text);
    LoadingController.to.changeLoading(false);
    if(isSucess.success){
      // Get.offAll(()=>MainScreen());
      Navigator.pushNamedAndRemoveUntil(
          context, "/main_screen", (route) => false);
    } else {
      AuthGETXController.to.phoneNumber = _phoneController.text;
      AuthGETXController.to.flag = false;
      Navigator.pushNamed(
          context, "/complete_screen");
      // showSnackBar(context:context,message: isSucess.message, error: true);
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
