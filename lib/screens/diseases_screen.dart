import 'package:care/models/disease_list.dart';
import 'package:care/widgets/disease_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/disease_form.dart';

class DiseasesScreen extends StatefulWidget {
  const DiseasesScreen({super.key});

  @override
  State<DiseasesScreen> createState() => _DiseasesScreenState();
}

class _DiseasesScreenState extends State<DiseasesScreen> {
  bool _isLoading = true;

  _openTransActionFormModal(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) => const DiseaseForm());
  }

  @override
  void initState() {
    super.initState();
    Provider.of<DiseaseList>(context, listen: false)
        .loadDisease()
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doenças'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const DiseaseCard(),
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
