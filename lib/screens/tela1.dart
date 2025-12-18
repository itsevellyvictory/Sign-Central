import 'package:flutter/material.dart';
import 'package:signcentral/widgets/button.dart';

// Definição das cores baseadas na imagem
const Color kPrimaryBlue = Color(0xFF3F6FFF);
const Color kDarkText = Color(0xFF1E1E1E);

class WelcomeScreenWithImages extends StatelessWidget {
  const WelcomeScreenWithImages({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Ícone de lua para modo noturno (simulação)
          IconButton(
            icon: const Icon(Icons.nights_stay_outlined, color: kDarkText),
            onPressed: () {
              // Ação para alternar tema
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // --- Logo (Substituído por Image.asset) ---
              Column(
                children: [
                  Image.asset(
                    'assets/logo_sign_central.png', // Seu arquivo da logo
                    height: 110, // Ajuste o tamanho conforme necessário
                  ),
                  const SizedBox(height: 1),
                ],
              ),
              //const SizedBox(height: 10),

              // --- Ilustração Principal (Substituído por Image.asset) ---
              // Usamos um ClipRRect para garantir que a imagem tenha bordas arredondadas,
              // simulando o layout da tela.
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/illustration_main.png', // Seu arquivo de ilustração principal
                  width: size.width * 0.85,
                  fit: BoxFit.cover, // Ajusta o tamanho da imagem
                ),
              ),

              const SizedBox(height: 20),

              // --- Texto de Chamada ---
              const Text(
                'Aprenda Libras,\nna palma da sua mão.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  color: kDarkText,
                ),
              ),

              const SizedBox(height: 20),

              // --- Botão Principal (Aprender agora) ---
              /*
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('Aprender agora pressionado');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Aprender agora',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              */
              Button(title: 'Aprender agora'),

              const SizedBox(height: 10),

              // --- Opção de Login ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Já tem uma conta? ',
                    style: TextStyle(fontSize: 16, color: kDarkText),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('Fazer Login pressionado');
                    },
                    child: const Text(
                      'Faça Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryBlue,
                        decoration: TextDecoration.underline,
                        decorationColor: kPrimaryBlue,
                      ),
                    ),
                  ),
                ],
              ),

              // Espaço para o "safe area" inferior
              const SizedBox(height: 1),
            ],
          ),
        ),
      ),
    );
  }
}
