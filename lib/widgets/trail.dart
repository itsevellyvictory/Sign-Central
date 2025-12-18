import 'package:flutter/material.dart';

class Trail {
  final String id;
  final String title;
  final Color color;
  final String imagePath;

  Trail({
    required this.id,
    required this.title,
    required this.color,
    required this.imagePath,
  });
}

class TrailCard extends StatelessWidget {
  final Trail trail;
  final VoidCallback onTap;

  const TrailCard({
    super.key,
    required this.trail,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: trail.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trilha ${trail.id}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    trail.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 4),
                 
                ],
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              height: 90,
              width: 90,
              child: Image.asset(
                trail.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
