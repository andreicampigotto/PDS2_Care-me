import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../data/dummy_data.dart';
import '../utils/constants.dart';
import 'drug.dart';
import 'package:http/http.dart' as http;

class DrugList with ChangeNotifier {
  final List<Drug> _items = DAMMY_DRUGS;

  List<Drug> get items => [..._items];

  int get itemsCount {
    return items.length;
  }

  Future<void> addDrug(Drug drug) async {
    final response = await http.post(
      Uri.parse('${Constants.DRUG_BASE_URL}.json'),
      body: jsonEncode(
        {
          "name": drug.name,
          "date": drug.date,
          "description": drug.description,
          "isContinuos": drug.isContinuos,
          "active": drug.active
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];
    _items.add(
      Drug(
          drugId: id,
          name: drug.name,
          description: drug.description,
          date: drug.date,
          isContinuos: drug.isContinuos,
          active: drug.active),
    );
    notifyListeners();
  }

  Future<void> loadDrug() async {
    final response = await http.get(
      Uri.parse('${Constants.DRUG_BASE_URL}.json'),
    );

    if (response.body == 'null') return;
    _items.clear();
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((drugId, drugData) {
      _items.add(
        Drug(
          drugId: drugId,
          name: drugData['name'],
          description: drugData['description'],
          date: drugData['date'],
          isContinuos: drugData['isContinuos'],
          active: drugData['active'],
        ),
      );
    });
    notifyListeners();
  }

  Future<void> deleteDrug(Drug drug) async {
    drug.active = false;
  }

  Future<void> saveDrugFromData(Map<String, Object> data) {
    final drug = Drug(
      drugId: data['id'] as String,
      name: data['name'] as String,
      description: data['description'] as String,
      date: data['date'] as DateTime,
      isContinuos: data['isContinuos'] as bool,
      active: data['active'] as bool,
    );

    return addDrug(drug);
  }
}
