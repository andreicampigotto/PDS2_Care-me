import 'package:care/models/appointment_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_routes.dart';

class NewAppointmentScreen extends StatefulWidget {
  const NewAppointmentScreen({super.key});

  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  final _weightFocus = FocusNode();
  final _bloodPressureFocus = FocusNode();
  final _commentsFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    _formKey.currentState?.save();

    try {
      await Provider.of<AppointmentList>(
        context,
        listen: false,
      ).saveApointmentFromData(_formData);
    } catch (error) {
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Ops, Error!'),
          content: const Text('Ocorreu error ao salvar sua consulta!'),
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
    _weightFocus.dispose();
    _bloodPressureFocus.dispose();
    _commentsFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova consulta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Card(
              margin: const EdgeInsets.only(left: 16, right: 16),
              elevation: 8,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: const Text(
                        'Como foi sua consulta?',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                      ),
                      child: TextFormField(
                        initialValue: _formData['doctor']?.toString(),
                        decoration: const InputDecoration(
                          labelText: 'M??dico',
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_weightFocus);
                        },
                        onSaved: (doctor) => _formData['doctor'] = doctor ?? '',
                        validator: (_doctor) {
                          final doctor = _doctor ?? '';
                          if (doctor.trim().isEmpty) {
                            return 'M??dico obrigat??rio';
                          }

                          if (doctor.trim().length < 4) {
                            return 'M??dico precisa ter no minimo 4 letras';
                          }

                          return null;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 155,
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 16,
                          ),
                          child: TextFormField(
                            initialValue: _formData['weight']?.toString(),
                            decoration: const InputDecoration(
                              labelText: 'Peso',
                              border: OutlineInputBorder(),
                            ),
                            focusNode: _weightFocus,
                            textInputAction: TextInputAction.next,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_bloodPressureFocus);
                            },
                            onSaved: (weight) => _formData['weight'] =
                                double.parse(weight ?? '0'),
                            validator: (_weight) {
                              final weightString = _weight ?? '';
                              final weight =
                                  double.tryParse(weightString) ?? -1;

                              if (weightString.trim().isEmpty) {
                                return 'Peso obrigat??rio';
                              }

                              if (weight <= 0) {
                                return 'Informe um peso valido';
                              }

                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: 155,
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                          ),
                          child: TextFormField(
                            initialValue:
                                _formData['bloodPressure']?.toString(),
                            decoration: const InputDecoration(
                              labelText: 'Press??o arterial',
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_weightFocus);
                            },
                            onSaved: (bloodPressure) =>
                                _formData['bloodPressure'] =
                                    bloodPressure ?? '',
                            validator: (_bloodPressure) {
                              final bloodPressure = _bloodPressure ?? '';
                              if (bloodPressure.trim().isEmpty) {
                                return 'Press??o arterial obrigat??rio';
                              }
                              if (bloodPressure.trim().length < 3) {
                                return 'Press??o arterial precisa ter no minimo 3 caracteres';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                      ),
                      child: TextFormField(
                        initialValue: _formData['comments']?.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Comet??rios',
                          border: OutlineInputBorder(),
                        ),
                        focusNode: _commentsFocus,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        onSaved: (comments) =>
                            _formData['comments'] = comments ?? '',
                        validator: (_comments) {
                          final comments = _comments ?? '';
                          if (comments.trim().isEmpty) {
                            return 'Coment??rio obrigat??ria';
                          }

                          if (comments.trim().length < 10) {
                            return 'Coment??rio precisa ter no minimo 10 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed(AppRoutes.DRUGS),
                          child: const Text('Medica????o'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(AppRoutes.DISEASES),
                          child: const Text('Doen??a'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(AppRoutes.ALLERGIES),
                          child: const Text('Alergia'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 175.0,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text('Salvar'),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
