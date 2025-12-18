import 'package:flutter/material.dart';
import 'package:signcentral/widgets/illustration_widget.dart';
import 'package:signcentral/screens/course_screens/menu.dart';
import 'package:signcentral/widgets/button.dart';

// ==================== CORES ====================
class AppColors {
  static const Color primaryBlue = Color(0xFF007AFF);
  static const Color textDark = Color(0xFF1C1C1E);
  static const Color textGray = Color(0xFF6E6E73);
}

// ==================== TELA ====================
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ==================== APP BAR ====================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.dark_mode_outlined,
              color: AppColors.textDark,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 20),
        ],
      ),

      // ==================== CORPO ====================
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),

            // ==================== ILUSTRAÇÃO (CENTRALIZADA) ====================
            Center(
              child: IllustrationWidget(
                illustrationName: 'illustration_5',
                height: MediaQuery.of(context).size.height * 0.42,
              ),
            ),

            const SizedBox(height: 24),

            // ==================== TÍTULO ====================
            const Text(
              'Bem vindo(a) à\nsua jornada!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 8),

            // ==================== SUBTÍTULO ====================
            const Text(
              'Comunique-se sem barreiras.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w400,
                color: AppColors.textGray,
                height: 1.3,
              ),
            ),

            const SizedBox(height: 38),

               Button(
              title: 'Continuar',
             onPressed: () {
                  Navigator.pushNamed(context, '/menu');
                },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
