import 'package:ecommerce_app/services/Auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authServices = AuthServices();

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final result =
          await authServices.signInWithEmailAndPassword(email, password);
      if (result) {
        emit(AuthSuccess());
      } else {
        emit(AuthError('Sign in failed'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      final result =
          await authServices.signUpWithEmailAndPassword(email, password);
      if (result) {
        emit(AuthSuccess());
      } else {
        emit(AuthError('Sign up failed'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void authcheck() {
    final user = authServices.currentUser;
    if (user != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthInitial());
    }
  }

  Future<void> signOut() async {
    emit(SiginingOut());
    try {
      await authServices.signOut();
      emit(SiginedOut());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> authenticateWithGoogle() async {
    emit(GoogleSignInLoading());
    try {
      final googleResult = await authServices.signInWithGoogle();
      if (googleResult.user != null) {
        emit(GoogleSignInSuccess());
      } else {
        emit(GoogleSignInError('Google authentication failed'));
      }
    } catch (e) {
      emit(GoogleSignInError(e.toString()));
    }
  }
}
