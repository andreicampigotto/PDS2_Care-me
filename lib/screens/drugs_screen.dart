import 'package:care/models/drug.dart';
import 'package:flutter/material.dart';
import '../widgets/default_form.dart';

class DrugsScreen extends StatefulWidget {
  const DrugsScreen({super.key});

  @override
  State<DrugsScreen> createState() => _DrugsScreenState();
}

class _DrugsScreenState extends State<DrugsScreen> {
  @override
  void initState() {
    super.initState();
  }

  _addTransaction(
      String name, String description, DateTime date, bool continuos) {
    final newTransaction = Drug(
      drugId: 'XX01',
      name: name,
      description: description,
      date: date,
      continuos: continuos,
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
        title: const Text('Medicações'),
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
