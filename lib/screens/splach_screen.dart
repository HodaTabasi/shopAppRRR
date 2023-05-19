import 'package:flutter/material.dart';
import 'package:rrr_shop_app/controller/get/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,() async {
      await APIGetxController.to.getSliders();
      await APIGetxController.to.getAllCategory();
      String route =  SharedPrefController().loggedIn?'/main_screen':'/login_screen';
      Navigator.pushReplacementNamed(context,route);
    } );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
