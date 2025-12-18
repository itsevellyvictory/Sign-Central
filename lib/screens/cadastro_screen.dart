import 'package:flutter/material.dart';
import 'package:signcentral/widgets/button.dart';
import 'package:signcentral/widgets/illustration_widget.dart';

// Função utilitária: pega apenas os dois primeiros nomes
String getFirstTwoNames(String fullName) {
  final parts = fullName.trim().split(RegExp(r'\s+'));
  if (parts.isEmpty) return '';
  if (parts.length == 1) return parts.first;
  return '${parts[0]} ${parts[1]}';
}

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  // Chave para o formulário
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controladores para os campos de texto
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Estado para controlar a visibilidade da senha
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onContinuePressed() {
    if (_formKey.currentState!.validate()) {
      final String fullName = _fullNameController.text;
      final String username = _usernameController.text;
      final String password = _passwordController.text;

      // Nome abreviado (dois primeiros nomes) para usar na próxima tela
      final String shortName = getFirstTwoNames(fullName);

      debugPrint('Nome Completo: $fullName');
      debugPrint('Nome Abreviado: $shortName');
      debugPrint('Nome de Usuário: $username');
      debugPrint('Senha: $password');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Dados validados!')),
      );

      // Próxima tela no fluxo: ajuste a rota se necessário
      Navigator.pushReplacementNamed(
        context,
        '/test', // ou '/signcentral'
        arguments: shortName, // passa "Evelly Maria", por exemplo
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar com botão de voltar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Ilustração usando IllustrationWidget
              const IllustrationWidget(
                illustrationName: 'illustration_2',
                height: 500, // ajuste conforme necessário
              ),
              const SizedBox(height: 10.0),

              // --- Campo Nome Completo ---
              Text(
                'Nome Completo',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  hintText: 'Insira seu nome completo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome completo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),

              // --- Campo Nome de Usuário ---
              Text(
                'Nome de Usuário',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'username001',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome de usuário';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),

              // --- Campo Senha ---
              Text(
                'Senha',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Insira sua senha',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 12.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'A senha deve conter no mínimo 8 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),

              Button(
                title: 'Continuar',
                onPressed: _onContinuePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
