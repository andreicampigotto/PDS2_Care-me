import 'package:care/models/allergy.dart';
import 'package:flutter/material.dart';

import '../widgets/default_form.dart';

class AllergiesScreen extends StatefulWidget {
  const AllergiesScreen({super.key});

  @override
  State<AllergiesScreen> createState() => _AllergiesScreenState();
}

class _AllergiesScreenState extends State<AllergiesScreen> {
  @override
  void initState() {
    super.initState();
  }

  _addTransaction(String name, String description, DateTime date) {
    final newTransaction = Allergy(
      allergyId: 'XX01',
      name: name,
      description: description,
      date: date,
    );
  }

  _openTransActionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return DefaultForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alergias'),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        child: const Icon(
          Icons.add,
          color: Color.fromRGBO(
            114,
            155,
            114,
            1,
          ),
        ),
        onPressed: () => (_openTransActionFormModal(context)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
