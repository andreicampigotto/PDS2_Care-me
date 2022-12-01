import 'package:care/models/drug_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/drug.dart';
import 'package:intl/intl.dart';

class DrugItem extends StatelessWidget {
  final Drug drug;

  const DrugItem({
    required this.drug,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(drug.drugId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(
          right: 16,
        ),
        margin: const EdgeInsets.only(
          top: 8,
          bottom: 0,
          right: 16,
        ),
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white70,
          size: 40,
        ),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text('Tem certeza?'),
                  content: const Text('Deseja remover o medicamento?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text('Nāo'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('Sim'),
                    ),
                  ],
                ));
      },
      onDismissed: (_) {
        Provider.of<DrugList>(context, listen: false).removeItem(drug.drugId);
      },
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
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
                    DateFormat('dd/MM/yyyy').format(drug.date),
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
                  Text('Medicamento'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      drug.name,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
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
                      drug.description,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
