import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rrr_shop_app/core/app_product_card.dart';
import 'package:rrr_shop_app/screens/home/tebs/home_tab/widget/search_widget.dart';
import 'package:rrr_shop_app/utils/constants.dart';

class CatProductScreen extends StatefulWidget {
  @override
  State<CatProductScreen> createState() => _CatProductScreenState();
}

class _CatProductScreenState extends State<CatProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFDFA),
      appBar: AppBar(
        title: Text(" ملابس رجال", style: TextStyle(color: Colors.black)),
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
            onTap: (){
              print("object");
            },
            child: SvgPicture.asset("assets/images/menu1.svg"),
          )

        ],
        bottom: PreferredSize(
            preferredSize:  Size.fromHeight(70.h),
            child: Padding(
              padding:  EdgeInsets.all(8.0.r),
              child: Row(
                children: [
                  Expanded(child: SearchWidget()),
                  Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: InkWell(
                      onTap: (){},
                      child: SvgPicture.asset("assets/images/fillter.svg"),
                    ),
                  )
                ],
              ),
            )),
      ),
       body: GridView.builder(
         padding: EdgeInsets.all(8.r),
           itemCount: 30,
           gridDelegate: sliver,
           itemBuilder: (context, index) {
             return AppProductCard();
           },),
    );
  }
}
