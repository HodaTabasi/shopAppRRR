import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
    required this.controller,
    required this.l,
  });

  final TabController controller;
  final List<int> l;

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
                      "https://cdn.pixabay.com/photo/2018/01/12/10/19/fantasy-3077928__480.jpg",
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

