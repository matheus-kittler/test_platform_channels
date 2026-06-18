import 'package:dio/dio.dart';
import 'package:via_cep_app/core/errors/failures.dart';
import 'package:via_cep_app/features/cep/domain/entity/cep_entity.dart';
import 'package:via_cep_app/features/cep/domain/repository/cep_repository.dart';
import 'package:via_cep_app/features/cep/data/datasource/cep_remote_datasource.dart';
import 'package:via_cep_app/features/cep/data/dto/cep_dto.dart';

class CepRepositoryImpl implements CepRepository {
  final CepRemoteDataSource _dataSource;

  const CepRepositoryImpl(this._dataSource);

  @override
  Future<CepEntity> getCep(String cep) async {
    try {
      final dto = await _dataSource.getCep(cep);

      if (dto.erro == true || dto.erro == 'true') {
        throw const CepNotFoundException();
      }

      return dto.toEntity();
    } on Failure {
      rethrow;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.connectionTimeout ||
          dioError.type == DioExceptionType.receiveTimeout) {
        throw const ServerException(message: 'Tempo de conexão esgotado. Tente novamente.');
      }
      throw const ServerException();
    } catch (e) {
      throw const ServerException(message: 'Ocorreu um erro inesperado ao processar os dados.');
    }
  }
}