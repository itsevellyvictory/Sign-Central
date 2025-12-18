import 'package:flutter/material.dart';
import 'package:signcentral/widgets/button.dart';
import 'package:url_launcher/url_launcher.dart'; // <--- novo

class Lesson {
  final String id;
  final String title;
  final String thumbnail; // caminho da imagem da capa
  bool watched;

  Lesson({
    required this.id,
    required this.title,
    required this.thumbnail,
    this.watched = false,
  });
}

class Trail01LessonsScreen extends StatefulWidget {
  const Trail01LessonsScreen({super.key});

  @override
  State<Trail01LessonsScreen> createState() => _Trail01LessonsScreenState();
}

class _Trail01LessonsScreenState extends State<Trail01LessonsScreen> {
  final List<Lesson> _lessons = [
    Lesson(
      id: '1',
      title: 'Aula 01 - Alfabeto',
      thumbnail: 'assets/png/lesson_01.png',
    ),
    Lesson(
      id: '2',
      title: 'Aula 02 - Apresentação',
      thumbnail: 'assets/png/lesson_02.png',
    ),
    Lesson(
      id: '3',
      title: 'Aula 03 - Tempo',
      thumbnail: 'assets/png/lesson_03.png',
    ),
    Lesson(
      id: '4',
      title: 'Aula 04 - Dias da Semana e Meses',
      thumbnail: 'assets/png/lesson_04.png',
    ),
    Lesson(
      id: '5',
      title: 'Aula 05 - Pessoas e Relacionamentos',
      thumbnail: 'assets/png/lesson_05.png',
    ),
  ];

  // porcentagem de aulas concluídas
  double get _progress {
    final watchedCount = _lessons.where((l) => l.watched).length;
    return watchedCount / _lessons.length;
  }

  bool get _allCompleted => _progress == 1.0;

  void _toggleWatched(Lesson lesson) {
    setState(() {
      lesson.watched = !lesson.watched;
    });
  }

  Future<void> _openLesson1Video() async {
    final Uri url = Uri.parse(
      'https://youtu.be/klfAggYnRrw?si=3hOVBB4WAWyrnW8Q',
    );

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      // opcional: mostrar um snackbar de erro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Não foi possível abrir o vídeo.'),
        ),
      );
    }
  }

  Future<void> _onLessonTap(Lesson lesson, int index) async {
    if (lesson.id == '1') {
      // Aula 01 abre o vídeo no YouTube
      await _openLesson1Video(); // abre app/navegador YouTube [web:138][web:150]
      _toggleWatched(lesson);    // marca como assistida (pode mudar essa lógica depois)
    } else {
      // por enquanto, só alterna o estado das outras aulas
      _toggleWatched(lesson);
    }
  }

  @override
  Widget build(BuildContext context) {
    final progressPercent = (_progress * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trilha 01: Introdução à Libras',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Barra de progresso azul no topo
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$progressPercent% concluído',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: _progress,                // 0.0 a 1.0
                    minHeight: 8,
                    color: const Color(0xFF2563EB), // azul
                    backgroundColor: const Color(0xFFE5E7EB),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Lista de "vídeos" de aula estilo Netflix
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _lessons.length,
              itemBuilder: (context, index) {
                final lesson = _lessons[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () => _onLessonTap(lesson, index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // capa do "vídeo" com ícone de play por cima (estilo Netflix)
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  lesson.thumbnail,
                                  width: 110,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 12),

                          // título e status
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lesson.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  lesson.watched
                                      ? 'Concluída'
                                      : 'Toque para assistir',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: lesson.watched
                                        ? Colors.green
                                        : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8),

                          // ícone de check se concluída
                          Icon(
                            lesson.watched
                                ? Icons.check_circle_rounded
                                : Icons.radio_button_unchecked,
                            color: lesson.watched
                                ? Colors.green
                                : Colors.grey[400],
                          ),

                          const SizedBox(width: 12),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Botão "Finalizar Trilha" bloqueado/enabled conforme progresso
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
            child: Button(
              title: 'Finalizar Trilha',
              onPressed: _allCompleted
                  ? () {
                      // usuário concluiu todas as aulas + atividades
                      // aqui você pode salvar no backend, mostrar diálogo, etc.
                    }
                  : null, // desabilita enquanto não completar tudo
            ),
          ),
        ],
      ),
    );
  }
}
