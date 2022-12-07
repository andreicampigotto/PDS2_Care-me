import 'package:care/models/disease_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/disease_form.dart';
import '../widgets/disease_item.dart';

class DiseasesScreen extends StatelessWidget {
  const DiseasesScreen({super.key});

  Future<void> _refreshDiseases(BuildContext context) {
    return Provider.of<DiseaseList>(context, listen: false).loadDisease();
  }

  _openTransActionFormModal(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) => DiseaseForm());
  }

  @override
  Widget build(BuildContext context) {
    final DiseaseList diseases = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doenças'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshDiseases(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: diseases.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                DiseaseItem(disease: diseases.items[i]),
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
        onPressed: () => _openTransActionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
