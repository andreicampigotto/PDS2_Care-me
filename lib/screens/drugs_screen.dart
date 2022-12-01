import 'package:care/models/drug.dart';
import 'package:care/models/drug_list.dart';
import 'package:care/widgets/drug_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/default_form.dart';

class DrugsScreen extends StatelessWidget {
  const DrugsScreen({super.key});

  Future<void> _refreshDrugs(BuildContext context) {
    return Provider.of<DrugList>(context, listen: false).loadDrug();
  }

  _addTransaction(
      String name, String description, DateTime date, bool continuos) {
    continuos = false;
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
    final DrugList drugs = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicametos'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshDrugs(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: drugs.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                DrugItem(drug: drugs.items[i]),
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
}
