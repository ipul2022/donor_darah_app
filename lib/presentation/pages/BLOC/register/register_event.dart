import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegisterEvent {
  final String userName;
  final String pas;
  final String email;

  const RegisterUserEvent(
      {required this.userName, required this.pas, required this.email});
}

class LogoutUser extends RegisterEvent {}
