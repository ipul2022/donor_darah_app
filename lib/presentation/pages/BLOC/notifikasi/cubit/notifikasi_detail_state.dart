part of 'notifikasi_detail_cubit.dart';

class NotifikasiDetailState extends Equatable {
  const NotifikasiDetailState();

  @override
  List<Object> get props => [];
}

class NotifikasiDetailInitial extends NotifikasiDetailState {}

class NotifikasiDetailIsLoading extends NotifikasiDetailState {}

class NotifikasidetailIsLoaded extends NotifikasiDetailState {}

class NotifikasiDetailIsSucces extends NotifikasiDetailState {
  final NotifikasiDetailData data;

  const NotifikasiDetailIsSucces({required this.data});
}

// ignore: must_be_immutable
class NotifikasiDetailIsFailed extends NotifikasiDetailState {
  String? message;

  NotifikasiDetailIsFailed({this.message});
}
