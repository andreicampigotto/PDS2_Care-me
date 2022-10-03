import './doctor.dart';

class Appointment {
  final String appointmentId;
  final String appointment;
  final double weightallergyId;
  final String bloodPressure;
  final String comments;
  final Doctor doctor;
  final String appointmentDate;

  Appointment({
    required this.appointmentId,
    required this.appointment,
    required this.weightallergyId,
    required this.bloodPressure,
    required this.comments,
    required this.doctor,
    required this.appointmentDate,
  });
}
