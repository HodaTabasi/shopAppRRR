class Slider {
  int? id;
  String? titleAr;
  String? titleEn;
  String? textAr;
  String? textEn;
  String? image;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Slider(
      {this.id,
        this.titleAr,
        this.titleEn,
        this.textAr,
        this.textEn,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    textAr = json['text_ar'];
    textEn = json['text_en'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['text_ar'] = this.textAr;
    data['text_en'] = this.textEn;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
