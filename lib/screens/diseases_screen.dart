import 'package:care/models/disease.dart';
import 'package:care/widgets/default_cards.dart';
import 'package:care/widgets/default_form.dart';
import 'package:flutter/material.dart';

class DiseasesScreen extends StatefulWidget {
  const DiseasesScreen({super.key});
  @override
  State<DiseasesScreen> createState() => _DiseasesScreenState();
}

class _DiseasesScreenState extends State<DiseasesScreen> {
  @override
  void initState() {
    super.initState();
  }

  _addTransaction(
      String name, String description, DateTime date, bool continuos) {
    continuos = false;
    final newTransaction = Disease(
      diseaseId: 'XX01',
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
        title: Text('Doenças'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 8),
          DefaultCards(),
        ],
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
