import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/api/api_response.dart';
import 'package:rrr_shop_app/controller/data/model/rate.dart';
import 'package:rrr_shop_app/controller/data/model/user.dart';
import 'package:rrr_shop_app/controller/get/api_getx_controller.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';

import 'package:rrr_shop_app/core/app_button.dart';
import 'package:rrr_shop_app/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart' as data ;
import 'package:rrr_shop_app/utils/helper.dart';

class RateSheet extends StatefulWidget {

  @override
  State<RateSheet> createState() => _RatePageState();
}

class _RatePageState extends State<RateSheet> {
  double rating = 3;
  TextEditingController controller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<APIGetxController>(
      builder: (controller1) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("rating",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: mainColor
            ),).tr(),
            getSpace(h: 8.0.h),
          RatingBar(
          initialRating: rating,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: Icon(Icons.star,color: Colors.yellow.shade700),
            half: Icon(Icons.star,color: Colors.yellow.shade700),
            empty: Icon(Icons.star_border,color: Colors.yellow.shade700),
          ),
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rate) {
            rating = rate;
          },
        ),
            getSpace(h: 8.0.h),
            Padding(
              padding:  EdgeInsets.all(12.0.r),
              child: TextField(
                controller: controller,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(color: mainColor)
                  ),
                  hintText: data.tr("write_your_comment")
                ),
              ),
            ),
            Stack(
              children: [
                if(controller1.isLoading.value)
                CircularProgressIndicator(color: mainColor,),
                if(!controller1.isLoading.value)
                BtnApp(
                    title:data.tr("rating"),
                    prsee: () async {
                  if(controller.text.isNotEmpty){
                   ApiResponse response = await controller1.addRating(rating: myRating);
                   if(response.success){
                     Navigator.pop(context);
                   }
                   showSnackBar(context: context,message: response.message,error: !response.success);
                  }

                }),
              ],
            ),
          ],
        );
      }
    );
  }
  get myRating {
    User user = SharedPrefController().user;
    Rating rate = Rating();
    rate.starRating = rating.toInt();
    rate.productId = APIGetxController.to.product.value.id;
    rate.comments = controller.text;
    rate.customerId = user.id;
     return rate;

  }
}
