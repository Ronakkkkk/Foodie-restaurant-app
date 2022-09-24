import 'package:foodie/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularDealsRepo extends GetxService {
  final Apiclient apiclient;
  PopularDealsRepo({required this.apiclient});

  Future<Response> getpopulardealslist() async {
    return await apiclient.getdata('khate bachha');
  }
}
