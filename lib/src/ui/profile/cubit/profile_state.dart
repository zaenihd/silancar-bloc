part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final DataProfile dataProfile;

  const ProfileSuccess({required this.dataProfile});
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError({required this.message});
}
