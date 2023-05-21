class MyNotification {
  int? id;
  int? customerId;
  String? titleAr;
  String? titleEn;
  String? bodyAr;
  String? bodyEn;
  Null? token;
  String? createdAt;
  String? updatedAt;

  MyNotification(
      {this.id,
        this.customerId,
        this.titleAr,
        this.titleEn,
        this.bodyAr,
        this.bodyEn,
        this.token,
        this.createdAt,
        this.updatedAt});

  MyNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    bodyAr = json['body_ar'];
    bodyEn = json['body_en'];
    token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['body_ar'] = this.bodyAr;
    data['body_en'] = this.bodyEn;
    data['token'] = this.token;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
