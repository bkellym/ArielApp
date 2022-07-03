class UserModel {
  final String nome;
  final String email;
  final String foto;
  final String genero;
  final String dtNascimento;
  final String? historia;
  final String? dtUltAplicacao;

  UserModel({
    required this.nome,
    required this.email,
    required this.foto,
    required this.genero,
    required this.dtNascimento,
    this.historia,
    this.dtUltAplicacao,
  });
}
