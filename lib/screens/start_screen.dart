import 'package:care/models/user.dart';
import 'package:care/utils/app_routes.dart';
import 'package:flutter/material.dart';

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
            margin: const EdgeInsets.only(right: 32, left: 32),
            elevation: 8,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: const Text(
                    'Ola José arates',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const CircleAvatar(
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
                  children: const [
                    Text(
                      "Tipo sanguineo: A+",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'Idade 37',
                      style: TextStyle(
                        color: Colors.black54,
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
                  child: const Text(
                    'Tel.: Emergencia: 11 95670-0001',
                    style: TextStyle(
                      color: Colors.black54,
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
              child: const Text('Nova consulta'),
            ),
          ),
          SizedBox(
            width: 175.0,
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.APPOINTMENTS),
              child: const Text(
                'Histórico de consultas',
              ),
            ),
          ),
          SizedBox(
            width: 175.0,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.DRUGS),
              child: const Text('Medicamentos'),
            ),
          ),
          SizedBox(
            width: 175.0,
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.DISEASES),
              child: const Text('Doenças'),
            ),
          ),
          SizedBox(
            width: 175.0,
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.ALLERGIES),
              child: const Text('Alergias'),
            ),
          ),
        ],
      ),
    );
  }
}
