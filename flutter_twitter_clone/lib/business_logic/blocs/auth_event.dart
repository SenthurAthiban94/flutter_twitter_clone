part of './auth_bloc.dart';

abstract class AuthEvent {}

class SetToken extends AuthEvent {
  final String token;
  SetToken(this.token);
}

class ClearToken extends AuthEvent {}
