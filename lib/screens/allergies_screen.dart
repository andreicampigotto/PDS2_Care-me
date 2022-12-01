import 'package:care/widgets/allergy_item.dart';
import 'package:care/widgets/default_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/allergy.dart';
import '../models/allergy_list.dart';

class AllergiesScreen extends StatelessWidget {
  const AllergiesScreen({super.key});

  Future<void> _refreshAllergies(BuildContext context) {
    return Provider.of<AllergyList>(context, listen: false).loadAllergy();
  }

  _addTransaction(
      String name, String description, DateTime date, bool continuos) {
    continuos = false;
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
    final AllergyList allergies = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alergias'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshAllergies(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: allergies.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                AllergyItem(allergy: allergies.items[i]),
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
