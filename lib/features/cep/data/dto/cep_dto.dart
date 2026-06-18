import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:via_cep_app/features/cep/domain/entity/cep_entity.dart';

part 'cep_dto.freezed.dart';
part 'cep_dto.g.dart';

@freezed
class CepDto with _$CepDto {
  const CepDto._();

  @JsonSerializable(explicitToJson: true)
  const factory CepDto({
    required String? cep,
    required String? logradouro,
    required String? complemento,
    required String? bairro,
    required String? localidade,
    required String? uf,
    dynamic erro, // Removemos a anotação @JsonKey d daqui; o mapeamento do campo 'erro' já casa com a propriedade dinâmica nativamente na API do ViaCep
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