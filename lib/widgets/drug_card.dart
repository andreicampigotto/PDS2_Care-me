import 'package:care/models/drug_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/drug.dart';
import 'drug_item.dart';

class DrugCard extends StatelessWidget {
  const DrugCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DrugList>(
      context,
      listen: true,
    );
    final List<Drug> loadedDrug = provider.items;

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: loadedDrug.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: loadedDrug[i],
        child: DrugItem(
          drug: provider.items[i],
        ),
      ),
    );
  }
}
