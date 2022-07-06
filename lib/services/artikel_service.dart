import 'package:dio/dio.dart';
import 'package:artikel/models/detail_artikel_model.dart';
import 'package:artikel/models/artikel_model.dart';

class ArtikelService {
  Future<ArtikelModel> getArtikel() async {
    var response = await Dio().get('https://api.indosiana.com/api/articles');
    return ArtikelModel.fromJson(response.data);
  }

  Future<DetailArtikelModel> getDetailArtikel({int? key}) async {
    var response =
        await Dio().get('https://api.indosiana.com/api/articles/$key');
    print(key);
    print("response : $response");

    return DetailArtikelModel.fromJson(response.data);
  }
}
