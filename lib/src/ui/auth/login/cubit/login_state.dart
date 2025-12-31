part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginDataModel loginDataModel;

  LoginSuccess({required this.loginDataModel});
}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}
