import 'package:flutter/material.dart';
import 'package:signcentral/screens/course_screens/menu.dart';

class CourseCard extends StatelessWidget {
  final Course course; // Ajuste: CourseCard → Course (ou o tipo do seu modelo)
  final VoidCallback onTap;

  const CourseCard({super.key, required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // bloco azul / imagem do curso
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: 130,
              height: 120,
              color: const Color(
                0xFF2979FF,
              ), // substitua por Image.asset se tiver arte
              // child: Image.asset(course.imagePath, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 12),
          // textos
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2933),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFFB300), size: 16),
                    const Icon(Icons.star, color: Color(0xFFFFB300), size: 16),
                    const Icon(Icons.star, color: Color(0xFFFFB300), size: 16),
                    const Icon(Icons.star, color: Color(0xFFFFB300), size: 16),
                    const Icon(
                      Icons.star_half,
                      color: Color(0xFFFFB300),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${course.rating.toStringAsFixed(1)} (${course.reviews})',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  'Professora ${course.teacherName}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    color: Color(0xFF1F2933),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  course.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Inter',
                    color: Color(0xFF4B5563),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFF003A1D,
                        ), // Cor corrigida: Color(0xFF003A1D)
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Text(
                        'Faça sua matrícula',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
