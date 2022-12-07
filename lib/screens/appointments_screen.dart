import 'package:care/models/appointment_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/appointment_card.dart';
import '../widgets/appointment_item.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<AppointmentList>(context, listen: false)
        .loadAppointment()
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const AppoitmentCard(),
    );
  }
}
