import 'dart:convert';
import 'package:care/models/allergy.dart';
import 'package:flutter/foundation.dart';
import '../data/dummy_data.dart';

class AllergyList with ChangeNotifier {
  final List<Allergy> _items = DAMMY_ALLERGIES;

  List<Allergy> get items => [..._items];

  int get itemsCount {
    return items.length;
  }

  get http => null;

  Future<void> addAllergy(Allergy allergy) async {
    final response = await http.post(
      //Uri.parse('${Constants.PRODUCT_BASE_URL}.json'),
      body: jsonEncode(
        {
          "name": allergy.name,
          "date": allergy.date,
          "description": allergy.description,
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
        //Uri.parse('${Constants.PRODUCT_BASE_URL}.json'),
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
      allergyId: data['id'] as String,
      name: data['name'] as String,
      description: data['description'] as String,
      date: data['date'] as DateTime,
    );

    return addAllergy(allergy);
  }
}
