import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: decoration(radius: 25.0.r,blurRadius: 5),
      child: SizedBox(
        height: 50.h,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: image(path: "assets/images/vector.svg"),
              ),
              VerticalDivider(),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'search'.tr(),
                      hintStyle:
                      TextStyle(color: Colors.grey, fontSize: 14.sp)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}