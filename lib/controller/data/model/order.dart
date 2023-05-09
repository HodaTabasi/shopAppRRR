class Order {
  int? id;
  int? customerId;
  String? username;
  String? address;
  String? phone;
  int? totalPrice;
  String? products;
  int? statusId;
  String? token;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
        this.customerId,
        this.username,
        this.address,
        this.phone,
        this.totalPrice,
        this.products,
        this.statusId,
        this.token,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    username = json['username'];
    address = json['address'];
    phone = json['phone'];
    totalPrice = json['total_price'];
    products = json['products'];
    statusId = json['status_id'];
    token = json['token'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['username'] = this.username;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['total_price'] = this.totalPrice;
    data['products'] = this.products;
    data['status_id'] = this.statusId;
    data['token'] = this.token;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
