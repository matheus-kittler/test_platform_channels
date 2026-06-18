abstract class Failure implements Exception {
  final String message;
  const Failure(this.message);
}

class CepNotFoundException extends Failure {
  const CepNotFoundException() : super('O CEP informado não foi encontrado na base de dados.');
}

class InvalidCepException extends Failure {
  const InvalidCepException() : super('O formato do CEP informado é inválido.');
}

class ServerException extends Failure {
  const ServerException({String message = 'Erro de comunicação com o servidor.'}) : super(message);
}