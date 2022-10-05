import 'package:care/screens/appointments_screen.dart';
import 'package:care/screens/diseases_screen.dart';
import 'package:care/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/allergies_screen.dart';
import 'screens/drugs_screen.dart';
import 'screens/new_appointment_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(Care());

class Care extends StatefulWidget {
  @override
  State<Care> createState() => _MyAppState();
}

class _MyAppState extends State<Care> {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
      title: 'Care',
      theme: ThemeData(
        colorScheme: tema.colorScheme.copyWith(
          primary: const Color.fromRGBO(
            114,
            155,
            114,
            1,
          ),
          secondary: Colors.white,
          secondaryContainer: const Color.fromRGBO(
            114,
            155,
            114,
            1,
          ),
        ),
        canvasColor: const Color.fromRGBO(
          207,
          232,
          169,
          1,
        ),
        primaryColor: const Color.fromRGBO(
          114,
          155,
          114,
          1,
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        AppRoutes.START: (ctx) => StartScreen(),
        AppRoutes.APPOINTMENTS: (ctx) => AppointmentsScreen(),
        AppRoutes.NEW_APPOINTMENTS: (ctx) => NewAppointmentScreen(),
        AppRoutes.DISEASES: (ctx) => DiseasesScreen(),
        AppRoutes.ALLERGIES: (ctx) => AllergiesScreen(),
        AppRoutes.DRUGS: (ctx) => DrugsScreen(),
      },
    );
  }
}
