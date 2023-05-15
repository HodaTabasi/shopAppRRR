import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/screens/fillter/toggle_button.dart';
import 'package:rrr_shop_app/utils/helper.dart';

import '../../utils/CustomRadio.dart';
import '../../utils/constants.dart';
import '../../utils/size_custom_radio.dart';

class FillterScreen extends StatefulWidget {
  @override
  State<FillterScreen> createState() => _FillterScreenState();
}

class _FillterScreenState extends State<FillterScreen> {
  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  List<RadioModel> sampleData =  [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // sampleData.add(new RadioModel(false, 'A', 'April 18'));
    // sampleData.add(new RadioModel(false, 'B', 'April 17'));
    // sampleData.add(new RadioModel(false, 'C', 'April 16'));
    // sampleData.add(new RadioModel(false, 'D', 'April 15'));
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
              style:
                  TextStyle(color: Colors.black,),
            ).tr(),
            RangeSlider(
              values: RangeValues(0.0, 0.5),
              onChanged: (value) {},
              activeColor: mainColor,
              inactiveColor: divider,
              labels: RangeLabels('0','20'),
            ),
            getSpace(h: 8.0.h),
            Text(
              "type",
              style:
              TextStyle(color: Colors.black),
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
                    // child:  RadioItem(sampleData[index]),
                  );
                },
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
            DropdownButton(
              isExpanded: true,
              // Initial Value
              value: dropdownvalue,
              borderRadius: BorderRadius.circular(15.r),
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            Spacer(),
            BtnApp(title: "search".tr(), prsee: (){})
          ],
        ),
      ),
    );
  }
}
