import 'package:care/models/disease.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DiseaseList with ChangeNotifier {
  final List<Disease> _diseases = [];

  List<Disease> get diseases {
    return [..._diseases];
  }

  int get diseasesCount {
    return _diseases.length;
  }

  void addDisease(Disease disease) {
    diseases.insert(
      0,
      Disease(
        diseaseId: 'teste',
        name: disease.name,
        description: disease.description,
        date: DateTime.now(),
      ),
    );

    notifyListeners();
  }

  void loadDisease() {}
}
