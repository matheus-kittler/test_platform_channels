class CepEntity {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade; // Cidade
  final String uf; // Estado

  const CepEntity({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });
}