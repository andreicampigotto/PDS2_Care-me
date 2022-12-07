import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import '../utils/constants.dart';
import 'drug.dart';
import 'package:http/http.dart' as http;

class DrugList with ChangeNotifier {
  final List<Drug> _items = [];

  List<Drug> get items => [..._items];

  int get itemsCount {
    return items.length;
  }

  Future<void> addDrug(Drug drug) async {
    final date = DateTime.now();
    final response = await http.post(
      Uri.parse('${Constants.DRUG_BASE_URL}.json'),
      body: jsonEncode(
        {
          'name': drug.name,
          'date': date.toIso8601String(),
          'description': drug.description,
          'isContinuos': drug.isContinuos,
          'active': drug.active
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
          date: DateTime.parse(drugData['date']),
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

  Future<void> saveDrugFromData(Map<dynamic, Object> data) {
    final drug = Drug(
      drugId: Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      date: DateTime.now(),
      isContinuos: false,
      active: true,
    );

    return addDrug(drug);
  }
}
