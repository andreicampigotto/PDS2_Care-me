import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String userId;
  final String imageUrl;
  final String fullName;
  final DateTime birthday;
  final String emergencyPhone;
  final String bloodType;
  final double height;

  User({
    required this.userId,
    required this.imageUrl,
    required this.fullName,
    required this.birthday,
    required this.emergencyPhone,
    required this.bloodType,
    required this.height,
  });
}
