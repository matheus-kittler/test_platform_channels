// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CepDtoImpl _$$CepDtoImplFromJson(Map<String, dynamic> json) => _$CepDtoImpl(
      cep: json['cep'] as String?,
      logradouro: json['logradouro'] as String?,
      complemento: json['complemento'] as String?,
      bairro: json['bairro'] as String?,
      localidade: json['localidade'] as String?,
      uf: json['uf'] as String?,
      erro: json['erro'],
    );

Map<String, dynamic> _$$CepDtoImplToJson(_$CepDtoImpl instance) =>
    <String, dynamic>{
      'cep': instance.cep,
      'logradouro': instance.logradouro,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'localidade': instance.localidade,
      'uf': instance.uf,
      'erro': instance.erro,
    };
