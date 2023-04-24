import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  List<int> l = [1, 2, 3, 5];
  late TabController controller;

  late TabController tabController;

  int currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
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
          "order",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ).tr(),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          buildContainer(),
          getSpace(h: 16.r),
          Padding(
            padding:  EdgeInsets.all(16.0.r),
            child: ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
              },
              dividerColor: divider,
              children: [
                ExpansionPanel(
                  isExpanded:false,
                  headerBuilder: (context, isExpanded) {
                    return Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 5.0.r,horizontal: 8.r),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg",
                                height: 55,
                                width: 66,
                                fit: BoxFit.fill,
                              )),
                        ),
                        Text(
                          "345568#",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        )
                      ],
                    );
                  },
                  body: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.r),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "product_name",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "حذاء",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "product_price",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "200",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "brand",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "Naike",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "size",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "36",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "color",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              CircleAvatar(
                                radius: 5,

                              )
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "t_address",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                " soufadf ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "data_f",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "احمد العتيبي",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "phone",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "0596523584",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Divider(
                          color: divider,
                          thickness: 1,
                        )
                      ],
                    ),
                  ),
                ),
                ExpansionPanel(
                isExpanded:true,
                  headerBuilder: (context, isExpanded) {
                    return Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 5.0.r,horizontal: 8.r),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg",
                                height: 55,
                                width: 66,
                                fit: BoxFit.fill,
                              )),
                        ),
                        Text(
                          "345568#",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        )
                      ],
                    );
                  },
                  body: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.r),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "product_name",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "حذاء",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "product_price",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "200",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "brand",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "Naike",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "size",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "36",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "color",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              CircleAvatar(
                                radius: 5,

                              )
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "t_address",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                " soufadf ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "data_f",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "احمد العتيبي",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "phone",
                                style: TextStyle(color: textColor,),
                              ).tr(),
                              getSpace(w:5.r),
                              Text(
                                "0596523584",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                        getSpace(h: 15.0.r),
                        Divider(
                          color: divider,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/clear.svg"),
                              Text(
                                "الغاء الطلب",
                                style: TextStyle(color: textColor,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildContainer() {
    return Container(
      decoration: decoration(radius: 2),
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: TabBar(
        controller: tabController,
        labelColor: Colors.white,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: mainColor,
        ),
        unselectedLabelColor: thirdColor,
        isScrollable: true,
        tabs: [
          Tab(
            icon: Text("pending").tr(),
          ),
          Tab(
            icon: Text("driving").tr(),
          ),
          Tab(
            icon: Text("completeo").tr(),
          ),
          Tab(
            icon: Text("cancel").tr(),
          )
        ],
      ),
    );
  }
}
