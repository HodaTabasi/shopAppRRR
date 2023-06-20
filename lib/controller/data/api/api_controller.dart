import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rrr_shop_app/controller/data/api/api_setting.dart';
import 'package:rrr_shop_app/controller/data/model/rate.dart';
import 'package:rrr_shop_app/controller/data/model/search.dart';
import 'package:rrr_shop_app/controller/preferences/shared_pref_controller.dart';

import '../model/user.dart';
import 'api_helper.dart';

class APIController with ApiHelper{

dynamic getAllProduct({page}) async {
  Uri uri = Uri.parse(APISetting.get_all_product.replaceFirst("{number}", page.toString()));
  var response = await http.get(uri, headers: headersWithOutToken);

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

dynamic getOrders({statusId,page}) async {
  User u = SharedPrefController().user;
  Uri uri = Uri.parse(APISetting.get_orders.replaceFirst('{customer_id}/{status_id}','${u.id}/$statusId').replaceFirst("{number}", page.toString()));
  print(uri.path);
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
  print(order.toJson1());
  Uri uri = Uri.parse(APISetting.add_order);
  var response = await http.post(uri, headers: headersWithOutToken,body: order.toJson1());

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

dynamic getPublicOffer() async {
  Uri uri = Uri.parse(APISetting.get_pubic_offer);
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

dynamic getNotifications() async {
  User u = SharedPrefController().user;
  Uri uri = Uri.parse(APISetting.get_notifications.replaceFirst('{customer_id}','${u.id}' ));
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
dynamic cancelOrder({id}) async {
  Uri uri = Uri.parse(APISetting.cancel_order.replaceFirst("{id}", id));
  var response = await http.post(uri, headers: headersWithOutToken);

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

dynamic Filtter({required Search search}) async {

  Uri uri = Uri.parse(APISetting.fillter);
  var response = await http.post(uri, headers: headersWithOutToken,body: search.toJson());

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

deleteUser({phone}) async {
  Uri uri = Uri.parse(APISetting.delete_user.replaceFirst("{phone_number}", phone));
  var response = await http.delete(uri, headers: headersWithOutToken);

  print(response.body);

  if (response.statusCode == 200 || response.statusCode == 400) {
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    }
  }
  return null;
}

///////////////////////Auth/////////////////////////

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
  print(user.toString());
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

registerWithImage({required String path,required User user}) async {
  var url = Uri.parse(APISetting.register);
  var request = http.MultipartRequest('POST', url);
  http.MultipartFile imageFile =
  await http.MultipartFile.fromPath('profile_image', path);
  request.files.add(imageFile);
  request.headers[HttpHeaders.acceptHeader] = 'application/json';
  request.fields['name'] = user.name!;
  request.fields['email'] = user.email!;
  request.fields['phone_number'] = user.phoneNumber.toString();
  request.fields['id_number'] = user.idNumber.toString();
  request.fields['date_of_birth'] = user.dateOfBirth!;
  request.fields['gender'] = user.gender!;
  request.fields['token'] = user.token!;
  request.fields['lang'] = 'ar';

  var response = await request.send();
  print(response.statusCode);
  // print(response.stream.transform(utf8.decoder).first);
  if (response.statusCode == 200) {
    var body = await response.stream.transform(utf8.decoder).first;
    var jsonResponse = jsonDecode(body);
    print("$jsonResponse");
    return jsonResponse;
  }
}


 updateUserWithImage({required String path,required User user}) async {
  print(user.toString());
  print(path);
  var url = Uri.parse(APISetting.update_user);
  var request = http.MultipartRequest('POST', url);
  http.MultipartFile imageFile =
  await http.MultipartFile.fromPath('profile_image', path);
  request.files.add(imageFile);
  request.headers[HttpHeaders.acceptHeader] = 'application/json';
  request.fields['name'] = user.name!;
  request.fields['email'] = user.email!;
  request.fields['phone_number'] = user.phoneNumber.toString();
  request.fields['id_number'] = user.idNumber.toString();
  request.fields['date_of_birth'] = user.dateOfBirth!;
  request.fields['gender'] = user.gender!;
  request.fields['token'] = user.token!;
  request.fields['lang'] = 'ar';

  var response = await request.send();
  print(response.statusCode);
  // if (response.statusCode == 200) {
    var body = await response.stream.transform(utf8.decoder).first;
    var jsonResponse = jsonDecode(body);
    print("$jsonResponse");

    return jsonResponse;
  // }
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





dynamic getProductByCateId({id}) async {
  Uri uri = Uri.parse(APISetting.get_all_product_by_category.replaceFirst('{id}',id ));
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

  dynamic getProductRate({id}) async {
    Uri uri = Uri.parse(APISetting.get_rate_product.replaceFirst('{id}',id ));
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

  dynamic addProductRate({required Rating rate}) async {
    Uri uri = Uri.parse(APISetting.add_rate_product);
    var response = await http.post(uri, headers: headersWithOutToken,body: rate.toJson1());

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return jsonResponse;
      }
    }
    return null;
  }

dynamic getProductBySubCateId({id,subId}) async {
  String s = APISetting.get_all_product_by_subcategory.replaceFirst('{id}',id );
   s = APISetting.get_all_product_by_subcategory.replaceFirst('{sub_id}',subId );
  Uri uri = Uri.parse(s);
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

}