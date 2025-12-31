import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:silancar_bloc/src/core/model/profile_model.dart';
import 'package:silancar_bloc/src/core/repository/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final profileRepo = ProfileRepository();

  Future<void> getProfile() async {
    emit(ProfileLoading());
    try {
      final response = await profileRepo.fetchProfile();
      emit(ProfileSuccess(dataProfile: response));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
