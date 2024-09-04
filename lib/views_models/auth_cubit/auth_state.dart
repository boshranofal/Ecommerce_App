part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

final class SignnigUp extends AuthState {}

final class SignedUp extends AuthState {}

final class SiginingOut extends AuthState {}

final class SiginedOut extends AuthState {}

final class GoogleSignInLoading extends AuthState {}

final class GoogleSignInSuccess extends AuthState {}

final class GoogleSignInError extends AuthState {
  final String message;
  GoogleSignInError(this.message);
}
