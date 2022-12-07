import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class Drug with ChangeNotifier {
  final String drugId;
  final String name;
  final String description;
  bool isContinuos;
  final DateTime date;
  bool active;

  Drug(
      {required this.drugId,
      required this.name,
      required this.description,
      required this.date,
      required this.isContinuos,
      required this.active});
}
