import 'package:get/get.dart';
import 'package:rrr_shop_app/controller/data/model/product.dart';
import 'package:rrr_shop_app/controller/hive/hice_operations.dart';

class HiveGetXController extends GetxController {
  final hive = HiveOperations();
  RxList<Product> cartProducts = <Product>[].obs;
  RxList<Product> favProducts = <Product>[].obs;

  static HiveGetXController get to => Get.find<HiveGetXController>();


  Future<bool> addToCart({required Product p}) async {
    Product product = Product(id: p.id,trend: p.trend,productNameEn: p.productNameEn,productNameAr: p.productNameAr,offer: p.offer,newProduct: p.newProduct,brandAr: p.brandAr,brandEn: p.brandEn,productThumbnail: p.productThumbnail,discountPrice: p.discountPrice);
    bool b = await hive.addToCart(product).then((value) => true);
    cartProducts.add(product);
    return b;
  }

  Future<bool> addToFav({required Product p}) async {
    Product product = Product(id: p.id,trend: p.trend,productNameEn: p.productNameEn,productNameAr: p.productNameAr,offer: p.offer,newProduct: p.newProduct,brandAr: p.brandAr,brandEn: p.brandEn,productThumbnail: p.productThumbnail,discountPrice: p.discountPrice);
    bool b =  await hive.addToFav(product).then((value) => true);
    favProducts.add(product);
    return b;
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

  readFromCart(){
    cartProducts.value = hive.getAllCart();
  }

  readFromFav(){
    favProducts.value = hive.getAllFav();
  }
}