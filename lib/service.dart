
import 'package:news/UIdata.dart';

class NetworkServiceResponse {
  int code;
  String message;
  bool get success => code >= 200 && code < 300;

  NetworkServiceResponse({required this.code, required this.message});

  String getErrorHuman() {
    // print('response code $code');
    if (code == UIData.resCode404) {
      return UIData.msgLogin404;
    } else {
      return UIData.msg500;
    }
  }
}

class MappedNetworkServiceResponse {
  final dynamic mappedResult;
  final NetworkServiceResponse networkServiceResponse;
  MappedNetworkServiceResponse(
      {this.mappedResult, required this.networkServiceResponse});

  bool get success => networkServiceResponse.success;

  String get errorHuman =>
      //  networkServiceResponse?.getErrorHuman() ?? "Unknown error";
      networkServiceResponse.getErrorHuman();
}
