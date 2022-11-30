import 'package:care/models/allergy.dart';
import 'package:flutter/foundation.dart';
import '../data/dummy_data.dart';

class AllergyList with ChangeNotifier {
  final List<Allergy> _items = DAMMY_ALLERGIES;

  List<Allergy> get items => [..._items];

  int get allergiesCount {
    return _items.length;
  }

  void addAllergy(Allergy allergy) {
    _items.add(allergy);
    notifyListeners();
  }

  void loadAllergy() {}
}
