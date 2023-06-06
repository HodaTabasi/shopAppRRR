import 'package:easy_localization/easy_localization.dart' as data;
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/model/search.dart';
import 'package:rrr_shop_app/controller/get/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/get/fillter_getx.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/screens/fillter/toggle_button.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../utils/CustomRadio.dart';
import '../../utils/constants.dart';
import '../../utils/size_custom_radio.dart';
import 'package:rrr_shop_app/controller/data/model/category.dart';

class FillterScreen extends StatefulWidget {
  @override
  State<FillterScreen> createState() => _FillterScreenState();
}

class _FillterScreenState extends State<FillterScreen> {
  // Initial Selected Value
  Category dropdownvalue = APIGetxController.to.cate[0];
  RangeValues values = RangeValues(0.0, 1.0);

  // List of items in our dropdown menu
  // var items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];
  // List<RadioModel> sampleData = [];

  var pickerColor = Colors.black;

  Color currentColor = const Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {

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
            "filtering",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ).tr(),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ))),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: divider,
              thickness: 1,
            ),
            getSpace(h: 8.h),
            Text(
              "price",
              style: TextStyle(
                color: Colors.black,
              ),
            ).tr(),
            RangeSlider(
              values: values,
              onChanged: (value) {
                setState(() {
                  values = value;
                  FillterGetXController.to.minPrice = values.start * 1000;
                  FillterGetXController.to.maxPrice = values.end * 1000;
                });
              },
              activeColor: mainColor,
              inactiveColor: divider,
              labels: RangeLabels('10', '1000'),
            ),
            getSpace(h: 8.0.h),
            Text(
              "type",
              style: TextStyle(color: Colors.black),
            ).tr(),
            getSpace(h: 8.0.h),
            Choosere(),
            getSpace(h: 8.0.r),
            Text(
              "colors",
              style: TextStyle(
                color: Colors.black,
              ),
            ).tr(),
            getSpace(h: 8.0.r),
            InkWell(
              onTap: () {
                colorPickerDialog();
              },
              child: CircleAvatar(
                backgroundColor: pickerColor,
                radius: 25,
              ),
            ),
            getSpace(h: 8.0.r),
            Text(
              "fiha",
              style: TextStyle(
                color: Colors.black,
              ),
            ).tr(),
            getSpace(h: 8.0.r),
            DropdownButton<Category>(
              isExpanded: true,
              // Initial Value
              value: dropdownvalue,
              borderRadius: BorderRadius.circular(15.r),
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: APIGetxController.to.cate.map((Category items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(SharedPrefController()
                              .getValueFor(key: PrefKeys.lang.name) ==
                          'ar'
                      ? items.nameAr!
                      : items.nameEn!),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  print(newValue);
                  FillterGetXController.to.categoryId =
                      newValue.categoryId ?? newValue.id!;
                });
              },
            ),
            Spacer(),
            GetX<APIGetxController>(builder: (controller) {
              return Row(
                children: [
                  Expanded(
                      child: BtnApp(
                          title:
                              "${data.tr("search1")} ${controller.FillterResult.length}",
                          prsee: () => showResult())),
                  SizedBox(
                    width: 100.w,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12.r),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r),
                                side: BorderSide(color: mainColor, width: 1)),
                            backgroundColor: Colors.white,
                            elevation: 0),
                        onPressed: () => performTask(),
                        child: controller.isLoading.value
                            ? SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: CircularProgressIndicator(color: mainColor),
                              )
                            : Text(
                                "search2",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: mainColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'avenir'),
                              ).tr()),
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  Future colorPickerDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            // availableColors: Colors.primaries,
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                padding: const EdgeInsets.only(
                    left: 30.0, top: 0.0, right: 30.0, bottom: 0.0)),
            onPressed: () {
              FillterGetXController.to.color =
                  getColorCode(pickerColor).toString();
              Navigator.of(context).pop(false);
            },
            child:  Text('close', style: TextStyle(color: mainColor)).tr(),
          ),
        ],
      ),
    );
  }

  performTask() {
    APIGetxController.to.getFiltter(search: search);
  }

  Search get search {
    Search s = Search();
    s.categoryId = FillterGetXController.to.categoryId.toString();
    s.productType = FillterGetXController.to.valueType.toString();
    s.maxPrice = FillterGetXController.to.maxPrice.toString();
    s.minPrice = FillterGetXController.to.minPrice.toString();
    s.productColor = FillterGetXController.to.color;
    // s.productColor = FillterGetXController.to.color;
    return s;
  }

  showResult() {
    if (APIGetxController.to.FillterResult.isNotEmpty) {
      Navigator.pushNamed(context, '/result_screen');
    } else {
      showSnackBar(context: context, message: "search first", error: true);
    }
  }
}
