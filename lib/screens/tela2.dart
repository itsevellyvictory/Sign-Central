import 'package:flutter/material.dart';
import 'package:signcentral/widgets/button.dart';

// --- TELA SIGNCENTRAL (O WIDGET PRINCIPAL) ---
class SignCentralScreen extends StatelessWidget {
  const SignCentralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definindo a cor principal azul, baseada na logo e botões
    const Color primaryBlue = Color(0xFF1E88E5);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Ação de voltar (vazia no front-end puro)
          },
        ),
        actions: [
          IconButton(
            // Ícone da lua no canto superior direito
            icon: const Icon(Icons.dark_mode_outlined, color: Colors.black),
            onPressed: () {
              // Ação do modo escuro (vazia no front-end puro)
            },
          ),
        ],
      ),
      // Corpo da tela - centralizando o conteúdo com Padding
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          // Alinhamento principal do conteúdo no centro da coluna
          mainAxisAlignment: MainAxisAlignment.center,
          // Alinhamento horizontal para esticar o conteúdo
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 1. LOGO (USANDO A IMAGEM DE ASSET)
            Center(
              child: Image.asset(
                'assets/logo_sign_central.png', // Caminho do seu arquivo de imagem
                height: 150, // Ajuste a altura conforme necessário
                // Ajuste a largura ou deixe o BoxFit para o tamanho natural
              ),
            ),

            const SizedBox(height: 5),

            // 2. MENSAGEM DE BOAS-VINDAS
            const Text(
              'Dê o primeiro passo na\n sua jornada em Libras',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.3,
                color: kDarkText,
              ),
            ),

            const SizedBox(height: 30),

            // 3. CAMPO DE EMAIL (TextField)
            const Text(
              'Email',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            // Input decorado
            TextFormField(
              decoration: InputDecoration(
                hintText: 'user@gmail.com',
                // Borda arredondada
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                // Borda quando focado
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: primaryBlue, width: 2.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 16),

            Button(title: 'Continuar'),

            const SizedBox(height: 24),

            // 5. DIVISOR "ou"
            Row(
              children: const <Widget>[
                // Linha à esquerda
                Expanded(child: Divider(color: Colors.grey)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('ou', style: TextStyle(color: Colors.grey)),
                ),
                // Linha à direita
                Expanded(child: Divider(color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 24),

            // 6. BOTÃO CADASTRAR COM GOOGLE (SEM ÍCONE, USANDO TEXTO)
            OutlinedButton(
              onPressed: () {
                // Ação de cadastro com Google (vazia no front-end puro)
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.white,
                // A cor do texto dentro do botão
                foregroundColor: Colors.black87,
                // Borda cinza/clara
                side: const BorderSide(color: Colors.black26, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // Placeholder para o ícone do Google (removido para manter apenas o texto)
                  Text(
                    'Cadastrar com Google',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 7. TERMOS E POLÍTICA DE PRIVACIDADE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text.rich(
                TextSpan(
                  text: 'Ao continuar, você concorda com nossos ',
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Termos e Política de Privacidade.',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 64),

            // 8. LINK "JÁ TEM UMA CONTA? FAÇA LOGIN"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Já tem uma conta? ',
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    // Ação de login (vazia no front-end puro)
                  },
                  child: Text(
                    'Faça Login',
                    style: TextStyle(
                      color: primaryBlue, // Cor do link azul
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: primaryBlue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
