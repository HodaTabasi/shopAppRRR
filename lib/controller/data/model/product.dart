import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  int? id;
  int? categoryId;
  int? subcategoryId;
  @HiveField(1)
  String? productNameEn;
  @HiveField(2)
  String? productNameAr;
  String? brandEn;
  String? brandAr;
  String? productQty;
  String? productSize;
  String? productColors;
  @HiveField(3)
  String? basePrice;
  String? sellingPrice;
  String? discountPrice;
  String? descriptionEn;
  String? descriptionAr;
  String? productThumbnail;
  @HiveField(4)
  int? trend;
  @HiveField(5)
  int? newProduct;
  @HiveField(6)
  int? offer;
  @HiveField(7)
  int? status;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
        this.categoryId,
        this.subcategoryId,
        this.productNameEn,
        this.productNameAr,
        this.brandEn,
        this.brandAr,
        this.productQty,
        this.productSize,
        this.productColors,
        this.basePrice,
        this.sellingPrice,
        this.discountPrice,
        this.descriptionEn,
        this.descriptionAr,
        this.productThumbnail,
        this.trend,
        this.newProduct,
        this.offer,
        this.status,
        this.createdAt,
        this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    productNameEn = json['product_name_en'];
    productNameAr = json['product_name_ar'];
    brandEn = json['brand_en'];
    brandAr = json['brand_ar'];
    productQty = json['product_qty'];
    productSize = json['product_size'];
    productColors = json['product_colors'];
    basePrice = json['base_price'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    productThumbnail = json['product_thumbnail'];
    trend = json['trend'];
    newProduct = json['new_product'];
    offer = json['offer'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['product_colors'] = this.productColors;
    data['base_price'] = this.basePrice;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    data['description_en'] = this.descriptionEn;
    data['description_ar'] = this.descriptionAr;
    data['product_thumbnail'] = this.productThumbnail;
    data['trend'] = this.trend;
    data['new_product'] = this.newProduct;
    data['offer'] = this.offer;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
