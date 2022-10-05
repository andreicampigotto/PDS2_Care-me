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
                  child: const Text(
                    'Ola pessoa',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(
                    114,
                    155,
                    114,
                    1,
                  ),
                  foregroundColor: Color.fromRGBO(
                    114,
                    155,
                    114,
                    1,
                  ),
                  maxRadius: 85,
                  minRadius: 75,
                  backgroundImage: NetworkImage(
                    'https://www.thoughtco.com/thmb/51xXQ9UAXIVrPVWHdvBfsyASDz4=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/GilligansEthicsofCare-5148d189f3fa4143a098184dc8a92b8d.jpg',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Tipo sanguineo',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'idade',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Tel.: Emergencia',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
          ),
          SizedBox(
            width: 175.0,
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.NEW_APPOINTMENTS),
              child: Text('Nova consulta'),
            ),
          ),
          SizedBox(
            width: 175.0,
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.APPOINTMENTS),
              child: Text(
                'Histórico de consultas',
              ),
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
