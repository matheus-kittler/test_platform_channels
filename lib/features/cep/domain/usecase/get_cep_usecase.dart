import 'package:via_cep_app/features/cep/domain/entity/cep_entity.dart';
import 'package:via_cep_app/features/cep/domain/repository/cep_repository.dart';

class GetCepUseCase {
  final CepRepository _repository;

  const GetCepUseCase(this._repository);

  Future<CepEntity> execute(String cep) async {
    // Aqui você limpa qualquer máscara antes de mandar para o repositório
    final cleanCep = cep.replaceAll(RegExp(r'[^0-9]'), '');
    return await _repository.getCep(cleanCep);
  }
}