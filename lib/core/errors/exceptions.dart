import 'package:equatable/equatable.dart';

class APIException extends Equatable implements Exception {
  APIException({
    required this.errorMessage,
    required this.statusCode,
  });
  final String errorMessage;
  final int statusCode;

  @override
  String toString() {
    return '$statusCode: $errorMessage';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode, errorMessage];
}
