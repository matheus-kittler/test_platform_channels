import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:via_cep_app/core/network/dio_client.dart';
import 'package:via_cep_app/features/cep/data/datasource/cep_remote_datasource.dart';
import 'package:via_cep_app/features/cep/data/repository/cep_repository_impl.dart';
import 'package:via_cep_app/features/cep/domain/repository/cep_repository.dart';
import 'package:via_cep_app/features/cep/domain/usecase/get_cep_usecase.dart';

// 1. Provê o cliente HTTP global (Certifique-se de que a classe DioClient existe em core/network)
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

// 2. Provê o DataSource injetando o cliente do Dio
final cepRemoteDataSourceProvider = Provider<CepRemoteDataSource>((ref) {
  final client = ref.watch(dioClientProvider);
  return CepRemoteDataSource(client.dio);
});

// 3. Provê o Repositório injetando o DataSource (Inversão de Dependência)
final cepRepositoryProvider = Provider<CepRepository>((ref) {
  final dataSource = ref.watch(cepRemoteDataSourceProvider);
  return CepRepositoryImpl(dataSource);
});

// 4. Provê o UseCase injetando o Repositório
final getUseCaseProvider = Provider<GetCepUseCase>((ref) {
  final repository = ref.watch(cepRepositoryProvider);
  return GetCepUseCase(repository);
});