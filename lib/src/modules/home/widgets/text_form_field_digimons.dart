import 'package:flutter/material.dart';

class TextFormFieldDigimons extends StatelessWidget {
  const TextFormFieldDigimons({Key? key, this.onChanged}) : super(key: key);

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: TextFormField(
        style: const TextStyle(color: Colors.blue),
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: 'Procure o Digimon aqui!',
            hintStyle: const TextStyle(color: Colors.blue),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12)),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
