import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/model/product.dart';
import 'package:rrr_shop_app/controller/hive/hice_operations.dart';

import '../../utils/constants.dart';

class HiveGetXController extends GetxController {
  final hive = HiveOperations();
  RxList<Product> cartProducts = <Product>[].obs;
  RxList<Product> favProducts = <Product>[].obs;
  RxInt total = 0.obs;

  getTotal(){
    total.value = 0;
    cartProducts.forEach((element) {
      element.selectedQty??=1;
      if(element.discountPrice == 0){
        total.value += element.selectedQty! * num.parse(element.sellingPrice!).toInt();
      }else {
        total.value += element.selectedQty! * num.parse(getDiscountPrice(element.discountPrice!, element.sellingPrice!)).toInt();
      }
      total.value += num.parse(element.sellingPrice!).toInt() * element.selectedQty!;
    });
    return total.value;
  }
  // RxList<bool> flag = <bool>[].obs;
  RxBool allValue = false.obs;

  static HiveGetXController get to => Get.find<HiveGetXController>();


  Future<bool> addToCart({required Product p}) async {
    Product product = Product(id: p.id,trend: p.trend,productNameEn: p.productNameEn,productNameAr: p.productNameAr,offer: p.offer,newProduct: p.newProduct,brandAr: p.brandAr,brandEn: p.brandEn,productThumbnail: p.productThumbnail,discountPrice: p.discountPrice);
    if(!hive.isInCart(id:p.id)){
      bool b = await hive.addToCart(p).then((value) => true);
      cartProducts.add(p);
      return b;
    }
    return false;
  }

  Future<bool> addToFav({required Product p}) async {
    Product product = Product(id: p.id,trend: p.trend,productNameEn: p.productNameEn,productNameAr: p.productNameAr,offer: p.offer,newProduct: p.newProduct,brandAr: p.brandAr,brandEn: p.brandEn,productThumbnail: p.productThumbnail,discountPrice: p.discountPrice);
    if(!hive.isInFav(id:p.id)){
      bool b =  await hive.addToFav(p).then((value) => true);
      favProducts.add(p);
      return b;
    }
    return false;

  }

  Future<bool> deleteFromCart({required int id}) async {
    bool b =await hive.deleteFromCart(id).then((value) => true);
    if(b){
      cartProducts.removeWhere((element) => element.id == id);
    }
    return b;
  }

  Future<bool> deleteFromFav({required int id}) async {
    bool b = await hive.deleteFromFav(id).then((value) => true);
    if(b){
      favProducts.removeWhere((element) => element.id == id);
    }
    return b;
  }

  deleteAllProductFromCart(){
    hive.deleteAllProductFromCart();
  }

  readFromCart(){
    cartProducts.value = hive.getAllCart();
  }

  readAllProduct(){
    return hive.getAllProduct();
  }

  addAllProduct(product){
    return hive.addAllProduct(product);
  }

  readFromFav(){
    favProducts.value = hive.getAllFav();
  }


}