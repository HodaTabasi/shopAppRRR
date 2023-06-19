import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/screens/product_details/rate_sheet.dart';
import 'package:rrr_shop_app/utils/constants.dart';

import '../../controller/get/product_controller/api_getx_controller.dart';
import '../../utils/helper.dart';

class RatingSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<APIGetxController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getSpace(h: 8.r),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            "${controller.product.value.ratings!.length}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        getSpace(w: 5.0.w),
                        Text("client_point",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold))
                            .tr(),

                      ],
                    ),
                    getSpace(w: 8.0.r),
                    VerticalDivider(
                      width: 1,
                      color: mainColor,
                    ),
                    getSpace(w: 8.0.r),
                    InkWell(
                      onTap: () async {
                        showModalBottomSheet(
                            // isScrollControlled: true,
                            backgroundColor: Colors.white,
                            context: context,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(color: Colors.transparent)),
                            builder: (context) => RateSheet());
                        // controller.flagLoad
                        //     .value = true;
                        //
                        // AddOrderResponse
                        //     responce =
                        //     await controller
                        //         .addOrder(
                        //             order: makeOrder(
                        //                 order));
                        // showSnackBar(
                        //     context: context,
                        //     message: responce
                        //         .message,
                        //     error: !responce
                        //         .success!);
                        // controller.flagLoad
                        //     .value = false;
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_border,
                            size: 20.r,
                            color: mainColor,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                            child: Text(
                              "rating",
                              style: TextStyle(
                                  color: Color(0xff4D4D4D), fontSize: 14.sp),
                            ).tr(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.product.value.ratings!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: DecoratedBox(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("${controller.rate}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white)),
                            getSpace(w: 5.0.w),
                            Icon(Icons.star, color: Colors.white, size: 25),
                          ],
                        ),
                      ),
                    ),
                    title: Text(
                        "${controller.product.value.ratings![index].customerId!}"),
                    subtitle: Text(
                        controller.product.value.ratings![index].comments!,
                        style: TextStyle(fontSize: 15.r)),
                  );
                },
              ),
            )
          ],
        );
      }
    );
  }
}
