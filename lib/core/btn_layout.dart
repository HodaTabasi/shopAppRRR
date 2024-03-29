import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rrr_shop_app/utils/constants.dart';

class BtnLayout extends StatelessWidget {
  String title;
  int value;
  int groupValue;
  ValueChanged onChanged;

  BtnLayout({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged});


  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(8.0.r),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          // clipBehavior: Clip.hardEdge,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: isSelected
                    ? MaterialStateProperty.all(mainColor)
                    : MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, color: Colors.white))),
            onPressed: () {

              // NavigationService.navigationService.navigateTo(GMap.routeName);
              onChanged(value);
              // showDialog(context: context,
              //     builder: (BuildContext context){
              //       return CustomDialogBox(
              //         title: "Custom Dialog Demo",
              //         // descriptions: "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
              //         // text: "Yes",
              //       );
              //     }
              // );
            },
            child: Text(
              "$title",
              style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : mainColor,
                  fontWeight: FontWeight.w700 ),
            ),
          ),
        ),
      ),
    );
  }
}
