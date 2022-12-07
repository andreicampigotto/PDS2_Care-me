import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class Drug with ChangeNotifier {
  final String drugId;
  final String name;
  final String description;
  bool? isContinuos;
  final DateTime date;
  bool active;

  Drug({
    required this.drugId,
    required this.name,
    required this.description,
    required this.date,
    this.isContinuos = false,
    this.active = true,
  });

  void _toggleContinuos() {
    isContinuos = !isContinuos!;
    notifyListeners();
  }

  Future<void> toggleContinuos() async {
    try {
      _toggleContinuos();

      final response = await http.patch(
        Uri.parse('${Constants.USER_BASE_URL}/$drugId.json'),
        body: jsonEncode(
          {
            "isContinuos": isContinuos,
          },
        ),
      );

      if (response.statusCode >= 400) {
        _toggleContinuos();
      }
    } catch (_) {
      _toggleContinuos();
    }
  }
}
