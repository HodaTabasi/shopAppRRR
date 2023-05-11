import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/data/api/api_setting.dart';
import '../controller/data/model/product.dart';
import '../utils/constants.dart';
import '../utils/helper.dart';

class ListItemWidget extends StatelessWidget {
  bool isOrder;
  Product product;
  ListItemWidget({required this.isOrder,required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration(blurRadius: 2,radius: 12.0.r),
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible:isOrder,
            child: Checkbox(value: false, onChanged: (value) {
            },),
          ),
          Padding(
            padding:  isOrder ?EdgeInsets.zero:EdgeInsets.all(8.0),
            child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network("${APISetting.IMAGE_BASE_URL}${product.productThumbnail}",height: 80.h,width: 110.w,fit: BoxFit.fill,)),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12.0.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${product.productNameEn}",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  getSpace(h: 5.h),
                  Row(
                    children: [
                      Text("size",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: thirdColor)).tr(),
                      getSpace(w: 5.w),
                      Text("42",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: thirdColor)).tr(),
                      getSpace(w: 20.w),
                      Text("color",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: thirdColor)).tr(),
                      getSpace(w: 5.w),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                  getSpace(h: 3.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$18",
                        style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      ),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                                color: miniground,
                                borderRadius: BorderRadius.circular(5.r)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.fromLTRB(3.0.r,0.r,3.r,8.r),
                              child: Icon(Icons.minimize_outlined,color: Colors.white,size: 12.r),
                            ),),
                          Padding(
                            padding:  EdgeInsets.all(5.0.r),
                            child: Text(
                              "1",
                              style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.sp),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(5.r)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(3.0.r),
                              child: Icon(Icons.add,color: Colors.white,size: 13.r),
                            ),),
                        ],
                      )

                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}