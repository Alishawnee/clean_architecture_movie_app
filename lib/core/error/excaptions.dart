import 'package:movies/core/network/error_message_model.dart';

class ServerExcaption implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerExcaption({required this.errorMessageModel});
}

class LocalDataBaseExcaption implements Exception {
  final String message;
  const LocalDataBaseExcaption({required this.message});
}
