import 'package:go_router/go_router.dart';
import 'package:via_cep_app/features/cep/domain/entity/cep_entity.dart';
import 'package:via_cep_app/features/cep/presentation/pages/cep_page.dart';
import 'package:via_cep_app/features/cep/presentation/pages/cep_detalhes_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'cep_search',
        builder: (context, state) => const CepPage(),
      ),
      GoRoute(
        path: '/detalhes',
        name: 'cep_detalhes',
        builder: (context, state) {
          // Captura a entidade passada via navegação
          final cepEntity = state.extra as CepEntity;
          return CepDetalhesPage(cepEntity: cepEntity);
        },
      ),
    ],
  );
}