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

  void addDisease(Drug drug) {
    drugs.insert(
      0,
      Drug(
        drugId: 'teste',
        name: drug.name,
        description: drug.description,
      ),
    );

    notifyListeners();
  }

  void loadDisease() {}
}
