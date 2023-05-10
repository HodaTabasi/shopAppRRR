import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rrr_shop_app/controller/data/api/api_setting.dart';

import '../model/user.dart';
import 'api_helper.dart';

class APIController with ApiHelper{

dynamic getAllProduct() async {
  Uri uri = Uri.parse(APISetting.get_all_product);
  var response = await http.get(uri, headers: headersWithOutToken);

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

dynamic getProductDetails({productId}) async {
  Uri uri = Uri.parse(APISetting.get_product_details.replaceFirst('{product_id}', productId));
  var response = await http.get(uri, headers: headersWithOutToken);

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

dynamic getNewProduct() async {
  Uri uri = Uri.parse(APISetting.get_new_product);
  var response = await http.get(uri, headers: headersWithOutToken);

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

dynamic getOrders({statusId}) async {
  Uri uri = Uri.parse(APISetting.get_orders.replaceFirst('{status_id}',statusId ));
  var response = await http.get(uri, headers: headersWithOutToken);

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

dynamic addOrder({order}) async {
  Uri uri = Uri.parse(APISetting.add_order);
  var response = await http.post(uri, headers: headersWithOutToken,body: {});

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

dynamic getSliders() async {
  Uri uri = Uri.parse(APISetting.get_sliders);
  var response = await http.get(uri, headers: headersWithOutToken);

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

dynamic getAllCategory() async {
  Uri uri = Uri.parse(APISetting.get_all_category);
  var response = await http.get(uri, headers: headersWithOutToken);

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

dynamic getSubCategory() async {
  Uri uri = Uri.parse(APISetting.get_sub_category);
  var response = await http.get(uri, headers: headersWithOutToken);

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

dynamic login({phone}) async {
  Uri uri = Uri.parse(APISetting.login);
  var response = await http.post(uri, headers: headersWithOutToken,body: {
    "phone_number":phone
  });

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

dynamic register({required User user}) async {
  Uri uri = Uri.parse(APISetting.register);
  var response = await http.post(uri, headers: headersWithOutToken,body: user.toJsonRegister());

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

dynamic updateUser({user}) async {
  Uri uri = Uri.parse(APISetting.update_user);
  var response = await http.post(uri, headers: headersWithOutToken,body:user.toJsonRegister());

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

}