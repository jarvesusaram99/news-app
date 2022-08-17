import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news/service.dart';

import 'UIdata.dart';



class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  Future<MappedNetworkServiceResponse> postNew(
      http.MultipartRequest request) async {
    http.StreamedResponse response = await request.send();
    var responseData = jsonDecode(await response.stream.bytesToString());
    return processResponse(response, responseData);
  }

  Future<MappedNetworkServiceResponse> get(http.Request request) async {
    http.StreamedResponse response = await request.send();
    var responseData = jsonDecode(await response.stream.bytesToString());
    return processResponse(response, responseData);
  }

  MappedNetworkServiceResponse processResponse<T>(
      http.StreamedResponse response, responseData) {
    print('response body ${response.statusCode}');
    if (!((response.statusCode < UIData.resCode200) ||
        (response.statusCode >= UIData.resCode300))) {
      return MappedNetworkServiceResponse(
          mappedResult: responseData,
          networkServiceResponse: new NetworkServiceResponse(
              code: response.statusCode, message: ''));
    } else {
      print('MappedNetworkServiceResponse failed ');

      return MappedNetworkServiceResponse(
          networkServiceResponse: new NetworkServiceResponse(
              code: response.statusCode,
              message: "(${response.statusCode}) ${response}"));
    }
  }
}
