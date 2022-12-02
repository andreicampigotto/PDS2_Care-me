import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/appointment.dart';

class AppointmentItem extends StatefulWidget {
  final Appointment? appointment;
  const AppointmentItem({this.appointment, super.key});

  @override
  State<AppointmentItem> createState() => _AppointmentItemState();
}

class _AppointmentItemState extends State<AppointmentItem> {
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.appointment!.doctor,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(widget.appointment!.date),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 8),
              Text(
                "Pressão arterial: ${widget.appointment!.bloodPressure}",
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              Text(
                "Peso: ${widget.appointment!.weight.toString()}",
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text('Comentarios'),
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
                    widget.appointment!.comments,
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
