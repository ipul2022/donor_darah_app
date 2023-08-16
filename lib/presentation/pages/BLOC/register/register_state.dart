// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../../../domain/model/register/register_data.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterIsLoading extends RegisterState {}

class RegisterIsSucces extends RegisterState {
  final RegisterData data;

  const RegisterIsSucces({required this.data});
}

class RegisterIsFailed extends RegisterState {
  String? message;

  RegisterIsFailed({this.message});
}
