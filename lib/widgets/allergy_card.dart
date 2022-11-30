import 'package:care/models/allergy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllergyCard extends StatelessWidget {
  const AllergyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final allergy = Provider.of<Allergy>(
      context,
      listen: false,
    );
    return ClipRRect(
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
                textDirection: TextDirection.ltr,
                children: [
                  Text(
                    allergy.date.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  const Text('Alergia'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  Flexible(
                    child: Text(
                      allergy.name,
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
                textDirection: TextDirection.ltr,
                children: [
                  const Text('Descrição'),
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
                      allergy.description,
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
