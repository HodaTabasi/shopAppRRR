import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../utils/CustomRadio.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<RadioModel> sampleData =  [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(false, 'A', 'April 18'));
    sampleData.add(new RadioModel(false, 'B', 'April 17'));
    sampleData.add(new RadioModel(false, 'C', 'April 16'));
    sampleData.add(new RadioModel(false, 'D', 'April 15'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        toolbarHeight: 60.h,
        title: Text(
          "المنتج",
          style: TextStyle(color: Colors.black, fontSize: 18.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/images/add_cart.svg")),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: textColor,
              ))
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 230.h,
                child: PageView(
                  children: [
                    Image.network(
                      "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),
              Positioned(
                  right: MediaQuery.of(context).size.width / 2.2,
                  bottom: 10.h,
                  child: DecoratedBox(
                    decoration: decoration(radius: 20.r, blurRadius: 0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.r, vertical: 8.r),
                      child: Text("1/5"),
                    ),
                  ))
            ],
          ),
          getSpace(h: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                child: Text(
                  "حذاء رياضي",
                  style: TextStyle(color: Colors.black, fontSize: 17.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                child: Text(
                  "18\$",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                child: Text(
                  "نايكي",
                  style: TextStyle(color: textColor, fontSize: 14.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                child: Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: miniground,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(3.0.r, 0.r, 3.r, 8.r),
                        child: Icon(Icons.minimize_outlined,
                            color: Colors.white, size: 12.r),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0.r),
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
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Padding(
                        padding: EdgeInsets.all(3.0.r),
                        child: Icon(Icons.add, color: Colors.white, size: 13.r),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            color: divider,
            endIndent: 16.r,
            indent: 16.r,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
            child: Text(
              "colors",
              style: TextStyle(
                color: Colors.black,
              ),
            ).tr(),
          ),
          SizedBox(
            height: 50.h,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sampleData.length,
              itemBuilder: (BuildContext context, int index) {
                return  InkWell(
                  //highlightColor: Colors.red,
                  splashColor: Colors.blueAccent,
                  onTap: () {
                    setState(() {
                      sampleData.forEach((element) => element.isSelected = false);
                      sampleData[index].isSelected = true;
                    });
                  },
                  child:  RadioItem(sampleData[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
            child: Text(
              "size",
              style: TextStyle(
                color: Colors.black,
              ),
            ).tr(),
          ),
          SizedBox(
            height: 50.h,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sampleData.length,
              itemBuilder: (BuildContext context, int index) {
                return  InkWell(
                  //highlightColor: Colors.red,
                  splashColor: Colors.blueAccent,
                  onTap: () {
                    setState(() {
                      sampleData.forEach((element) => element.isSelected = false);
                      sampleData[index].isSelected = true;
                    });
                  },
                  child:  RadioItem(sampleData[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
            child: Text(
              "disc",
              style: TextStyle(
                color: textColor,
              ),
            ).tr(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
            child: Text(
              "حذاء رياضي ماركة عالمية خامات طبيعية مناسب للرياضيين صنع بتاريخ 10\03\ 2023 حذاء رياضي ماركة عالمية خامات طبيعية مناسب للرياضيين ذاء رياضي ماركة عالمية خامات طبيعية مناسب للرياضيين صنع بتاريخ 10\03\ 2023 حذاء رياضي ماركة عالمية خامات طبيعية مناسب للرياضيين",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          getSpace(h: 8.r),
          BtnApp(title: "buy".tr(), prsee: (){})
        ],
      ),
    );
  }
}
