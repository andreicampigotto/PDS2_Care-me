import 'package:care/models/appointment_list.dart';
import 'package:care/models/disease_list.dart';
import 'package:care/models/drug.dart';
import 'package:care/models/user_list.dart';
import 'package:care/screens/appointments_screen.dart';
import 'package:care/screens/diseases_screen.dart';
import 'package:care/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/allergy_list.dart';
import 'models/drug_list.dart';
import 'screens/allergies_screen.dart';
import 'screens/drugs_screen.dart';
import 'screens/new_appointment_screen.dart';
import 'utils/app_routes.dart';

void main() => runApp(const Care());

class Care extends StatefulWidget {
  const Care({super.key});

  @override
  State<Care> createState() => _MyAppState();
}

class _MyAppState extends State<Care> {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DiseaseList(),
        ),
        ChangeNotifierProvider(
          create: (_) => AllergyList(),
        ),
        ChangeNotifierProvider(
          create: (_) => DrugList(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppointmentList(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserList(),
        ),
      ],
      child: MaterialApp(
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
          AppRoutes.START: (ctx) => const StartScreen(),
          AppRoutes.APPOINTMENTS: (ctx) => const AppointmentsScreen(),
          AppRoutes.NEW_APPOINTMENTS: (ctx) => const NewAppointmentScreen(),
          AppRoutes.DISEASES: (ctx) => const DiseasesScreen(),
          AppRoutes.ALLERGIES: (ctx) => const AllergiesScreen(),
          AppRoutes.DRUGS: (ctx) => const DrugsScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
