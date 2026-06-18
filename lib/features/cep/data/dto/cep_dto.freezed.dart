// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cep_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CepDto _$CepDtoFromJson(Map<String, dynamic> json) {
  return _CepDto.fromJson(json);
}

/// @nodoc
mixin _$CepDto {
  String? get cep => throw _privateConstructorUsedError;
  String? get logradouro => throw _privateConstructorUsedError;
  String? get complemento => throw _privateConstructorUsedError;
  String? get bairro => throw _privateConstructorUsedError;
  String? get localidade => throw _privateConstructorUsedError;
  String? get uf => throw _privateConstructorUsedError;
  dynamic get erro => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CepDtoCopyWith<CepDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CepDtoCopyWith<$Res> {
  factory $CepDtoCopyWith(CepDto value, $Res Function(CepDto) then) =
      _$CepDtoCopyWithImpl<$Res, CepDto>;
  @useResult
  $Res call(
      {String? cep,
      String? logradouro,
      String? complemento,
      String? bairro,
      String? localidade,
      String? uf,
      dynamic erro});
}

/// @nodoc
class _$CepDtoCopyWithImpl<$Res, $Val extends CepDto>
    implements $CepDtoCopyWith<$Res> {
  _$CepDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cep = freezed,
    Object? logradouro = freezed,
    Object? complemento = freezed,
    Object? bairro = freezed,
    Object? localidade = freezed,
    Object? uf = freezed,
    Object? erro = freezed,
  }) {
    return _then(_value.copyWith(
      cep: freezed == cep
          ? _value.cep
          : cep // ignore: cast_nullable_to_non_nullable
              as String?,
      logradouro: freezed == logradouro
          ? _value.logradouro
          : logradouro // ignore: cast_nullable_to_non_nullable
              as String?,
      complemento: freezed == complemento
          ? _value.complemento
          : complemento // ignore: cast_nullable_to_non_nullable
              as String?,
      bairro: freezed == bairro
          ? _value.bairro
          : bairro // ignore: cast_nullable_to_non_nullable
              as String?,
      localidade: freezed == localidade
          ? _value.localidade
          : localidade // ignore: cast_nullable_to_non_nullable
              as String?,
      uf: freezed == uf
          ? _value.uf
          : uf // ignore: cast_nullable_to_non_nullable
              as String?,
      erro: freezed == erro
          ? _value.erro
          : erro // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CepDtoImplCopyWith<$Res> implements $CepDtoCopyWith<$Res> {
  factory _$$CepDtoImplCopyWith(
          _$CepDtoImpl value, $Res Function(_$CepDtoImpl) then) =
      __$$CepDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? cep,
      String? logradouro,
      String? complemento,
      String? bairro,
      String? localidade,
      String? uf,
      dynamic erro});
}

/// @nodoc
class __$$CepDtoImplCopyWithImpl<$Res>
    extends _$CepDtoCopyWithImpl<$Res, _$CepDtoImpl>
    implements _$$CepDtoImplCopyWith<$Res> {
  __$$CepDtoImplCopyWithImpl(
      _$CepDtoImpl _value, $Res Function(_$CepDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cep = freezed,
    Object? logradouro = freezed,
    Object? complemento = freezed,
    Object? bairro = freezed,
    Object? localidade = freezed,
    Object? uf = freezed,
    Object? erro = freezed,
  }) {
    return _then(_$CepDtoImpl(
      cep: freezed == cep
          ? _value.cep
          : cep // ignore: cast_nullable_to_non_nullable
              as String?,
      logradouro: freezed == logradouro
          ? _value.logradouro
          : logradouro // ignore: cast_nullable_to_non_nullable
              as String?,
      complemento: freezed == complemento
          ? _value.complemento
          : complemento // ignore: cast_nullable_to_non_nullable
              as String?,
      bairro: freezed == bairro
          ? _value.bairro
          : bairro // ignore: cast_nullable_to_non_nullable
              as String?,
      localidade: freezed == localidade
          ? _value.localidade
          : localidade // ignore: cast_nullable_to_non_nullable
              as String?,
      uf: freezed == uf
          ? _value.uf
          : uf // ignore: cast_nullable_to_non_nullable
              as String?,
      erro: freezed == erro
          ? _value.erro
          : erro // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CepDtoImpl extends _CepDto {
  const _$CepDtoImpl(
      {required this.cep,
      required this.logradouro,
      required this.complemento,
      required this.bairro,
      required this.localidade,
      required this.uf,
      this.erro})
      : super._();

  factory _$CepDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CepDtoImplFromJson(json);

  @override
  final String? cep;
  @override
  final String? logradouro;
  @override
  final String? complemento;
  @override
  final String? bairro;
  @override
  final String? localidade;
  @override
  final String? uf;
  @override
  final dynamic erro;

  @override
  String toString() {
    return 'CepDto(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, erro: $erro)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CepDtoImpl &&
            (identical(other.cep, cep) || other.cep == cep) &&
            (identical(other.logradouro, logradouro) ||
                other.logradouro == logradouro) &&
            (identical(other.complemento, complemento) ||
                other.complemento == complemento) &&
            (identical(other.bairro, bairro) || other.bairro == bairro) &&
            (identical(other.localidade, localidade) ||
                other.localidade == localidade) &&
            (identical(other.uf, uf) || other.uf == uf) &&
            const DeepCollectionEquality().equals(other.erro, erro));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cep, logradouro, complemento,
      bairro, localidade, uf, const DeepCollectionEquality().hash(erro));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CepDtoImplCopyWith<_$CepDtoImpl> get copyWith =>
      __$$CepDtoImplCopyWithImpl<_$CepDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CepDtoImplToJson(
      this,
    );
  }
}

abstract class _CepDto extends CepDto {
  const factory _CepDto(
      {required final String? cep,
      required final String? logradouro,
      required final String? complemento,
      required final String? bairro,
      required final String? localidade,
      required final String? uf,
      final dynamic erro}) = _$CepDtoImpl;
  const _CepDto._() : super._();

  factory _CepDto.fromJson(Map<String, dynamic> json) = _$CepDtoImpl.fromJson;

  @override
  String? get cep;
  @override
  String? get logradouro;
  @override
  String? get complemento;
  @override
  String? get bairro;
  @override
  String? get localidade;
  @override
  String? get uf;
  @override
  dynamic get erro;
  @override
  @JsonKey(ignore: true)
  _$$CepDtoImplCopyWith<_$CepDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
