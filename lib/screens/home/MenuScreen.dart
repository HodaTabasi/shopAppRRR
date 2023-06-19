import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../controller/get/product_controller/api_getx_controller.dart';
import '../../utils/helper.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff474340),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetX<APIGetxController>(builder: (controller) {
        return ListView(
          children: [
            SvgPicture.asset("assets/images/60_60.svg"),
            getSpace(h: 16.h),
            Text(
              "cat",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ).tr(),
            getSpace(h:50.h),
            ListView.builder(
              itemCount: controller.cate.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 8.r),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if(controller.cate[index].subCategory!.isEmpty){
                  return ListTile(
                    onTap: () {
                      // ZoomDrawer.of(context)!.close();
                      controller.category = controller.cate[index];
                      Navigator.pushNamed(context, '/cart_product_screen');
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.r),
                    title: Text(controller.cate[index].nameAr!),
                    textColor: Colors.white,
                    selectedColor: Colors.white,
                  );
                }else{
                  return ExpansionTile(
                    title: Text(controller.cate[index].nameAr!,style: TextStyle(color: Colors.white),),
                    textColor: Colors.white,
                    collapsedTextColor: Colors.white,
                    iconColor: Colors.white,
                    // backgroundColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    // collapsedBackgroundColor: Colors.white,
                    children: controller.cate[index].subCategory!.map((e){
                      return ListTile(
                        onTap: () {
                          // ZoomDrawer.of(context)!.close();
                          controller.category = e;
                          Navigator.pushNamed(context, '/cart_product_screen');
                        },
                        title: Text(e.nameAr!),
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.r),
                        textColor: Colors.white,
                        selectedColor: Colors.white,
                      );
                    }).toList(),
                  );
                }

              },
            )
          ],
        );
      }),
    );
  }
}
