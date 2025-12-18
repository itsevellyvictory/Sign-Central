import 'package:flutter/material.dart';

const Color kPrimaryBlue = Color(0xFF3F6FFF);
const Color kDarkText = Color(0xFF1E1E1E);

class Button extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed; // 🔥 <-- ADICIONADO

  const Button({
    super.key,
    required this.title,
    this.onPressed, // 🔥 <-- ADICIONADO
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed, // 🔥 <-- USANDO A FUNÇÃO RECEBIDA
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
