import 'package:care/models/disease.dart';

import 'allergy.dart';
import 'doctor.dart';
import 'drug.dart';

class Appointment {
  final String appointmentId;
  final List<Disease> diseases;
  final List<Allergy> allergies;
  final List<Drug> drugs;
  final String bloodPressure;
  final String comments;
  final Doctor doctor;
  final String appointmentDate;

  Appointment({
    required this.appointmentId,
    required this.allergies,
    required this.bloodPressure,
    required this.comments,
    required this.doctor,
    required this.appointmentDate,
    required this.drugs,
    required this.diseases,
  });
}
