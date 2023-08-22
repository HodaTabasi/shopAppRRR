import 'package:hive/hive.dart';
import 'package:rrr_shop_app/controller/data/model/rate.dart';

import 'MyColors.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? categoryId;
  @HiveField(2)
  int? subcategoryId;
  @HiveField(3)
  String? productNameEn;
  @HiveField(4)
  String? productNameAr;
  @HiveField(5)
  String? brandEn;
  @HiveField(6)
  String? brandAr;
  @HiveField(7)
  String? productQty;
  @HiveField(8)
  String? productSize;
  @HiveField(9)
  String? basePrice;
  @HiveField(10)
  String? sellingPrice;
  @HiveField(11)
  String? discountPrice;
  @HiveField(12)
  String? descriptionEn;
  @HiveField(13)
  String? descriptionAr;
  @HiveField(14)
  String? productThumbnail;
  @HiveField(15)
  int? trend;
  @HiveField(16)
  int? newProduct;
  @HiveField(17)
  int? offer;
  @HiveField(18)
  String? createdAt;
  @HiveField(19)
  String? updatedAt;
  @HiveField(20)
  List<MyColors>? colors;
  @HiveField(21)
  List<String>? multiImg;
  @HiveField(22)
  String? selectedColor = "#000000";
  @HiveField(23)
  String? selectedSize = "36";
  @HiveField(24)
  int? selectedQty;
  @HiveField(25)
  bool itemCartFlag = false;
  @HiveField(26)
  List<Rating>? ratings;

  Product({this.id,
        this.categoryId,
        this.subcategoryId,
        this.productNameEn,
        this.productNameAr,
        this.brandEn,
        this.brandAr,
        this.productQty,
        this.productSize,
        this.basePrice,
        this.sellingPrice,
        this.discountPrice,
        this.descriptionEn,
        this.descriptionAr,
        this.productThumbnail,
        this.trend,
        this.newProduct,
        this.offer,
        this.createdAt,
        this.updatedAt,
        this.colors,
        this.multiImg});

  Product.fromJson(Map<String, dynamic> json) {
    itemCartFlag = false;
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    productNameEn = json['product_name_en'];
    productNameAr = json['product_name_ar'];
    brandEn = json['brand_en'];
    brandAr = json['brand_ar'];
    productQty = json['product_qty'];
    productSize = json['product_size'];
    basePrice = json['base_price'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    productThumbnail = json['product_thumbnail'];
    trend = json['trend'];
    newProduct = json['new_product'];
    offer = json['offer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['colors'] != null) {
      colors = <MyColors>[];
      json['colors'].forEach((v) {
        colors!.add(new MyColors.fromJson(v));
      });
    }
    if (json['multi_img'] != null && json['multi_img'].isNotEmpty ) {
      multiImg = <String>[];
      json['multi_img'].forEach((v) {
        multiImg!.add(v['photo_name']);
      });
    }else{
      multiImg = <String>[];
    }
    if (json['ratings'] != null) {
      ratings = <Rating>[];
      json['ratings'].forEach((v) {
        ratings!.add(new Rating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['product_name_en'] = this.productNameEn;
    data['product_name_ar'] = this.productNameAr;
    data['brand_en'] = this.brandEn;
    data['brand_ar'] = this.brandAr;
    data['product_qty'] = this.productQty;
    data['product_size'] = this.productSize;
    data['base_price'] = this.basePrice;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    data['description_en'] = this.descriptionEn;
    data['description_ar'] = this.descriptionAr;
    data['product_thumbnail'] = this.productThumbnail;
    data['trend'] = this.trend;
    data['new_product'] = this.newProduct;
    data['offer'] = this.offer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    if (this.multiImg != null) {
      data['multi_img'] = this.multiImg!.map((v) => v).toList();
    }
    if (this.ratings != null) {
      data['ratings'] = this.ratings!.map((v) => v).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Product{id: $id, categoryId: $categoryId, subcategoryId: $subcategoryId, productNameEn: $productNameEn, productNameAr: $productNameAr, brandEn: $brandEn, brandAr: $brandAr, productQty: $productQty, productSize: $productSize, basePrice: $basePrice, sellingPrice: $sellingPrice, discountPrice: $discountPrice, descriptionEn: $descriptionEn, descriptionAr: $descriptionAr, productThumbnail: $productThumbnail, trend: $trend, newProduct: $newProduct, offer: $offer, createdAt: $createdAt, updatedAt: $updatedAt, colors: $colors, multiImg: $multiImg, selectedColor: $selectedColor, selectedSize: $selectedSize, selectedQty: $selectedQty, itemCartFlag: $itemCartFlag}';
  }
}
