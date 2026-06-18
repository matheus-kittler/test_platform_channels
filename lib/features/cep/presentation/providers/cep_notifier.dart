import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:via_cep_app/core/errors/failures.dart';
import 'package:via_cep_app/features/cep/domain/entity/cep_entity.dart';
import 'package:via_cep_app/features/cep/domain/usecase/get_cep_usecase.dart';
import 'cep_providers.dart';

// Criamos uma estrutura de estado simples usando herança nativa do Dart,
// eliminando a necessidade de gerar um 'cep_state.freezed.dart' específico para a UI.
abstract class CepState {
  const CepState();
}

class CepInitial extends CepState {
  const CepInitial();
}

class CepLoading extends CepState {
  const CepLoading();
}

class CepSuccess extends CepState {
  final CepEntity cepEntity;
  const CepSuccess(this.cepEntity);
}

class CepError extends CepState {
  final String message;
  const CepError(this.message);
}

class CepNotifier extends StateNotifier<CepState> {
  final GetCepUseCase _getCepUseCase;

  CepNotifier(this._getCepUseCase) : super(const CepInitial());

  Future<void> fetchCep(String cepBruto) async {
    state = const CepLoading();

    try {
      final cepEntity = await _getCepUseCase.execute(cepBruto);
      state = CepSuccess(cepEntity);
    } on Failure catch (failure) {
      state = CepError(failure.message);
    } catch (e) {
      state = const CepError('Ocorreu um erro inesperado na aplicação.');
    }
  }
}

// Provider global do Notifier que a UI vai escutar
final cepNotifierProvider = StateNotifierProvider<CepNotifier, CepState>((ref) {
  final useCase = ref.watch(getUseCaseProvider);
  return CepNotifier(useCase);
});