class Evento {
  final String titulo;
  final String descricao;
  final DateTime data;
  final bool dark;
  final bool alto;

  Evento({
    required this.titulo,
    required this.descricao,
    required this.data,
    this.dark = false,
    this.alto = false,
  });
}
