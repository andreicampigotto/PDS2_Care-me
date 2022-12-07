import 'dart:convert';
import 'dart:math';
import 'package:care/models/disease.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class DiseaseList with ChangeNotifier {
  final List<Disease> _items = [];

  List<Disease> get items => [..._items];

  int get diseaseCount {
    return _items.length;
  }

  Future<void> addDisease(Disease disease) async {
    final date = DateTime.now();
    final response = await http.post(
      Uri.parse('${Constants.DISEASE_BASE_URL}.json'),
      body: jsonEncode(
        {
          'name': disease.name,
          'date': date.toIso8601String(),
          'description': disease.description,
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
      Uri.parse('${Constants.DISEASE_BASE_URL}.json'),
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
          date: DateTime.parse(diseaseData['date']),
        ),
      );
    });
    notifyListeners();
  }

  Future<void> saveDiseaseFromData(Map<String, Object> data) {
    final disease = Disease(
      diseaseId: Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      date: DateTime.now(),
    );

    return addDisease(disease);
  }

  int get itemsCount {
    return items.length;
  }
}
