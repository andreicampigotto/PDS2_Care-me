import 'package:care/models/disease.dart';
import 'package:care/models/disease_list.dart';
import 'package:care/widgets/default_cards.dart';
import 'package:care/widgets/default_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/dummy_data.dart';

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
    final provider = Provider.of<DiseaseList>(
      context,
      listen: true,
    );
    final List<Disease> loadedDiseases = provider.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Doencas'),
      ),
      body: ListView.builder(
        itemCount: loadedDiseases.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: loadedDiseases[i],
          child: const DefaultCards(),
        ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
