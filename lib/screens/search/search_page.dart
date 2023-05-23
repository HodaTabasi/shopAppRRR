import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rrr_shop_app/controller/data/model/product.dart';

import '../../core/app_product_card.dart';
import '../../utils/constants.dart';

class SearchClass extends SearchDelegate<Product> {
  List<Product> allData;

  List<Product> allSuggestedData;

  SearchClass({required this.allData, required this.allSuggestedData});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, allData[0]);
    }, icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> result = allData
        .where((element) =>
            element.productNameEn!.toLowerCase().contains(query.toLowerCase()) ||
            element.productNameAr!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return GridView.builder(
      padding: EdgeInsets.all(8.r),
      itemCount: result.length,
      gridDelegate: sliver,
      itemBuilder: (context, index) {
        return AppProductCard(result[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> result = allSuggestedData
        .where((element) =>
    element.productNameEn!.toLowerCase().contains(query.toLowerCase()) ||
        element.productNameAr!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return GridView.builder(
      padding: EdgeInsets.all(8.r),
      itemCount: result.length,
      gridDelegate: sliver,
      itemBuilder: (context, index) {
        return AppProductCard(result[index]);
      },
    );
  }
}
