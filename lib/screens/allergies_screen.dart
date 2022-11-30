import 'package:care/widgets/default_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/allergy.dart';
import '../models/allergy_list.dart';
import '../widgets/allergy_card.dart';

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
    final provider = Provider.of<AllergyList>(
      context,
      listen: true,
    );
    final List<Allergy> loadedAllergies = provider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alergias'),
      ),
      body: ListView.builder(
        itemCount: loadedAllergies.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: loadedAllergies[i],
          child: const AllergyCard(),
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
