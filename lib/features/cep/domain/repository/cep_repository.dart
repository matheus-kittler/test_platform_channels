import '../entity/cep_entity.dart';

abstract class CepRepository {
  /// Busca um endereço a partir de um CEP formatado ou bruto.
  /// Lança uma exceção de domínio em caso de erro ou CEP não encontrado.
  Future<CepEntity> getCep(String cep);
}