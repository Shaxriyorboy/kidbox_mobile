import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:kidbox_mobile/models/response_model.dart';

import 'db_service.dart';
import 'log_service.dart';

class NetworkService {
  static bool isTester = true;
  static Dio dio =
      Dio(BaseOptions(baseUrl: getServer(), headers: getHeaders()));

  static String SERVER_DEVELOPMENT = "https://kid-box.herokuapp.com";
  static String SERVER_PRODUCTION = "https://kid-box.herokuapp.com";

  static Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    return headers;
  }

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  /// /* Http Requests */
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    Response response = await dio.get(api, queryParameters: params);
    if (response.statusCode == 200) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    Response response = await dio.post(api, data: params);
    LogService.d(response.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    Response response = await dio.put(api, data: params); // http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> PATCH(String api, Map<String, dynamic> params) async {
    Response response = await dio.patch(api, data: params); // http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    Response response = await dio.delete(api, data: params); // http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  // Params

  static Map<String, dynamic> paramsSignIn(
      String phoneNumber, Map<String, String> device) {
    Map<String, dynamic> params = {};
    String language = DBService.to.getLanguage();
    // String inviterNumber = DBService.to.getInviterNumber();
    params.addAll({
      'deviceDto': device,
      'language': {"id": 1},
      'phoneNumber': phoneNumber,
      // 'inviterNumber': inviterNumber
    });
    LogService.d(params.toString());
    return params;
  }

  // Parsing

  static bool parseResult(String response) {
    dynamic decodedJson = json.decode(response);
    var result = ResResult.fromJson(decodedJson);
    var success = result.success;
    if (success == null || !success) {
      return false;
    }
    return true;
  }

// static Future<String?> MULTIPART(String api, String filePath, Map<String,String> params) async{
//   var uri = Uri.https(getServer(), api);
//   var request = MultipartRequest("Post",uri);
//
//   request.headers.addAll(getHeaders());
//   request.fields.addAll(params);
//   request.files.add(await MultipartFile.fromPath("picture", filePath));
//   var response = await request.send();
//
//   if (response.statusCode == 200 || response.statusCode == 201) return response.reasonPhrase;
//   return null;
// }

}
