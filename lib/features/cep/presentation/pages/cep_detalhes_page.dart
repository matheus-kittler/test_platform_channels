import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:via_cep_app/features/cep/domain/entity/cep_entity.dart';

class CepDetalhesPage extends StatefulWidget {
  final CepEntity cepEntity;

  const CepDetalhesPage({super.key, required this.cepEntity});

  @override
  State<CepDetalhesPage> createState() => _CepDetalhesPageState();
}

class _CepDetalhesPageState extends State<CepDetalhesPage> {
  final TextEditingController _numeroController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const platform = MethodChannel('br.com.matheuskittler.via_cep/maps');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Endereço'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Logradouro:',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
                      ),
                      Text(
                        widget.cepEntity.logradouro.isEmpty ? 'Não informado' : widget.cepEntity.logradouro,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      
                      TextFormField(
                        controller: _numeroController,
                        decoration: const InputDecoration(
                          labelText: 'Número do imóvel / casa',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.home),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o número ou "S/N".';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      
                      Text(
                        'Bairro:',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
                      ),
                      Text(
                        widget.cepEntity.bairro.isEmpty ? 'Não informado' : widget.cepEntity.bairro,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      
                      Text(
                        'Localidade / Estado (UF):',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
                      ),
                      Text(
                        '${widget.cepEntity.localidade} - ${widget.cepEntity.uf}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              
              // BOTÃO 1: Fluxo do Android (Google Maps Direto)
              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await platform.invokeMethod('abrirMapsNativo', {
                        'logradouro': widget.cepEntity.logradouro,
                        'numero': _numeroController.text,
                        'bairro': widget.cepEntity.bairro,
                        'localidade': widget.cepEntity.localidade,
                        'uf': widget.cepEntity.uf,
                      });
                    } on PlatformException catch (e) {
                      // TRAVA DE SEGURANÇA ADICIONADA AQUI 👇
                      if (!context.mounted) return;
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Erro Android Nativo: ${e.message}")),
                      );
                    }
                  }
                },
                icon: const Icon(Icons.map_rounded),
                label: const Text('Abrir no Google Maps Android'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // BOTÃO 2: Fluxo do iOS (Abre a Lista Nativa em SwiftUI)
              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await platform.invokeMethod('salvarEExibirNativo', {
                        'logradouro': widget.cepEntity.logradouro,
                        'numero': _numeroController.text,
                        'bairro': widget.cepEntity.bairro,
                        'localidade': widget.cepEntity.localidade,
                        'uf': widget.cepEntity.uf,
                      });
                    } on PlatformException catch (e) {
                      // TRAVA DE SEGURANÇA ADICIONADA AQUI 👇
                      if (!context.mounted) return;
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Erro iOS Nativo: ${e.message}")),
                      );
                    }
                  }
                },
                icon: const Icon(Icons.phone_iphone_rounded),
                label: const Text('Enviar para Lista Nativa iOS'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.blue[800],
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}