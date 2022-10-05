import 'package:care/models/appointment.dart';
import 'package:flutter/foundation.dart';

class AppointmentList with ChangeNotifier {
  final List<Appointment> _appointments = [];

  List<Appointment> get appointments {
    return [..._appointments];
  }

  int get itemsCount {
    return appointments.length;
  }

  void addDrug(Appointment appointment) {
    // appointments.insert(
    //   0,
    //   Appointment(
    //     appointmentId: 'appointmentId',
    //     allergies: allergies,
    //     bloodPressure: bloodPressure,
    //     comments: comments,
    //     doctor: doctor,
    //     appointmentDate: appointmentDate,
    //     drugs: drugs,
    //     diseases: diseases,
    //   ),
    // );

    notifyListeners();
  }
}
