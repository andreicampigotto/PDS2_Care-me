import 'package:care/models/disease.dart';
import 'package:care/models/disease_list.dart';
import 'package:care/widgets/default_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/disease_item.dart';

class DiseasesScreen extends StatelessWidget {
  const DiseasesScreen({super.key});

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
    final DiseaseList disease = Provider.of(context);

    final provider = Provider.of<DiseaseList>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Doenças'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshDisease(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: disease.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                DiseaseItem(disease: disease.items[i]),
                const Divider(),
              ],
            ),
          ),
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

  Future<void> _refreshDisease(BuildContext context) {
    return Provider.of<DiseaseList>(context, listen: false).loadDisease();
  }
}
