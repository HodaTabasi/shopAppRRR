import 'package:hive/hive.dart';

part 'MyColors.g.dart';

@HiveType(typeId: 2)
class MyColors {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? productId;
  @HiveField(2)
  String? color;
  @HiveField(3)
  String? createdAt;
  @HiveField(4)
  String? updatedAt;
  @HiveField(5)
  bool? isSelected;

  MyColors({this.id, this.productId, this.color, this.createdAt, this.updatedAt});

  MyColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['color'] = this.color;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
