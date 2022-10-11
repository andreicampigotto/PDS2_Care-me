import 'package:care/models/appointment.dart';
import 'package:care/models/disease.dart';
import 'package:care/models/drug.dart';

final DAMMY_DISEASES = [
  Disease(
    diseaseId: 'xx001',
    name: 'Gripe',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
  ),
  Disease(
    diseaseId: 'xx002',
    name: 'Labirintite',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
  ),
  Disease(
    diseaseId: 'xx003',
    name: 'Faringite',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
  ),
];

final DAMMY_DRUGS = [
  Drug(
    drugId: 'xx001',
    name: 'Menezulida',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
    continuos: true,
  ),
  Drug(
    drugId: 'xx002',
    name: 'Ruacutan',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
    continuos: true,
  ),
  Drug(
    drugId: 'xx003',
    name: 'benegripe',
    description:
        'Gripe iniciada no ultimo dia 5, primeiros sintomas sentido por volta das 17hrs, tomado neusaudina',
    date: DateTime.now(),
    continuos: false,
  ),
];
