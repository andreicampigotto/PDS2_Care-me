import 'package:care/models/appointment.dart';
import 'package:care/models/appointment_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appointment_item.dart';

class AppoitmentCard extends StatelessWidget {
  const AppoitmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppointmentList>(
      context,
      listen: true,
    );
    final List<Appointment> loadedAppointment = provider.items;

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: loadedAppointment.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: loadedAppointment[i],
        child: AppointmentItem(
          appointment: provider.items[i],
        ),
      ),
    );
  }
}
