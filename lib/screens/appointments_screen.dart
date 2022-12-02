import 'package:care/models/appointment_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/appointment_item.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  Future<void> _refreshAppointments(BuildContext context) {
    return Provider.of<AppointmentList>(context, listen: false)
        .loadAppointment();
  }

  @override
  Widget build(BuildContext context) {
    final AppointmentList appointments = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshAppointments(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: appointments.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                AppointmentItem(appointment: appointments.items[i]),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
