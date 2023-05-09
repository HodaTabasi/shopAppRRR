import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/user.dart';

enum PrefKeys { loggedIn, lang ,user}

enum PrefKeysPatient {
  id,
  firstName,
  secondName,
  thirdName,
  lastName,
  identityNumber,
  mobile,
  email,
  patientType,
  payingType,
  insuranceNumber,
  insuranceDate,
  insuranceName,
  isLoggedIn,
  token
}

class SharedPrefController {
  SharedPrefController._internal();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._internal();
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  set user(user){
    String encodedMap = json.encode(user);
    print(encodedMap);
    _sharedPreferences.setString(PrefKeys.user.name, encodedMap);
  }

  User get user =>User.fromJson(json.decode(_sharedPreferences.getString(PrefKeys.user.name)??''));

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;

  set loggedIn(b) => _sharedPreferences.setBool(PrefKeys.loggedIn.name, b) ;

  T? getValueFor<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }
  Future<bool> changeLanguage({required String language}) async {
    return _sharedPreferences.setString(PrefKeys.lang.name, language);
  }

  Future<bool> removeValueFor({required String key}) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PrefKeysPatient.isLoggedIn.name);
  }

  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }
}

