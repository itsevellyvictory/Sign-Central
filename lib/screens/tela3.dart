import 'package:flutter/material.dart';
// Certifique-se de que o caminho de importação está correto
import 'package:signcentral/widgets/illustration_widget.dart';

class Tela3Stateful extends StatefulWidget {
  const Tela3Stateful({super.key});

  @override
  State<Tela3Stateful> createState() => _Tela3StatefulState();
}

class _Tela3StatefulState extends State<Tela3Stateful> {
  // Chave global para identificar o Form e habilitar a validação
  final _formKey = GlobalKey<FormState>();

  // Controller para acessar o valor do TextFormField
  final TextEditingController _usernameController = TextEditingController();

  // Define o esquema de cores (mantido)
  final Color primaryColor = Colors.blue.shade700;

  @override
  void dispose() {
    // É crucial descartar (dispose) os controllers para liberar memória
    _usernameController.dispose();
    super.dispose();
  }

  void _continueAction() {
    // Tenta validar todos os campos do Form
    if (_formKey.currentState!.validate()) {
      // Se a validação for bem-sucedida
      final username = _usernameController.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nome de Usuário válido: $username')),
      );
      // Aqui você navegaria para a próxima tela
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProximaTela()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode_outlined, color: Colors.black),
            onPressed: () {
              // Lógica para alternar tema
            },
          ),
        ],
      ),

      // Envolve o conteúdo principal em um Form com a chave
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // 1. Ilustração (Reutilizada)
              const IllustrationWidget(
                illustrationName: 'illustration_2',
                height: 250,
              ),

              const SizedBox(height: 50),

              // 2. Campo de Texto (Nome de Usuário)
              const Text(
                'Nome de Usuário',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: _usernameController, // Atribui o controller
                decoration: InputDecoration(
                  hintText: 'username001',
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  // Estilos de borda mantidos
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                keyboardType: TextInputType.text,

                // Função de validação
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome de usuário.';
                  }
                  if (value.length < 4) {
                    return 'O nome de usuário deve ter pelo menos 4 caracteres.';
                  }
                  // Se for válido, retorna null
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // 3. Botão "Continuar"
              ElevatedButton(
                onPressed: _continueAction, // Chama a função de ação
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
