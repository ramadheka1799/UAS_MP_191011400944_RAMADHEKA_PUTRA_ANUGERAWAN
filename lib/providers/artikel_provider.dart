import 'package:flutter/cupertino.dart';
import 'package:artikel/models/detail_artikel_model.dart';
import 'package:artikel/models/artikel_model.dart';
import 'package:artikel/services/artikel_service.dart';

class ArtikelProvider extends ChangeNotifier {
  ArtikelProvider() {
    showListArtikel();
  }

  final ArtikelService _ArtikelService = ArtikelService();
  ArtikelModel artikelModel = ArtikelModel();
  DetailArtikelModel detailArtikelModel = DetailArtikelModel();

  showListArtikel() async {
    artikelModel = await _ArtikelService.getArtikel();
    notifyListeners();
  }

  showDetailArtikel(int? id) async {
    print("id : $id");
    detailArtikelModel = await _ArtikelService.getDetailArtikel(key: id);
    notifyListeners();
  }
}

class ArtikelDetailProvider with ChangeNotifier {
  final ArtikelService _ArtikelService = ArtikelService();
  DetailArtikelModel detailArtikelModel = DetailArtikelModel();

  showDetailArtikel(String? id) async {
    print('id $id');
    notifyListeners();
  }
}
