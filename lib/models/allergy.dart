import 'package:flutter/material.dart';

class Allergy with ChangeNotifier {
  final String allergyId;
  final String name;
  final String description;
  final DateTime date;

  Allergy({
    required this.allergyId,
    required this.name,
    required this.description,
    required this.date,
  });
}
