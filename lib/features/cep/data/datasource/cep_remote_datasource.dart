import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:via_cep_app/features/cep/data/dto/cep_dto.dart';

part 'cep_remote_datasource.g.dart';

@RestApi()
abstract class CepRemoteDataSource {
  factory CepRemoteDataSource(Dio dio, {String baseUrl}) = _CepRemoteDataSource;

  @GET('/{cep}/json/')
  Future<CepDto> getCep(@Path('cep') String cep);
}