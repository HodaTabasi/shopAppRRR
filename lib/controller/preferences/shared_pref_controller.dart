import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/user.dart';

enum PrefKeys {loggedIn, lang ,user,token,notificaionNumber,lastUpdate}



class SharedPrefController {
  SharedPrefController._internal();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._internal();
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if(_sharedPreferences.get(PrefKeys.lang.name) == null)
      await _sharedPreferences.setString(PrefKeys.lang.name, 'ar');
      await _sharedPreferences.setInt("delivery_cost", 2500);
  }

  Future<void> saveUserDeviceId(token) async {
    await _sharedPreferences.setString(PrefKeys.token.name, token);
  }

  bool? getLocalNotification() {
    return _sharedPreferences.getBool('localNotification');
  }

  setLocalNotification(bool value) {
    return _sharedPreferences.setBool('localNotification', value);
  }


  set user(user){
    print("dgdr ${user}");
    String encodedMap = json.encode(user);
    print(encodedMap);
    _sharedPreferences.setString(PrefKeys.user.name, encodedMap);
  }

  User get user =>User.fromJson(json.decode(_sharedPreferences.getString(PrefKeys.user.name)??''));

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;

  set loggedIn(b) => _sharedPreferences.setBool(PrefKeys.loggedIn.name, b) ;

  String get lastUpdate =>
      _sharedPreferences.getString(PrefKeys.lastUpdate.name) ?? "";

   Future<bool> lastUpdate1(b) async => await _sharedPreferences.setString(PrefKeys.lastUpdate.name, b) ;

  T? getValueFor<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }
  Future<bool> changeLanguage({required String language}) async {
    return await _sharedPreferences.setString(PrefKeys.lang.name, language);
  }

  Future<bool> removeValueFor({required String key}) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PrefKeys.loggedIn.name);
  }

  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }

  addNotification() async {
    int number = notificaionNumber;
    number ++;
    await setNotificaionNumber(number);
  }
  setNotificaionNumber(number) async {
    await _sharedPreferences.setInt(PrefKeys.notificaionNumber.name,number);
  }
  int get notificaionNumber =>_sharedPreferences.getInt(PrefKeys.notificaionNumber.name) ?? 0;
  String get token =>_sharedPreferences.getString(PrefKeys.token.name) ?? '';
}

