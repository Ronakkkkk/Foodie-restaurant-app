

import 'package:get/get.dart';

class Apiclient extends GetConnect implements GetxService {
  late String token;
  final String appbaseurl;
  late Map<String, String> _mainheaders;
  Apiclient({required this.appbaseurl}) {
    baseUrl = appbaseurl;
    timeout = Duration(seconds: 30);
    _mainheaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
  Future<Response> getdata(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
