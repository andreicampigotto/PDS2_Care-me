import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/allergy_list.dart';

class AllergyForm extends StatefulWidget {
  const AllergyForm({super.key});

  @override
  State<AllergyForm> createState() => _AllergyFormState();
}

class _AllergyFormState extends State<AllergyForm> {
  final _descriptionFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    _formKey.currentState?.save();

    try {
      await Provider.of<AllergyList>(
        context,
        listen: false,
      ).saveAllergyFromData(_formData);
    } catch (error) {
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Ops, Error!'),
          content: const Text('Ocorreu error ao salvar alergia!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok!'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  top: 16,
                  left: 16,
                ),
                child: Text(
                  "Adicionar alergia",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          Card(
            margin: const EdgeInsets.only(
              top: 8,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 8.0,
                bottom: 8.0 + mediaQuery.viewInsets.bottom,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: _formData['name']?.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_descriptionFocus);
                      },
                      onSaved: (name) => _formData['name'] = name ?? '',
                      validator: (_name) {
                        final name = _name ?? '';
                        if (name.trim().isEmpty) {
                          return 'Nome obrigat??rio';
                        }

                        if (name.trim().length < 2) {
                          return 'Nome precisa ter no minimo 2 letras';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _formData['description']?.toString(),
                      decoration: const InputDecoration(labelText: 'Descri????o'),
                      focusNode: _descriptionFocus,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      textInputAction: TextInputAction.next,
                      onSaved: (description) =>
                          _formData['description'] = description ?? '',
                      validator: (_description) {
                        final description = _description ?? '';
                        if (description.trim().isEmpty) {
                          return 'Descri????o obrigat??ria';
                        }

                        if (description.trim().length < 10) {
                          return 'Descri????o precisa ter no minimo 10 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 175.0,
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            child: const Text('Salvar'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
