import 'package:care/models/disease.dart';
import 'package:flutter/foundation.dart';
import '../data/dummy_data.dart';

class DiseaseList with ChangeNotifier {
  final List<Disease> _items = DAMMY_DISEASES;

  List<Disease> get items => [..._items];

  int get diseasesCount {
    return _items.length;
  }

  void addDisease(Disease disease) {
    _items.add(disease);
    notifyListeners();
  }

  void loadDisease() {}
}
