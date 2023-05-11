import 'dart:io';

// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart' ;
import 'package:path_provider/path_provider.dart';

import '../data/model/product.dart';

class HiveOperations {
 static HiveOperations? _instance;
 late Box<Product> _favBox;
 late Box<Product> _cartBox;

 HiveOperations._();

 factory HiveOperations(){
  return _instance ??= HiveOperations._();
 }

 Future<void> openBox() async {
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(ProductAdapter());

  _favBox = await Hive.openBox<Product>('fav');
  _cartBox = await Hive.openBox<Product>('cart');
 }

 Box get favBox => _favBox;

 Box get cartBox => _cartBox;


 Future<void> addToCart(Product product) async {
  _cartBox = Hive.box('cart');
  await _cartBox.put(product.id.toString(), product);
  _cartBox.flush();
 }

 Future<void> deleteFromCart(int id) async {
  _cartBox = Hive.box('cart');
  await _cartBox.delete(id.toString());
  _cartBox.flush();
 }

 Future<void> addToFav(Product product) async {
  _favBox = Hive.box('fav');
  await _favBox.put(product.id.toString(), product);
  _cartBox.flush();
 }

 Future<void> deleteFromFav(int id) async {
  _favBox = Hive.box('fav');
  await _favBox.delete(id.toString());
  _cartBox.flush();
 }


 List<Product> getAllCart(){
  _cartBox = Hive.box('cart');
  return _cartBox.values.toList();
 }

 List<Product> getAllFav(){
  _favBox = Hive.box('fav');
  return _favBox.values.toList();
 }

}