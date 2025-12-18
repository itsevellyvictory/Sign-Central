import 'package:flutter/material.dart';

class TeacherCard extends StatelessWidget {
  final String name;
  final String institution;
  final String imagePath; // caminho do asset

  const TeacherCard({
    super.key,
    required this.name,
    required this.institution,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                imagePath,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F3A4B),
                fontFamily: 'Inter',

              ),
            ),
            const SizedBox(height: 2),
            Text(
              institution,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF9CA3AF),
                fontFamily: 'Inter',

              ),
            ),
          ],
        ),
      ),
    );
  }
}
