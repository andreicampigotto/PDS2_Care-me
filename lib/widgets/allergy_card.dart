import 'package:care/widgets/allergy_item.dart';
import '../models/allergy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/allergy_list.dart';

class AllergyCard extends StatelessWidget {
  const AllergyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AllergyList>(
      context,
      listen: true,
    );
    final List<Allergy> loadedAllergy = provider.items;

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: loadedAllergy.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: loadedAllergy[i],
        child: AllergyItem(
          allergy: provider.items[i],
        ),
      ),
    );
  }
}
