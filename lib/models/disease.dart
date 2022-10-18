import 'package:flutter/material.dart';

class Disease with ChangeNotifier {
  final String diseaseId;
  final String name;
  final String description;
  final DateTime date;

  Disease({
    required this.diseaseId,
    required this.name,
    required this.description,
    required this.date,
  });
}
