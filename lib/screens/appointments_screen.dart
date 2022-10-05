import 'package:care/widgets/appointments_widget.dart';
import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultas'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('data'),
                Text('Pressao'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('peso'),
                Text('altura'),
                Text('imc'),
              ],
            ),
          ),
          Divider(),
          ListView(
            children: [
              AppointmentWidget(),
            ],
          )
        ],
      ),
    );
  }
}
