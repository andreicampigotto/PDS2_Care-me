import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:care/models/appointment.dart';
import 'package:flutter/foundation.dart';
import '../utils/constants.dart';

class AppointmentList with ChangeNotifier {
  final List<Appointment> _items = [];

  List<Appointment> get items {
    return [..._items];
  }

  int get itemsCount {
    return items.length;
  }

  Future<void> addApointment(Appointment appointment) async {
    final date = DateTime.now();
    final response = await http.post(
      Uri.parse('${Constants.APPOINTMENT_BASE_URL}.json'),
      body: jsonEncode(
        {
          'doctor': appointment.doctor,
          'date': date.toIso8601String(),
          'comments': appointment.comments,
          'bloodPressure': appointment.bloodPressure,
          'weight': appointment.weight,
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];
    _items.add(
      Appointment(
          appointmentId: id,
          doctor: appointment.doctor,
          comments: appointment.comments,
          date: appointment.date,
          weight: appointment.weight,
          bloodPressure: appointment.bloodPressure),
    );
    notifyListeners();
  }

  Future<void> loadAppointment() async {
    final response = await http.get(
      Uri.parse('${Constants.APPOINTMENT_BASE_URL}.json'),
    );

    if (response.body == 'null') return;
    _items.clear();
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((apointmentId, apointmentData) {
      _items.add(
        Appointment(
          appointmentId: apointmentId,
          doctor: apointmentData['doctor'],
          comments: apointmentData['comments'],
          date: apointmentData['date'],
          weight: apointmentData['weight'],
          bloodPressure: apointmentData['bloodPressure'],
        ),
      );
    });
    notifyListeners();
  }

  Future<void> saveApointmentFromData(Map<String, Object> data) {
    final apointment = Appointment(
      appointmentId: Random().nextDouble().toString(),
      doctor: data['doctor'] as String,
      comments: data['comments'] as String,
      date: DateTime.now(),
      weight: data['weight'] as double,
      bloodPressure: data['bloodPressure'] as String,
    );

    return addApointment(apointment);
  }
}
