import 'package:easy_localization/easy_localization.dart' as data;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/api/api_setting.dart';
import 'package:rrr_shop_app/controller/get/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/hive_getx_controller.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/core/skeleton.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../utils/CustomRadio.dart';
import '../../utils/size_custom_radio.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // List<RadioModel> sampleData =  [];

  var value = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    super.initState();
  }
  getData() async {
    await APIGetxController.to.getProductDetails(productId:APIGetxController.to.productId.toString());
    APIGetxController.to.product.value.productSize!.split(",").forEach((element) {
      // sampleData.add(new RadioModel(false, element, element));
      // print(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            backgroundColor: background,
            elevation: 0,
            toolbarHeight: 60.h,
            title: Text(
              "${APIGetxController.to.product.value.productNameAr??''}",
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    APIGetxController.to.product.value.selectedColor = APIGetxController.to.color;
                    APIGetxController.to.product.value.selectedSize = APIGetxController.to.size;
                    APIGetxController.to.product.value.selectedQty = value;
                    HiveGetXController.to.addToCart(p: APIGetxController.to.product.value);
                  },
                  icon: SvgPicture.asset("assets/images/add_cart.svg")),
              IconButton(
                  onPressed: () {
                    HiveGetXController.to.addToFav(p: APIGetxController.to.product.value);
                  },
                  icon: HiveGetXController.to.favProducts.any((element) => element.id == APIGetxController.to.product.value.id) ?Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ):Icon(
                    Icons.favorite_border,
                    color: thirdColor,
                  ))
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          body:
          APIGetxController.to.isLoading.value?
              buildProductDetailsShimmer()
              : ListView(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 230.h,
                    child: PageView(
                      children: [
                        Image.network(
                          "${APISetting.IMAGE_BASE_URL}${APIGetxController.to.product.value.productThumbnail}",
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
                      "${APIGetxController.to.product.value.productNameAr}",
                      style: TextStyle(color: Colors.black, fontSize: 17.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                    child: Text(
                      "${APIGetxController.to.product.value.basePrice}\$",
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
                      "${APIGetxController.to.product.value.brandAr}",
                      style: TextStyle(color: textColor, fontSize: 14.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            if(value>1){
                              value--;
                              setState(() {
                              });
                            }

                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: miniground,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(3.0.r, 0.r, 3.r, 8.r),
                              child: Icon(Icons.minimize_outlined,
                                  color: Colors.white, size: 12.r),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0.r),
                          child: Text(
                            "$value",
                            style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.sp),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            value++;
                            setState(() {

                            });
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Padding(
                              padding: EdgeInsets.all(3.0.r),
                              child: Icon(Icons.add, color: Colors.white, size: 13.r),
                            ),
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
                  itemCount: APIGetxController.to.product.value.colors!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  InkWell(
                      //highlightColor: Colors.red,
                      splashColor: Colors.blueAccent,
                      onTap: () {
                        setState(() {
                          APIGetxController.to.product.value.colors!.forEach((element) => element.isSelected = false);
                          APIGetxController.to.product.value.colors![index].isSelected = true;
                          APIGetxController.to.color = APIGetxController.to.product.value.colors![index].color!;
                        });
                      },
                      child:  RadioItem(APIGetxController.to.product.value.colors![index]),
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
                  itemCount: APIGetxController.to.sampleData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  InkWell(
                      //highlightColor: Colors.red,
                      splashColor: Colors.white,
                      onTap: () {
                        setState(() {
                          APIGetxController.to.size = APIGetxController.to.sampleData[index].text;
                          APIGetxController.to.sampleData.forEach((element) => element.isSelected = false);
                          APIGetxController.to.sampleData[index].isSelected = true;
                        });
                      },
                      child:  SizeRadioItem(APIGetxController.to.sampleData[index]),
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
                  "${APIGetxController.to.product.value.descriptionAr}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              getSpace(h: 8.r),
              BtnApp(title: data.tr("buy"), prsee: (){
                APIGetxController.to.product.value.selectedColor = APIGetxController.to.color;
                APIGetxController.to.product.value.selectedSize = APIGetxController.to.size;
                APIGetxController.to.product.value.selectedQty = value;

                APIGetxController.to.putOrderProduct(list: [APIGetxController.to.product.value]);
                Navigator.pushNamed(context, '/complete_buy_screen');
              })
            ],
          ),
        );
      }
    );
  }

  Padding buildProductDetailsShimmer() {
    return Padding(
              padding:  EdgeInsets.all(16.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(
                    height: 120.h,
                  ),
                  getSpace(h: 8.h),
                  Skeleton(
                    height: 30.h,
                  ),
                  getSpace(h: 8.h),
                  Skeleton(
                    height: 30.h,
                  ),
                  getSpace(h: 8.h),
                  Skeleton(
                    height: 30.h,
                    width: 100.w,
                  ),
                  getSpace(h: 8.h),
                  Skeleton(
                    height: 30.h,
                  ),
                  getSpace(h: 8.h),
                  Skeleton(
                    height: 30.h,
                    width: 100.w,
                  ),
                  getSpace(h: 8.h),
                  Skeleton(
                    height: 30.h,
                  ),
                  getSpace(h: 8.h),
                  Skeleton(
                    height: 30.h,
                    width: 100.w,
                  ),
                  getSpace(h: 8.h),
                  Skeleton(
                    height: 100.h,
                  ),
                  getSpace(h: 15.h),
                  Skeleton(
                    height: 40.h,
                  ),
                ],
              ),
            );
  }
}
