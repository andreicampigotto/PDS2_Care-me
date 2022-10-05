import 'package:flutter/material.dart';

import '../components/adaptative_button.dart';
import '../components/adaptative_text_field.dart';

class DefaultForm extends StatefulWidget {
  final void Function(String, String, DateTime) onSubmit;

  const DefaultForm(this.onSubmit, {super.key});

  @override
  State<DefaultForm> createState() => _DefaultFormState();
}

class _DefaultFormState extends State<DefaultForm> {
  final _name = TextEditingController();
  final _description = TextEditingController();
  DateTime _actualDate = DateTime.now();

  _submitForm() {
    final name = _name.text;
    final description = _description.text;

    if (name.isEmpty || description.isEmpty) {
      return;
    }

    widget.onSubmit(name, description, _actualDate);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
            bottom: 8.0 + mediaQuery.viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _name,
                label: 'Nome',
              ),
              AdaptativeTextField(
                controller: _description,
                label: 'Descrição',
                onSubmitted: (_) => _submitForm(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    label: 'Adicionar Transação',
                    onPressed: _submitForm,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
