import 'package:flutter/material.dart';

class UniversalTextField extends StatelessWidget {
  const UniversalTextField(
      {super.key,
      required this.label,
      required this.textEditingController,
      this.isNumber = false});

  final String label;
  final bool isNumber;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        controller: textEditingController,
        style: TextStyle(
            color: Colors.white.withOpacity(.6),
            fontSize: 18,
            fontWeight: FontWeight.w500),
        textAlign: TextAlign.end,
        cursorColor: Colors.orange,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white.withOpacity(.6)),
          prefixIcon: Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 11, bottom: 10, right: 15),
            child: Text(
              label,
              style: const TextStyle(
                  shadows: [Shadow(blurRadius: 5)],
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
          ),
          contentPadding: const EdgeInsets.only(right: 2),
          fillColor: Colors.grey.withOpacity(.8),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: Colors.grey),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: Colors.grey),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
