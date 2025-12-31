import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:silancar_bloc/src/core/model/login_data_model.dart';
import 'package:silancar_bloc/src/core/repository/auth_repository.dart';
import 'package:silancar_bloc/src/ui/profile/view/profile_view.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final authRepo = AuthRepository();

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    emit(LoginLoading());
    try {
      final request = await authRepo.login(email, password, context);
      emit(LoginSuccess(loginDataModel: request));
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileView(),));
    } catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }
}
