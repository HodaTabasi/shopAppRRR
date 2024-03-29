import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rrr_shop_app/controller/get/product_controller/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/hive_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/product_controller/home_product_getx_controller.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';
import 'package:rrr_shop_app/utils/constants.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,() async {
      if(await checkStatus()){
        await APIGetxController.to.getSliders();
        await APIGetxController.to.getAllCategory();
        await HomeGetxController.to.getOffer();
      }
      await HiveGetXController.to.readFromCart();
      await HiveGetXController.to.readFromFav();
      String route =  SharedPrefController().loggedIn?'/main_screen':'/login_screen';
      Navigator.pushReplacementNamed(context,route);
    } );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/logo.png",height: 120.h,width: 120.w),
      ),
    );
  }
}
