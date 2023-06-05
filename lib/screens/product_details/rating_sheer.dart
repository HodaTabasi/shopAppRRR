import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rrr_shop_app/utils/constants.dart';

import '../../controller/get/api_getx_controller.dart';
import '../../utils/helper.dart';

class RatingSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getSpace(h: 8.r),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("client_point",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                  .tr(),
              getSpace(w: 5.0.w),
              Text("${APIGetxController.to.product.value.ratings!.length}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: APIGetxController.to.product.value.ratings!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: DecoratedBox(
                    decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${APIGetxController.to.rate}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                    getSpace(w: 5.0.w),
                    Icon(Icons.star,color: Colors.white,size: 25),

                  ],
                ),),
                title: Text(
                    "${APIGetxController.to.product.value.ratings![index].customerId!}"),
                subtitle: Text(
                    APIGetxController.to.product.value.ratings![index].comments!,
                    style: TextStyle(fontSize: 15.r)),
              );
            },
          ),
        )
      ],
    );
  }
}
