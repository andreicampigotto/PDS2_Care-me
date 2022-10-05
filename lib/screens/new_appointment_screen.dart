import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class NewAppointmentScreen extends StatelessWidget {
  const NewAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova consulta'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 32,
          ),
          Card(
            margin: EdgeInsets.only(left: 16, right: 16),
            elevation: 8,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    'Como foi sua consulta?',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Medico',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 155,
                      padding: EdgeInsets.all(16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Peso',
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      width: 155,
                      padding: EdgeInsets.all(16),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Pressão',
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Medicação'),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(AppRoutes.DISEASES),
                      child: Text('Doença'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Alergia'),
                    ),
                  ],
                ),
                SizedBox(
                  width: 175.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Salvar'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
