import 'package:hive/hive.dart' as hive;
import 'package:hive_flutter/hive_flutter.dart';

import '../data/model/product.dart';

class HiveOperations {
 static HiveOperations? _instance;
 late Box<Product> _favBox;
 late Box<Product> _cartBox;

 HiveOperations._();

 factory HiveOperations(){
  return _instance ??= HiveOperations._();
 }

 openBox() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());

  _favBox = await Hive.openBox<Product>('fav');
  _cartBox = await Hive.openBox<Product>('cart');
 }

 Box get favBox => _favBox;

 Box get cartBox => _cartBox;


 Future<void> addToCart(Product product) async {
  await _cartBox.put(product.id.toString(), product);
 }

 Future<void> deleteFromCart(int id) async {
  await _cartBox.delete(id.toString());
 }

 Future<void> addToFav(Product product) async {
  await _favBox.put(product.id.toString(), product);
 }

 Future<void> deleteFromFav(int id) async {
  await _favBox.delete(id.toString());
 }


 List<Product> getAllCart(){
  return _cartBox.values.toList();
 }

 List<Product> getAllFav(){
  return _favBox.values.toList();
 }

}