import 'package:flutter/material.dart';
import 'package:signcentral/widgets/illustration_widget.dart';
import 'package:signcentral/screens/welcomescreen2.dart';

// ==================== CORES ====================
class AppColors {
  static const Color primaryBlue = Color(0xFF007AFF);
  static const Color textDark = Color(0xFF1C1C1E);
}

// ==================== TELA ====================
class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String? selectedLevel;

  Future<void> _handleSelection(String level) async {
    setState(() {
      selectedLevel = level;
    });

    // espera 300 ms com a opção azul clara antes de navegar
    await Future.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: 'Inter',
      primaryColor: AppColors.primaryBlue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textDark),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: AppColors.textDark,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.textDark,
        ),
      ),
    );

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.dark_mode_outlined),
              onPressed: () {},
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Como você avalia seu \nconhecimento em Libras?',
                style: theme.textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              IllustrationWidget(
                illustrationName: 'illustration_4',
                height: MediaQuery.of(context).size.height * 0.32,
              ),
              const SizedBox(height: 16),
              _OptionButton(
                text: 'Iniciante',
                isSelected: selectedLevel == 'Iniciante',
                onTap: () => _handleSelection('Iniciante'),
              ),
              const SizedBox(height: 12),
              _OptionButton(
                text: 'Básico',
                isSelected: selectedLevel == 'Básico',
                onTap: () => _handleSelection('Básico'),
              ),
              const SizedBox(height: 12),
              _OptionButton(
                text: 'Intermediário',
                isSelected: selectedLevel == 'Intermediário',
                onTap: () => _handleSelection('Intermediário'),
              ),
              const SizedBox(height: 12),
              _OptionButton(
                text: 'Avançado',
                isSelected: selectedLevel == 'Avançado',
                onTap: () => _handleSelection('Avançado'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== BOTÃO ====================
class _OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _OptionButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // clique (touch ou mouse)
      onTap: onTap,
      // hover (só web/desktop)
      onHover: (hovering) {
        // se quiser, pode tratar hover aqui com um callback extra
      },
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryBlue.withOpacity(0.12)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryBlue
                : const Color.fromARGB(255, 124, 187, 255),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Icon(
              Icons.arrow_forward,
              color: AppColors.primaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}
