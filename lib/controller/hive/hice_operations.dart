import 'dart:io';

// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart' ;
import 'package:path_provider/path_provider.dart';

import '../data/model/MyColors.dart';
import '../data/model/product.dart';

class HiveOperations {
 static HiveOperations? _instance;
 late Box<Product> _favBox;
 late Box<Product> _cartBox;
 late Box<Product> _allProductBox;

 HiveOperations._();

 factory HiveOperations(){
  return _instance ??= HiveOperations._();
 }

 Future<void> openBox() async {
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(MyColorsAdapter());

  _favBox = await Hive.openBox<Product>('fav');
  _cartBox = await Hive.openBox<Product>('cart');
  _cartBox = await Hive.openBox<Product>('allProduct');
 }

 Box get favBox => _favBox;

 Box get cartBox => _cartBox;

 Box get allProductBox => _allProductBox;


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
 isInCart({id}){
  return _cartBox.containsKey(id.toString());
 }

 Future<void> addToFav(Product product) async {
  _favBox = Hive.box('fav');
  await _favBox.put(product.id.toString(), product);
  _cartBox.flush();
 }

 Future<void> addAllProduct(List<Product> product) async {
  _allProductBox = Hive.box('allProduct');
  await _allProductBox.addAll(product);
  _allProductBox.flush();
 }

 Future<void> deleteFromFav(int id) async {
  _favBox = Hive.box('fav');
  await _favBox.delete(id.toString());
  _cartBox.flush();
 }
 isInFav({id}){
  return _favBox.containsKey(id.toString());
 }


 List<Product> getAllCart(){
  _cartBox = Hive.box('cart');
  return _cartBox.values.toList();
 }

 List<Product> getAllProduct(){
  _allProductBox = Hive.box('allProduct');
  return _allProductBox.values.toList();
 }

 List<Product> getAllFav(){
  _favBox = Hive.box('fav');
  return _favBox.values.toList();
 }

 deleteAllProductFromCart() async {
  _cartBox = Hive.box('cart');
  await _cartBox.clear();
  _cartBox.flush();
 }

}