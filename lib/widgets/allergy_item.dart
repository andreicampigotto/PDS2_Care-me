import 'package:care/models/allergy_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/allergy.dart';
import 'package:intl/intl.dart';

class AllergyItem extends StatefulWidget {
  final Allergy allergy;
  const AllergyItem({required this.allergy, super.key});

  @override
  State<AllergyItem> createState() => _AllergyWidgetState();
}

class _AllergyWidgetState extends State<AllergyItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  DateFormat('dd/MM/yyyy').format(widget.allergy.date),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text('Alergia'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    widget.allergy.name,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text('Descrição'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    overflow: TextOverflow.clip,
                    widget.allergy.description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
