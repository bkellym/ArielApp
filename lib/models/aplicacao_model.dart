class AplicacaoModel {
  final String cicloId;
  final String data;
  final bool feito;

  AplicacaoModel({
    required this.cicloId,
    required this.data,
    this.feito = false,
  });
}
