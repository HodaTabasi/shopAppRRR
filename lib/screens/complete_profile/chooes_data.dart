import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/get/api_getx_controller.dart';
import '../../utils/constants.dart';
import '../../utils/helper.dart';

class Chooes extends StatefulWidget {

  @override
  State<Chooes> createState() => _CooesState();
}

class _CooesState extends State<Chooes> {
  late ImagePicker _imagePicker;
  @override
  void initState() {
    _imagePicker = ImagePicker();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                APIGetxController.to.changeFile(
                await _imagePicker.pickImage(
                    source: ImageSource.camera));
                Navigator.pop(context);
              },
              icon: Icon(Icons.camera,color:mainColor,size: 50.r),
              // padding: EdgeInsets.all(16.r)
            ),
            getSpace(h: 16.h),
            Text("from_camera",style: TextStyle(color: mainColor,fontSize: 18.sp),).tr(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                APIGetxController.to.changeFile(
                await _imagePicker.pickImage(
                    source: ImageSource.gallery));
                Navigator.pop(context);
              },
              icon: Icon(Icons.style_outlined,color:mainColor,size: 50.r),
              // padding: EdgeInsets.all(16.r)
            ),
            getSpace(h: 16.h),
            Text("from_galary",style:TextStyle(color: mainColor,fontSize: 18.sp)).tr(),
          ],
        ),
      ],
    );
  }
}
