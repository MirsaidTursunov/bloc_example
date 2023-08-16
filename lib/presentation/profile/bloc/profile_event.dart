part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable{}


class SignUpGoogleEvent extends ProfileEvent {
  SignUpGoogleEvent();

  @override
  List<Object?> get props {
    return [];
  }
}