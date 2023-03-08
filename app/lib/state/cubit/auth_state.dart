abstract class AuthState {
  const AuthState();
}

class InitialState extends AuthState {}

class ErrorState extends AuthState {
  final String message;
  ErrorState(this.message);
}

class SuccessState extends AuthState {}