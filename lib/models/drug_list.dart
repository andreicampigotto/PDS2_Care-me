import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../data/dummy_data.dart';
import 'drug.dart';

class DrugList with ChangeNotifier {
  final List<Drug> _items = DAMMY_DRUGS;

  List<Drug> get items => [..._items];

  int get itemsCount {
    return items.length;
  }

  get http => null;

  Future<void> addDrug(Drug drug) async {
    final response = await http.post(
      //Uri.parse('${Constants.PRODUCT_BASE_URL}.json'),
      body: jsonEncode(
        {
          "name": drug.name,
          "date": drug.date,
          "description": drug.description,
          "continuos": drug.continuos,
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
        continuos: drug.continuos,
        active: drug.active,
      ),
    );
    notifyListeners();
  }

  Future<void> loadDrug() async {
    final response = await http.get(
        //Uri.parse('${Constants.PRODUCT_BASE_URL}.json'),
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
          continuos: drugData['continuos'],
          active: drugData['active'],
        ),
      );
    });
    notifyListeners();
  }

  void removeItem(String drugId) {
    _items.remove(drugId);
    notifyListeners();
  }
}
