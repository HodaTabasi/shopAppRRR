class Category {
  int? id;
  int? categoryId;
  String? nameEn;
  String? nameAr;
  String? createdAt;
  String? updatedAt;
  List<Category>? subCategory;

  Category(
      {this.id,
        this.categoryId,
        this.nameEn,
        this.nameAr,
        this.createdAt,
        this.updatedAt,
        this.subCategory});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if(json.containsKey('category_id')){
      categoryId = json['category_id'];
    }
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['sub_category'] != null && json.containsKey('sub_category') ) {
      subCategory = <Category>[];
      json['sub_category'].forEach((v) {
        subCategory!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if(data.containsKey('category_id')){
      data['category_id'] = this.categoryId;
    }
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subCategory != null && data.containsKey('sub_category')) {
      data['sub_category'] = this.subCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


/*
*/