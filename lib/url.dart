

 import 'package:news/service.dart';
import 'package:http/http.dart' as http;

import 'util.dart';



class URLCollection {
  NetworkUtil _netUtil = new NetworkUtil();
Future<MappedNetworkServiceResponse> dingCountry() async {
    var request = http.Request(
      'GET',
      Uri.parse('https://newsapi.org/v2/everything?q=india&from=2022-08-17&sortBy=popularity&apiKey=ffc17935d1b04ecfa3127f91ae27afa9'),
    );
   
    // print(request);
    var headers = {
      'Language': 'fr',
    };
   
    request.headers.addAll(headers);
    return _netUtil.get(request).then((MappedNetworkServiceResponse res) {
      return res;
    });
  }
}