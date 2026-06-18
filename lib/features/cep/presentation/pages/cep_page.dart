import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/cep_notifier.dart';

class CepPage extends ConsumerStatefulWidget {
  const CepPage({super.key});

  @override
  ConsumerState<CepPage> createState() => _CepPageState();
}

class _CepPageState extends ConsumerState<CepPage> {
  final TextEditingController _cepController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _cepController.dispose();
    super.dispose();
  }

  void _searchCep() {
    if (_formKey.currentState!.validate()) {
      ref.read(cepNotifierProvider.notifier).fetchCep(_cepController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cepState = ref.watch(cepNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta Via CEP'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _cepController,
                decoration: const InputDecoration(
                  labelText: 'Digite o CEP',
                  hintText: 'Ex: 90000-000',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.map_rounded),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe um CEP.';
                  }
                  final cleanCep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (cleanCep.length != 8) {
                    return 'O CEP deve conter exatamente 8 dígitos.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _searchCep,
                icon: const Icon(Icons.search),
                label: const Text('Consultar Endereço'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              
              // Chaveamento reativo da interface baseado no estado atual
              Expanded(
                child: _buildStateContent(cepState),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStateContent(CepState state) {
    if (state is CepInitial) {
      return const Center(
        child: Text(
          'Insira um CEP válido para iniciar a busca.',
          textAlign: TextAlign.center,
        ),
      );
    }

    if (state is CepLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is CepSuccess) {
      final cepEntity = state.cepEntity;
      return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.location_on, color: Colors.blue),
                      title: const Text('Logradouro'),
                      subtitle: Text(cepEntity.logradouro.isEmpty ? 'Não informado' : cepEntity.logradouro),
                    ),
                    ListTile(
                      leading: const Icon(Icons.business, color: Colors.blue),
                      title: const Text('Bairro'),
                      subtitle: Text(cepEntity.bairro.isEmpty ? 'Não informado' : cepEntity.bairro),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_city, color: Colors.blue),
                      title: const Text('Localidade / UF'),
                      subtitle: Text('${cepEntity.localidade} - ${cepEntity.uf}'),
                    ),
                    if (cepEntity.complemento.isNotEmpty)
                      ListTile(
                        leading: const Icon(Icons.info_outline, color: Colors.blue),
                        title: const Text('Complemento'),
                        subtitle: Text(cepEntity.complemento),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              // Botão abaixo do UF para navegar para a nova tela passando a entidade
              ElevatedButton.icon(
                onPressed: () {
                  context.pushNamed('cep_detalhes', extra: cepEntity);
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Adicionar Número e Continuar'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (state is CepError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(
              state.message,
              style: const TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}