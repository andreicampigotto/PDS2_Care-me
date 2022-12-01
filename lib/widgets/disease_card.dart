import 'package:care/models/disease.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/disease_list.dart';
import 'disease_item.dart';

class DiseaseCard extends StatelessWidget {
  const DiseaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DiseaseList>(
      context,
      listen: true,
    );
    final List<Disease> loadedAllergy = provider.items;

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: loadedAllergy.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: loadedAllergy[i],
        child: DiseaseItem(
          disease: provider.items[i],
        ),
      ),
    );
  }
}
