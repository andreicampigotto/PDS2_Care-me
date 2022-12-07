import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/allergy_list.dart';
import '../widgets/allergy_card.dart';
import '../widgets/allergy_form.dart';

class AllergiesScreen extends StatefulWidget {
  const AllergiesScreen({super.key});

  @override
  State<AllergiesScreen> createState() => _AllergiesScreenState();
}

class _AllergiesScreenState extends State<AllergiesScreen> {
  bool _isLoading = true;

  _openTransActionFormModal(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) => const AllergyForm());
  }

  @override
  void initState() {
    super.initState();
    Provider.of<AllergyList>(context, listen: false)
        .loadAllergy()
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
        title: const Text('Alergias'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const AllergyCard(),
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
