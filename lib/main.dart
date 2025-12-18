import 'package:flutter/material.dart';
import 'package:signcentral/screens/course_screens/menu.dart';

// 1) Primeira tela: WelcomeScreenWithImages
import 'package:signcentral/screens/welcomescreen2.dart'; // class WelcomeScreenWithImages

// Demais telas
import 'package:signcentral/screens/sign_central_screen.dart';
import 'package:signcentral/screens/cadastro_screen.dart';
import 'package:signcentral/screens/test_screen.dart';
import 'package:signcentral/screens/welcome_screen_with_images.dart'; // class WelcomeScreen
import 'package:signcentral/screens/course_screens/menu.dart';
import 'package:signcentral/screens/course_screens/trilhas_curso_1.dart';
import 'package:signcentral/screens/course_screens/load_trail.dart';
import 'package:signcentral/screens/course_screens/class_trail_1.dart';
import 'package:signcentral/screens/tela1.dart' hide WelcomeScreenWithImages;
import 'package:signcentral/screens/tela2.dart' hide SignCentralScreen;
import 'package:signcentral/screens/tela3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/welcome_images',

      routes: {
        // 1) WelcomeScreenWithImages
        '/welcome_images': (context) => const WelcomeScreenWithImages(),

        // 2) SignCentral
        '/signcentral': (context) => const SignCentralScreen(),

        // 3) Login
        '/cad': (context) => const CadastroScreen(),

        // 4) Teste
        '/test': (context) => const TestScreen(),

        // 5) Última tela: WelcomeScreen
        '/welcome': (context) => const WelcomeScreen(),
        '/menu': (context) => const MenuScreen(),
      },
    );
  }
}
