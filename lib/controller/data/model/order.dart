import 'dart:convert';

class Order {
  int? id;
  int? customerId;
  String? username;
  String? address;
  String? phone;
  int? totalPrice;
  int? statusId;
  String? token;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  List<OrderProducts>? orderProducts;
  bool isExpanded = false;

  Order(
      {this.id,
        this.customerId,
        this.username,
        this.address,
        this.phone,
        this.totalPrice,
        this.statusId,
        this.token,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.orderProducts,
        this.isExpanded = false
      });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    username = json['username'];
    address = json['address'];
    phone = json['phone'];
    totalPrice = json['total_price'];
    statusId = json['status_id'];
    token = json['token'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    this.isExpanded = false;
    if (json['order_products'] != null) {
      orderProducts = <OrderProducts>[];
      json['order_products'].forEach((v) {
        orderProducts!.add(new OrderProducts.fromJson(v));
      });

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['username'] = this.username;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['total_price'] = this.totalPrice;
    data['status_id'] = this.statusId;
    data['token'] = this.token;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.orderProducts != null) {
      data['order_products'] =
          this.orderProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toJson1() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId.toString();
    data['total_price'] = this.totalPrice.toString();
    data['address'] = this.address.toString();
    data['username'] = this.username.toString();
    data['phone'] = this.phone.toString();
    if (this.orderProducts != null) {
      data['products'] =json.encode(this.orderProducts!.map((v) => v.toJson1()).toList());
    }
    return data;
  }

  @override
  String toString() {
    return '{customerId: $customerId, username:$username , phone:$phone  address: $address,  totalPrice: $totalPrice, }'; //orderProducts: $orderProducts
  }
}

class OrderProducts {
  int? id;
  int? orderId;
  int? productId;
  int? qty;
  String? productColor;
  int? productSize;
  int? productPrice;
  String? createdAt;
  String? updatedAt;
  String? productImage;
  String? productNameAr;
  String? productNameEn;

  OrderProducts(
      {this.id,
        this.orderId,
        this.productId,
        this.qty,
        this.productColor,
        this.productSize,
        this.productPrice,
        this.createdAt,
        this.updatedAt,
        this.productNameAr,
        this.productNameEn});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    qty = json['qty'];
    productColor = json['product_color'];
    productSize = json['product_size'];
    productPrice = json['product_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
     this.productImage  = json['product_image'];
    productNameAr = json['product_name_ar'];
    productNameEn = json['product_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['qty'] = this.qty;
    data['product_color'] = this.productColor;
    data['product_size'] = this.productSize;
    data['product_price'] = this.productPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['updated_at'] = this.updatedAt;
    data['product_image'] = this.productImage;
    data['product_name_ar'] = this.productNameAr;
    data['product_name_en'] = this.productNameEn;
    return data;
  }

  Map<String, dynamic> toJson1() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId.toString();
    data['qty'] = this.qty.toString();
    data['product_color'] = this.productColor.toString();
    data['product_size'] = this.productSize.toString();
    data['product_price'] = this.productPrice.toString();
    data['product_image'] = this.productImage.toString();
    return data;
  }

  @override
  String toString() {
    return '{productId: $productId, qty: $qty, productColor: $productColor, productSize: $productSize, productPrice: $productPrice}';
  }
}
