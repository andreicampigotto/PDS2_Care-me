import 'package:care/models/drug_list.dart';
import 'package:care/widgets/drug_card.dart';
import 'package:care/widgets/drug_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrugsScreen extends StatefulWidget {
  const DrugsScreen({super.key});

  @override
  State<DrugsScreen> createState() => _DrugsScreenState();
}

class _DrugsScreenState extends State<DrugsScreen> {
  bool _isLoading = true;

  _openTransActionFormModal(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) => DrugForm());
  }

  @override
  void initState() {
    super.initState();
    Provider.of<DrugList>(context, listen: false).loadDrug().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicametos'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const DrugCard(),
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
