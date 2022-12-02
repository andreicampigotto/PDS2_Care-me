import 'package:flutter/material.dart';

class Appointment with ChangeNotifier {
  final String appointmentId;
  final String bloodPressure;
  final String comments;
  final String doctor;
  final double weight;
  final DateTime date;

  Appointment({
    required this.appointmentId,
    required this.weight,
    required this.bloodPressure,
    required this.comments,
    required this.doctor,
    required this.date,
  });
}
