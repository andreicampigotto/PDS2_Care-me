import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appointment.dart';
import '../models/appointment_list.dart';

class AppointmentWidget extends StatelessWidget {
  final Appointment? appointment;
  const AppointmentWidget({this.appointment, super.key});

  @override
  Widget build(BuildContext context) {
    final AppointmentList appointments = Provider.of(context);
    return Card(
        elevation: 8,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text('Medico'),
                  Text('data'),
                ],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Doencas'),
              //trailing: ,
            ),
            ListTile(
              title: Text('Alergia'),
            ),
            ListTile(
              title: Text('Medicacao'),
            ),
          ],
        ));
  }
}
