import 'package:flutter/material.dart';

class LabelDigimonLevel extends StatelessWidget {
  const LabelDigimonLevel({Key? key, required this.color, required this.label})
      : super(key: key);

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 12),
      child: FittedBox(
        child: Container(
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(12)),
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
