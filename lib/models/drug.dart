import 'package:flutter/material.dart';

class Drug with ChangeNotifier {
  final String drugId;
  final String name;
  final String description;
  final bool continuos;
  final DateTime date;
  final bool active;

  Drug({
    required this.drugId,
    required this.name,
    required this.description,
    required this.date,
    required this.continuos,
    required this.active,
  });
}
