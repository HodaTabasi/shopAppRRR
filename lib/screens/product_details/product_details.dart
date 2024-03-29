import 'package:easy_localization/easy_localization.dart' as data;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/api/api_setting.dart';
import 'package:rrr_shop_app/controller/get/product_controller/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/hive_getx_controller.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/core/skeleton.dart';
import 'package:rrr_shop_app/screens/product_details/rating_sheer.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../controller/get/product_controller/home_product_getx_controller.dart';
import '../../controller/preferences/shared_pref_controller.dart';
import '../../utils/CustomRadio.dart';
import '../../utils/size_custom_radio.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // List<RadioModel> sampleData =  [];

  var value = 1;
  var currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });

    super.initState();
  }

  getData() async {
    await APIGetxController.to.getProductDetails(
        productId: APIGetxController.to.productId.toString());
    APIGetxController.to.product.value.productSize!
        .split(",")
        .forEach((element) {
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
            "${SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == 'ar' ? APIGetxController.to.product.value.productNameAr ?? '' : APIGetxController.to.product.value.productNameEn ?? ''}",
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  APIGetxController.to.product.value.itemCartFlag =
                      false;
                  APIGetxController.to.product.value.selectedColor =
                      APIGetxController.to.color;
                  APIGetxController.to.product.value.selectedSize =
                      APIGetxController.to.size;
                  APIGetxController.to.product.value.selectedQty = value;
                  bool b = await HiveGetXController.to
                      .addToCart(p: APIGetxController.to.product.value);

                  showSnackBar(
                      context: context,
                      message: b ? "added Successfully" : "exist before",
                      error: !b);
                },
                icon: SvgPicture.asset("assets/images/add_cart.svg")),
            IconButton(
                onPressed: () async {
                  bool b = await HiveGetXController.to
                      .addToFav(p: APIGetxController.to.product.value);

                  showSnackBar(
                      context: context,
                      message: b ? "added Successfully" : "exist before",
                      error: !b);
                },
                icon: HiveGetXController.to.favProducts.any((element) =>
                        element.id == APIGetxController.to.product.value.id)
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(
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
        body: APIGetxController.to.NetFound.value?
        APIGetxController.to.isLoading.value
            ? buildProductDetailsShimmer()
            : ListView(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 230.h,
                        child: APIGetxController.to.product.value.multiImg!.isEmpty?PageView(
                          children: [
                            Image.network(
                              "${APIGetxController.to.product.value.productThumbnail}",
                              fit: BoxFit.fill,
                            )
                          ],
                        ):PageView.builder(
                          itemCount: APIGetxController.to.product.value.multiImg!.length,
                          controller: pageController,
                          onPageChanged: (value) {

                          },
                          itemBuilder: (context, index) {
                          return  Image.network(
                            "${APIGetxController.to.product.value.multiImg![index]}",
                            fit: BoxFit.fill,
                          );
                        },),
                      ),
                      Positioned(
                          right: MediaQuery.of(context).size.width / 2.2,
                          bottom: 10.h,
                          child: DecoratedBox(
                            decoration: decoration(radius: 20.r, blurRadius: 0),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0.r, vertical: 8.r),
                              child: APIGetxController.to.product.value.multiImg!.isEmpty?Text("1/1"):Text("${currentIndex+1}/${APIGetxController.to.product.value.multiImg!.length}"),
                            ),
                          ))
                    ],
                  ),
                  getSpace(h: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.r, vertical: 8.r),
                              child: Text(
                                "${SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == 'ar' ? APIGetxController.to.product.value.productNameAr : APIGetxController.to.product.value.productNameEn}",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 17.sp),
                              ),
                            ),
                            VerticalDivider(
                              width: 1,
                              color: divider,
                              indent: 5,
                              endIndent: 5,
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: false,
                                    backgroundColor: Colors.white,
                                    context: context,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15.r),
                                        borderSide: BorderSide(color: Colors.transparent)),
                                    builder: (context) => RatingSheet());
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.r, vertical: 8.r),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("${APIGetxController.to.rate}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                    getSpace(w: 5.0.w),
                                    Icon(Icons.star,color: Colors.yellow.shade700,size: 25),

                                  ],
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.r, vertical: 8.r),
                        child:
                        // HomeGetxController.to.offers.isNotEmpty?
                        // Text(
                        //   "${getDiscountPrice(HomeGetxController.to.offers.first.discount!.toString(), APIGetxController.to.product.value.sellingPrice!)}\$",
                        //   style: TextStyle(
                        //       color: mainColor,
                        //       fontSize: 16.sp,
                        //       fontWeight: FontWeight.w600),
                        // )
                        //     :
                        Text(
                          "${APIGetxController.to.product.value.discountPrice != "0" ?getDiscountPrice(APIGetxController.to.product.value.discountPrice!, APIGetxController.to.product.value.sellingPrice!):APIGetxController.to.product.value.sellingPrice} SDG",
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.r, vertical: 8.r),
                        child: Text(
                          "${SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == 'ar' ? APIGetxController.to.product.value.brandAr : APIGetxController.to.product.value.brandEn}",
                          style: TextStyle(color: textColor, fontSize: 14.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.r, vertical: 8.r),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if (value > 1) {
                                  value--;
                                  setState(() {});
                                }
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: miniground,
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(3.0.r, 0.r, 3.r, 8.r),
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
                              onTap: () {
                                value++;
                                setState(() {});
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Padding(
                                  padding: EdgeInsets.all(3.0.r),
                                  child: Icon(Icons.add,
                                      color: Colors.white, size: 13.r),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                    child: Text(
                      "colors",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ).tr(),
                  ),
                  SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          APIGetxController.to.product.value.colors!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          //highlightColor: Colors.red,
                          splashColor: Colors.blueAccent,
                          onTap: () {
                            setState(() {
                              APIGetxController.to.product.value.colors!
                                  .forEach(
                                      (element) => element.isSelected = false);
                              APIGetxController.to.product.value.colors![index]
                                  .isSelected = true;
                              APIGetxController.to.color = APIGetxController
                                  .to.product.value.colors![index].color!;
                            });
                          },
                          child: RadioItem(APIGetxController
                              .to.product.value.colors![index]),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                    child: Text(
                      "size",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ).tr(),
                  ),
                  SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: APIGetxController.to.sampleData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          //highlightColor: Colors.red,
                          splashColor: Colors.white,
                          onTap: () {
                            setState(() {
                              APIGetxController.to.size =
                                  APIGetxController.to.sampleData[index].text;
                              APIGetxController.to.sampleData.forEach(
                                  (element) => element.isSelected = false);
                              APIGetxController
                                  .to.sampleData[index].isSelected = true;
                            });
                          },
                          child: SizeRadioItem(
                              APIGetxController.to.sampleData[index]),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                    child: Text(
                      "disc",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ).tr(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                    child: Text(
                      "${SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) == 'ar' ? APIGetxController.to.product.value.descriptionAr : APIGetxController.to.product.value.descriptionEn}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  getSpace(h: 8.r),
                  BtnApp(
                      title: data.tr("buy"),
                      prsee: () {
                        APIGetxController.to.cartFlag = false;
                        APIGetxController.to.product.value.itemCartFlag =false;
                        APIGetxController.to.product.value.selectedColor =
                            APIGetxController.to.color;
                        APIGetxController.to.product.value.selectedSize =
                            APIGetxController.to.size;
                        APIGetxController.to.product.value.selectedQty = value;

                        APIGetxController.to.putOrderProduct(
                            list: [APIGetxController.to.product.value]);
                       Navigator.pushNamed(context, '/complete_buy_screen');
                      })
                ],
              ):Center(
          child: Column(
            children: [
              SvgPicture.asset("assets/ff.svg"),
              Text("no_internet",style: TextStyle(color: Colors.black, fontSize: 16.sp),).tr(),
              BtnApp(title: data.tr('reload'), prsee: (){
                getData();
              })
            ],
          ),
        ),
      );
    });
  }

  Padding buildProductDetailsShimmer() {
    return Padding(
      padding: EdgeInsets.all(16.0.r),
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
