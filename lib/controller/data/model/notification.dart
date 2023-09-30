class MyNotification {
  int? id;
  int? customerId;
  String? title;
  String? body;
  Null? token;
  String? createdAt;
  String? updatedAt;

  MyNotification(
      {this.id,
        this.customerId,

        this.title,
        this.body,
        this.token,
        this.createdAt,
        this.updatedAt});

  MyNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    title = json['title'];
    body = json['body'];

    // token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['token'] = this.token;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
