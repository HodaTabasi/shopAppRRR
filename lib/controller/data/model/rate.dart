import 'package:hive/hive.dart';

part 'rate.g.dart';

@HiveType(typeId: 3)
class Rating {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? productId;
  @HiveField(2)
  int? customerId;
  @HiveField(3)
  String? comments;
  @HiveField(4)
  int? starRating;
  @HiveField(5)
  String? createdAt;
  @HiveField(6)
  String? updatedAt;

  Rating(
      {this.id,
        this.productId,
        this.customerId,
        this.comments,
        this.starRating,
        this.createdAt,
        this.updatedAt});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = int.parse(json['product_id'].toString());
    customerId = int.parse(json['customer_id'].toString());
    comments = json['comments'];
    starRating = int.parse(json['star_rating'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['customer_id'] = this.customerId;
    data['comments'] = this.comments;
    data['star_rating'] = this.starRating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  Map<String, dynamic> toJson1() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId.toString();
    data['customer_id'] = this.customerId.toString();
    data['comments'] = this.comments;
    data['star_rating'] = this.starRating.toString();
    return data;
  }
}
