// ignore_for_file: unused_local_variable

import 'package:donor_darah/domain/model/request/change_password/change_password_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base/result_entity/result_entity.dart';
import '../../../../../domain/model/change_password/change_pasword.dart';
import '../../../../../domain/repository/change_password/change_password_repository.dart';
import '../../../../../utility/commons.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepository repository;

  ChangePasswordCubit(this.repository) : super(ChangePasswordInitial());

  Future<void> fetchChangePassword(ChangePasswordRequest request) async {
    final token = await Commons().getUid();
    emit(ChangePasswordIsLoading());
    final response = await repository.fetchChangePassword(request);

    if (response is ResultSuccess) {
      emit(
        ChangePasswordIsSucces(data: (response as ResultSuccess).data),
      );
    } else {
      emit(ChangePasswordIsFailed(message: (response as ResultError).message));
    }
  }
}
