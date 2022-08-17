import 'dart:convert';

import 'package:news/model.dart';
import 'package:news/service.dart';

import 'url.dart';


abstract class NewsClass {
  void onnewssuccess(FetchNews fetch);
  void onnewserror(String error);
}

class Newspresenter {
  NewsClass _view;
  URLCollection api = new URLCollection();
  Newspresenter(this._view);
  dingCountry() {
    api.dingCountry()
        .then((MappedNetworkServiceResponse res) async {
      print(res.toString());
      if (!res.success) {
        _view.onnewserror(res.errorHuman);
      } else {
        // print('res.DingCountry ${jsonEncode(res.mappedResult)}');
        _view.onnewssuccess(
            FetchNews.fromJson(jsonEncode(res.mappedResult)));
      }
    });
  }
}
