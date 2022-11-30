import 'dart:convert';
import 'package:care/models/disease.dart';
import 'package:flutter/foundation.dart';
import '../data/dummy_data.dart';

class DiseaseList with ChangeNotifier {
  final List<Disease> _items = DAMMY_DISEASES;

  List<Disease> get items => [..._items];

  int get diseaseCount {
    return _items.length;
  }

  get http => null;

  Future<void> addDisease(Disease disease) async {
    final response = await http.post(
      //Uri.parse('${Constants.PRODUCT_BASE_URL}.json'),
      body: jsonEncode(
        {
          "name": disease.name,
          "date": disease.date,
          "description": disease.description,
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];
    _items.add(
      Disease(
        diseaseId: id,
        name: disease.name,
        description: disease.description,
        date: disease.date,
      ),
    );
    notifyListeners();
  }

  Future<void> loadDisease() async {
    final response = await http.get(
        //Uri.parse('${Constants.PRODUCT_BASE_URL}.json'),
        );

    if (response.body == 'null') return;
    _items.clear();
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((diseaseId, diseaseData) {
      _items.add(
        Disease(
          diseaseId: diseaseId,
          name: diseaseData['name'],
          description: diseaseData['description'],
          date: diseaseData['date'],
        ),
      );
    });
    notifyListeners();
  }

  Future<void> saveDiseaseFromData(Map<String, Object> data) {
    final disease = Disease(
      diseaseId: data['id'] as String,
      name: data['name'] as String,
      description: data['description'] as String,
      date: data['date'] as DateTime,
    );

    return addDisease(disease);
  }

  int get itemsCount {
    return items.length;
  }
}
