import 'package:flutter/material.dart';

class NewAppointmentScreen extends StatelessWidget {
  const NewAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova consulta'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            margin: EdgeInsets.only(left: 16, right: 16),
            elevation: 8,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text('Como foi sua consulta?')),
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
                  children: [],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
