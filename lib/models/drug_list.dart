import 'package:flutter/foundation.dart';
import 'drug.dart';

class DrugList with ChangeNotifier {
  final List<Drug> _drugs = [];

  List<Drug> get drugs {
    return [..._drugs];
  }

  int get diseasesCount {
    return _drugs.length;
  }

  void addDrug(Drug drug) {
    drugs.insert(
      0,
      Drug(
        drugId: 'xx01',
        name: drug.name,
        description: drug.description,
        date: DateTime.now(),
        continuos: drug.continuos,
      ),
    );

    notifyListeners();
  }

  void loadDrug() {}
}
