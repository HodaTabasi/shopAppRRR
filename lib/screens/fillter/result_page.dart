import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rrr_shop_app/controller/get/product_controller/api_getx_controller.dart';

import '../../core/app_product_card.dart';
import '../../utils/constants.dart';

class ResultPage extends StatefulWidget {

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFDFA),
        appBar: AppBar(
          title: Text("result",
              style: TextStyle(color: Colors.black)).tr(),
          centerTitle: true,
          backgroundColor: Color(0xffFFFDFA),
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/main_screen');
              },
              child: SvgPicture.asset("assets/images/menu1.svg"),
            )
          ],

        ),
        body:  GridView.builder(
          padding: EdgeInsets.all(8.r),
          itemCount: APIGetxController.to.FillterResult.length,
          gridDelegate: sliver,
          itemBuilder: (context, index) {
            return AppProductCard(APIGetxController.to.FillterResult[index]);
          },
        ),
      );
  }
}
