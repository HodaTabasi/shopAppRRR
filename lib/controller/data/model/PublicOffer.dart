class publicOffer {
  int? id;
  String? titleEn;
  String? titleAr;
  int? discount;
  String? image;
  String? startDate;
  String? endDate;
  int? status;
  String? createdAt;
  String? updatedAt;

  publicOffer(
      {this.id,
        this.titleEn,
        this.titleAr,
        this.discount,
        this.image,
        this.startDate,
        this.endDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  publicOffer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    discount = json['discount'];
    image = json['image'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_en'] = this.titleEn;
    data['title_ar'] = this.titleAr;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}