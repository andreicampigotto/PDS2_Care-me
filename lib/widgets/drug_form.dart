import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/drug_list.dart';

class DrugForm extends StatefulWidget {
  const DrugForm({super.key});

  @override
  State<DrugForm> createState() => _DrugFormState();
}

class _DrugFormState extends State<DrugForm> {
  final _name = TextEditingController();
  final _description = TextEditingController();
  bool _isContinuos = false;
  DateTime _actualDate = DateTime.now();
  bool _active = true;

  final _descriptionFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  Future<void> _submitForm() async {
    final name = _name.text;
    final description = _description.text;
    final isContinuos = _isContinuos;

    if (name.isEmpty || description.isEmpty) {
      return;
    }

    _formKey.currentState?.save();

    try {
      await Provider.of<DrugList>(
        context,
        listen: false,
      ).saveDrugFromData(_formData);
    } catch (error) {
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Ops, Error!'),
          content: const Text('Ocorreu um error ao salvar alergia!'),
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
    bool isContinuos = false;
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
                  "Adicionar medicamento",
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
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                left: 16.0,
                right: 8.0,
                bottom: 8.0 + mediaQuery.viewInsets.bottom,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                    validator: (_name) {
                      final name = _name ?? '';
                      if (name.trim().isEmpty) {
                        return 'Nome obrigatório';
                      }

                      if (name.trim().length < 2) {
                        return 'Nome precisa ter no minimo 2 letras';
                      }

                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_descriptionFocus);
                    },
                    onSaved: (name) => _formData['name'] = name ?? '',
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    focusNode: _descriptionFocus,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    onSaved: (description) =>
                        _formData['description'] = description ?? '',
                    validator: (_description) {
                      final description = _description ?? '';
                      if (description.trim().isEmpty) {
                        return 'Descriçāo obrigatória';
                      }

                      if (description.trim().length < 10) {
                        return 'Nome precisa ter no minimo 10 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Switch(
                        value: isContinuos,
                        onChanged: (_isContinuos) {
                          setState(() {
                            isContinuos = _isContinuos;
                          });
                        },
                      ),
                      SizedBox(
                        width: 175.0,
                        child: ElevatedButton(
                          child: Text('Salvar'),
                          onPressed: _submitForm,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
