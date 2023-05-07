import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';
import '../utils/helper.dart';

class AppProductCard extends StatefulWidget {
  const AppProductCard({
    super.key,
  });

  @override
  State<AppProductCard> createState() => _AppProductCardState();
}

class _AppProductCardState extends State<AppProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/product_details');
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade400, blurRadius: 4)
            ]),
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(149, 114, 85, 0.2),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(18.r),
                          bottomLeft: Radius.circular(16.r))),
                  child: Icon(Icons.add_shopping_cart_sharp,
                      color: mainColor, size: 20),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r)),
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2019/11/26/19/47/angel-4655368__340.jpg",
                          height: 100.h,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      bottom: 8.r,
                      right: 3.r,
                      left: 0,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.r),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(12.r),
                                color: Colors.yellow),
                            child: Row(
                              children: [
                                image(path: "assets/images/trend.svg"),
                                getSpace(w: 5.w),
                                Text(
                                  "trend",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp),
                                ).tr()
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2.r),
                                margin: EdgeInsets.all(2.r),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(12.r),
                                    color: Colors.red),
                                child: Text(
                                  "20%",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp),
                                ),
                              ),
                              getSpace(h: 8.r),
                              Container(
                                padding: EdgeInsets.all(2.r),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5.r),
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(12.r),
                                    color: Colors.green),
                                child: Row(
                                  children: [
                                    image(
                                        path: "assets/images/new.svg"),
                                    getSpace(w: 5.w),
                                    Text(
                                      "new",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp),
                                    ).tr()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0.r, vertical: 5.r),
                  child: Text(
                    "حذاء رياضي",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                    child: Text(
                      "نايكي",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    )),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("\$28",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: thirdColor)),
                      getSpace(w: 5.w),
                      Text(
                        "\$18",
                        style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                right: 5.w,
                top: 5.h,
                child: Container(
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: InkWell(
                      onTap: () {},
                      child:Icon(
                        Icons.favorite_border,
                        color: thirdColor,
                      )),
                ))
            // Positioned(
            //   left: 0,
            //   top: 0,
            //   child: CustomPaint(
            //     painter: TrianglePainter(
            //       strokeColor: mainColor,
            //       strokeWidth: 10,
            //       paintingStyle: PaintingStyle.fill,
            //     ),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(25.r)
            //       ),
            //       height: 50,
            //       width: 80,
            //       child: Text("soon"),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

