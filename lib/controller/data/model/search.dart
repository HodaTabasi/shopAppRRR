class Search {
  String? minPrice;
  String? maxPrice;
  String? productType;
  String? productColor;
  String? productSize;
  String? categoryId;

  Search(
      {this.minPrice,
        this.maxPrice,
        this.productType,
        this.productColor,
        this.productSize,
        this.categoryId});

  Search.fromJson(Map<String, dynamic> json) {
    minPrice = json['minPrice'];
    maxPrice = json['maxPrice'];
    productType = json['productType'];
    productColor = json['productColor'];
    productSize = json['productSize'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minPrice'] = this.minPrice;
    data['maxPrice'] = this.maxPrice;
    data['productType'] = this.productType;
    data['productColor'] = this.productColor;
    // data['productSize'] = this.productSize;
    data['categoryId'] = this.categoryId;
    return data;
  }
}
