import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/get/product_controller/api_getx_controller.dart';

import '../../utils/constants.dart';

class PrivacyPolicy extends StatefulWidget {

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {

  @override
   initState(){
    APIGetxController.to.getSetting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        toolbarHeight: 60.h,
        title: const Text(
          "policy",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ).tr(),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black),
        ),
      ),
      body: GetX<APIGetxController>(
        builder: (controller) {
          return controller.isLoading.value
              ?Center(child: CircularProgressIndicator(color: mainColor),)
              :SingleChildScrollView(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(controller.policy.value,style: TextStyle(),textAlign: TextAlign.end,),
              ));
        },
      ),
    );
  }
}
