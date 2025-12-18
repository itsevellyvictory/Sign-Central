import 'package:flutter/material.dart';
import 'package:signcentral/screens/course_screens/trilhas_curso_1.dart';

/// ----------------- HEADER EM GRADIENTE -----------------
class MenuHeader extends StatelessWidget {
  final String shortName;

  const MenuHeader({super.key, required this.shortName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0D47A1), Color(0xFF42A5F5)],
          stops: [0.0, 1.0],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              'Olá, $shortName',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Vamos começar os estudos!',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

/// ----------------- CARD DO PROFESSOR -----------------
class TeacherCard extends StatelessWidget {
  final String name;
  final String institution;
  final String imagePath;

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
              ),
            ),
            const SizedBox(height: 2),
            Text(
              institution,
              style: const TextStyle(fontSize: 14, color: Color(0xFF9CA3AF)),
            ),
          ],
        ),
      ),
    );
  }
}

/// ----------------- MODEL DO CURSO -----------------
class Course {
  final String title;
  final double rating;
  final int reviews;
  final String teacherName;
  final String description;
  final String imagePath;

  Course({
    required this.title,
    required this.rating,
    required this.reviews,
    required this.teacherName,
    required this.description,
    required this.imagePath,
  });
}

/// ----------------- CARD DO CURSO -----------------
class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;
  final bool isEnrolled;

  const CourseCard({
    super.key,
    required this.course,
    required this.onTap,
    this.isEnrolled = false,
  });

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
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: 130,
              height: 110,
              color: const Color(0xFF2979FF),
              child: Image.asset(course.imagePath, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
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
                        fontFamily: 'Inter',
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
                        color: isEnrolled
                            ? const Color(0xFF9CA3AF) // cinza matriculado
                            : const Color(0xFF16C165), // verde matrícula
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        isEnrolled ? 'Matriculado' : 'Faça sua matrícula',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
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

/// ----------------- BOTTOM NAV BAR -----------------
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const inactiveColor = Color(0xFF4B5563);
    const activeColor = Color(0xFFFFA000);

    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomNavItem(
            icon: Icons.home_rounded,
            index: 0,
            currentIndex: currentIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            onTap: onTap,
          ),
          _BottomNavItem(
            icon: Icons.menu_book_rounded,
            index: 1,
            currentIndex: currentIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            onTap: onTap,
          ),
          _BottomNavItem(
            icon: Icons.article_rounded,
            index: 2,
            currentIndex: currentIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            onTap: onTap,
          ),
          _BottomNavItem(
            icon: Icons.person_rounded,
            index: 3,
            currentIndex: currentIndex,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<int> onTap;

  const _BottomNavItem({
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == currentIndex;
    final color = isActive ? activeColor : inactiveColor;

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Icon(icon, color: color, size: 26),
      ),
    );
  }
}

/// ----------------- TELA DO MENU -----------------
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;
  bool _isCourse1Enrolled = false;

  @override
  Widget build(BuildContext context) {
    final String shortName =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'Estudante';

    final List<Map<String, String>> teachers = [
      {
        'name': 'Evelly Victory',
        'inst': 'Harvard',
        'img': 'assets/png/evy.png',
      },
      {'name': 'Luis Fernando', 'inst': 'IFMA', 'img': 'assets/png/lulu.png'},
      {'name': 'Josenildo', 'inst': 'IFMA', 'img': 'assets/png/josenildo.png'},
      {'name': 'Clesivane', 'inst': 'USP', 'img': 'assets/png/clesivane.png'},
    ];

    final List<Course> courses = [
      Course(
        title: 'Introdução à LIBRAS',
        rating: 4.5,
        reviews: 413,
        teacherName: 'Clesivane',
        description: 'Aprenda os sinais básicos e os fundamentos da LIBRAS.',
        imagePath: 'assets/png/curso1.png',
      ),
      Course(
        title: 'LIBRAS na Educação',
        rating: 5.0,
        reviews: 900,
        teacherName: 'Evelly Victory',
        description:
            'Estratégias rápidas para aplicar LIBRAS no ambiente escolar.',
        imagePath: 'assets/png/curso2.png',
      ),
      Course(
        title: 'Tecnologia & Libras',
        rating: 5.0,
        reviews: 900,
        teacherName: 'Luis Fernando',
        description: 'Estratégias de acessibilidade e inclusão na área de T.I.',
        imagePath: 'assets/png/curso3.png',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          MenuHeader(shortName: shortName),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Conheça os professores da Sign Central',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 260,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: teachers.length,
                      itemBuilder: (context, index) {
                        final t = teachers[index];
                        return TeacherCard(
                          name: t['name']!,
                          institution: t['inst']!,
                          imagePath: t['img']!,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Cursos disponíveis',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      final course = courses[index];
                      final bool isCourse1 =
                          course.title == 'Introdução à LIBRAS';

                      return CourseCard(
                        course: course,
                        isEnrolled: isCourse1 && _isCourse1Enrolled,
                        onTap: () async {
                          if (isCourse1) {
                            final enrolled = await Navigator.push<bool>(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const Course1TrailsScreen(),
                              ),
                            );

                            if (enrolled == true) {
                              setState(() {
                                _isCourse1Enrolled = true;
                              });
                            }
                          } else {
                            // ações para outros cursos, se quiser
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
