import 'package:care/models/user.dart';
import 'package:care/screens/appointments_screen.dart';
import 'package:care/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            margin: EdgeInsets.only(right: 24, left: 24),
            elevation: 8,
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text('Ola pessoa')),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: (Text('Image')),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Tipo sanguineo'),
                      Text('idade'),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text('Tel.: Emergenci')),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
          ),
          SizedBox(
            width: 175.0,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Nova consulta'),
            ),
          ),
          SizedBox(
            width: 175.0,
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.APPOINTMENTS),
              child: Text('Histórico de consultas'),
            ),
          ),
          SizedBox(
            width: 175.0,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Medicamentos'),
            ),
          ),
          SizedBox(
            width: 175.0,
            child: ElevatedButton(
              onPressed: () => AppointmentsScreen(),
              child: Text('Doenças'),
            ),
          ),
        ],
      ),
    );
  }
}
