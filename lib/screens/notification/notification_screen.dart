import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rrr_shop_app/controller/data/model/notification.dart';
import 'package:rrr_shop_app/controller/get/product_controller/api_getx_controller.dart';

import '../../controller/preferences/shared_pref_controller.dart';
import '../../utils/constants.dart';
import '../../utils/helper.dart';

class MyNotificationScreen extends StatefulWidget {
  const MyNotificationScreen({Key? key}) : super(key: key);

  @override
  State<MyNotificationScreen> createState() => _MyNotificationScreenState();
}

class _MyNotificationScreenState extends State<MyNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        toolbarHeight: 60.h,
        title: const Text(
          "notification",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ).tr(),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 18.r,
            )),
      ),
      body: FutureBuilder<List<MyNotification>>(
        future: APIGetxController.to.getNotification(),
        builder: (context, snapshot) {
          // print(snapshot.data);
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: mainColor,),);
          }else if(snapshot.connectionState ==ConnectionState.done && snapshot.data != null && snapshot.data!.isNotEmpty){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              padding: EdgeInsets.all(16.r),
              itemBuilder: (context, index) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data!.isNotEmpty) {
                  MyNotification notification = snapshot.data![index];
                  return Container(
                    decoration: decoration(blurRadius: 2, radius: 12.0.r),
                    height: 100.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.network(
                                "https://w7.pngwing.com/pngs/141/637/png-transparent-computer-icons-notifications-cdr-area-sound-icon-thumbnail.png",
                                height: 80.h,
                                width: 80.w,
                                fit: BoxFit.fill,
                              )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == 'ar' ? notification.titleAr : notification.titleEn}",
                                  style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),
                                ),
                                getSpace(h: 8.h),
                                Text(
                                  "${SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == 'ar' ? notification.bodyAr : notification.bodyEn}",
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                getSpace(h: 5.h),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "no_data_found",
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ).tr(),
                  );
                }
              },
            );
          }else {
            return Center(
              child: Text('no_data_found').tr(),
            );
          }

        },
      ),
    );
  }
}
