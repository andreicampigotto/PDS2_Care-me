import 'package:care/screens/appointments_screen.dart';
import 'package:care/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/app_routes.dart';

void main() => runApp(Care());

class Care extends StatefulWidget {
  @override
  State<Care> createState() => _MyAppState();
}

class _MyAppState extends State<Care> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Care',
      theme: ThemeData(
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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(
                114,
                155,
                114,
                1,
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
              ),
            ),
      ),
      routes: {
        AppRoutes.START: (ctx) => StartScreen(),
        AppRoutes.APPOINTMENTS: (ctx) => AppointmentsScreen(),
      },
    );
  }
}
