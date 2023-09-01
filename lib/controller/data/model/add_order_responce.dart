import 'package:rrr_shop_app/controller/data/model/product.dart';

import 'order.dart';

class AddOrderResponse {
  bool? success;
  String? message;
  Data? data;

  AddOrderResponse({this.success, this.message, this.data});

  AddOrderResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Order? order;
  List<Product>? relatedProducts;

  Data({this.order, this.relatedProducts});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['order'] != null) {
        order = new Order.fromJson(json['order']);
    }
    if (json['related_products'] != null) {
      relatedProducts = <Product>[];
      json['related_products'].forEach((v) {
        relatedProducts!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    if (this.relatedProducts != null) {
      data['related_products'] =
          this.relatedProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


