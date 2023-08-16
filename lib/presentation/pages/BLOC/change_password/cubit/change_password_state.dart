part of 'change_password_cubit.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordIsLoading extends ChangePasswordState {}

class ChangePasswordIsLoaded extends ChangePasswordState {}

class ChangePasswordIsSucces extends ChangePasswordState {
  final ChangePassword data;

  const ChangePasswordIsSucces({required this.data});
}

// ignore: must_be_immutable
class ChangePasswordIsFailed extends ChangePasswordState {
  String? message;

  ChangePasswordIsFailed({this.message});
}
