import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);

  @override
  List<Object> get props => props;
}

// General failures
class ServerFailure extends Failure {
  final String? errorResponse;

  ServerFailure({this.errorResponse});
}

class APIFailure extends Failure {
  String? errorResponse;

  APIFailure({this.errorResponse});
}

class CacheFailure extends Failure {}

class ConnectionFailure extends Failure {}

class AuthorizedFailure extends Failure {
  final String? errorResponse;

  AuthorizedFailure({this.errorResponse});
}
