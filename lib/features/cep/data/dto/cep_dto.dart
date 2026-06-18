import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:via_cep_app/features/cep/domain/entity/cep_entity.dart';

part 'cep_dto.freezed.dart';
part 'cep_dto.g.dart';

// Passamos as configurações de serialização diretamente no decorator do Freezed.
// Isso diz ao gerador para aplicar as regras na classe gerada automaticamente.
@Freezed(fromJson: true, toJson: true)
class CepDto with _$CepDto {
  const CepDto._();

  // Deixamos a factory limpa. Sem nenhuma anotação em cima dela, o linter não reclama!
  const factory CepDto({
    required String? cep,
    required String? logradouro,
    required String? complemento,
    required String? bairro,
    required String? localidade,
    required String? uf,
    dynamic erro,
  }) = _CepDto;

  factory CepDto.fromJson(Map<String, dynamic> json) => _$CepDtoFromJson(json);
}

extension CepDtoMapper on CepDto {
  CepEntity toEntity() {
    return CepEntity(
      cep: cep ?? '',
      logradouro: logradouro ?? '',
      complemento: complemento ?? '',
      bairro: bairro ?? '',
      localidade: localidade ?? '',
      uf: uf ?? '',
    );
  }
}