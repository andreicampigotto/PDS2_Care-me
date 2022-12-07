import 'dart:convert';
import 'dart:math';
import 'package:care/models/allergy.dart';
import 'package:flutter/foundation.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

class AllergyList with ChangeNotifier {
  final List<Allergy> _items = [];

  List<Allergy> get items => [..._items];

  int get itemsCount {
    return items.length;
  }

  Future<void> addAllergy(Allergy allergy) async {
    final date = DateTime.now();
    final response = await http.post(
      Uri.parse('${Constants.ALLERGY_BASE_URL}.json'),
      body: jsonEncode(
        {
          'name': allergy.name,
          'date': date.toIso8601String(),
          'description': allergy.description,
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];
    _items.add(
      Allergy(
        allergyId: id,
        name: allergy.name,
        description: allergy.description,
        date: allergy.date,
      ),
    );
    notifyListeners();
  }

  Future<void> loadAllergy() async {
    final response = await http.get(
      Uri.parse('${Constants.ALLERGY_BASE_URL}.json'),
    );

    if (response.body == 'null') return;
    _items.clear();
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((allergyId, allergyData) {
      _items.add(
        Allergy(
          allergyId: allergyId,
          name: allergyData['name'],
          description: allergyData['description'],
          date: allergyData['date'],
        ),
      );
    });
    notifyListeners();
  }

  Future<void> saveAllergyFromData(Map<String, Object> data) {
    final allergy = Allergy(
      allergyId: Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      date: DateTime.now(),
    );

    return addAllergy(allergy);
  }
}
