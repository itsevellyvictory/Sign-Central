import 'package:flutter/material.dart';
import 'package:signcentral/screens/course_screens/load_trail.dart';
import 'package:signcentral/widgets/trail.dart';

class Course1TrailsScreen extends StatelessWidget {
  const Course1TrailsScreen({super.key});

  // Lista de trilhas
  static final List<Trail> _trails = [
    Trail(
      id: '01',
      title: 'Introdução à LIBRAS',
      color: const Color.fromARGB(255, 170, 197, 255),
      imagePath: 'assets/png/trilha_01.png',
    ),
    Trail(
      id: '02',
      title: 'Comunicação Básica',
      color: const Color.fromARGB(255, 40, 98, 223),
      imagePath: 'assets/png/trilha_02.png',
    ),
    Trail(
      id: '03',
      title: 'Vocabulário Essencial',
      color: const Color.fromARGB(255, 20, 23, 182),
      imagePath: 'assets/png/trilha_03.png',
    ),
    Trail(
      id: '04',
      title: 'Conversação',
      color: const Color.fromARGB(255, 0, 45, 119),
      imagePath: 'assets/png/trilha_04.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Se quiser algo aqui, por exemplo:
        //title: const Text('Trilhas do Curso \nde Introdução à Libras.'),
        //centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 24),

          // ==================== TÍTULO ====================
          const Text(
            'Trilhas do Curso de \nIntrodução à Libras.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 24),

          // Lista de trilhas
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _trails.length,
            itemBuilder: (context, index) {
              final trail = _trails[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TrailCard(
                  trail: trail,
                  onTap: () {
                    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => LoadTrailScreen(trail: trail),
    ),
  ); 

                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
