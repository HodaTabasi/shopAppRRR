import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rrr_shop_app/controller/data/api/api_setting.dart';

import '../../../../../controller/data/model/slider.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
    required this.controller,
    required this.l,
  });

  final TabController controller;
  final List<MySlider> l;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Stack(
        children: [
          TabBarView(
            controller: widget.controller,
            children: widget.l.map<Widget>((e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      "${APISetting.IMAGE_BASE_URL}${e.image}",
                      fit: BoxFit.fill,
                    )),
              );
            }).toList(),
          ),
          Positioned(
            bottom: 14.h,
            right: 16.w,
            child: TabPageSelector(
              color: Colors.grey.shade400,
              selectedColor: Colors.white,
              borderStyle: BorderStyle.none,
              indicatorSize: 8,
              controller: widget.controller,
            ),
          )
        ],
      ),
    );
  }
}

