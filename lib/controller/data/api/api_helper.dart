import 'dart:io';

import 'api_response.dart';

mixin ApiHelper {
  ApiResponse get failedResponse =>
      ApiResponse(message:'Something went wrong', success: false);

  ApiResponse get successResponce => ApiResponse(message:'accomplished Successfully',success: true);

  Map<String, String> get headers {
    return {
      HttpHeaders.authorizationHeader: '',
      HttpHeaders.acceptHeader: 'application/json',
    };
  }

  Map<String, String> get headersWithOutToken {
    return {
      // HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
    };
  }
}
