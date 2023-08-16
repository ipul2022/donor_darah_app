import 'dart:convert';

import '../../../base/result_entity/result_entity.dart';
import '../../../domain/model/change_password/change_pasword.dart';
import '../../../domain/model/request/change_password/change_password_request.dart';
import '../../../domain/repository/change_password/change_password_repository.dart';
import '../../base/base_remote_response.dart';
import '../../model/change_password/change_password_response.dart';
import '../../service/remote/change_password/change_password_service.dart';

class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  final changePasswordRemoteService = ChangePasswordService();

  @override
  Future<ResultEntity<ChangePassword>> fetchChangePassword(
      ChangePasswordRequest request) async {
    try {
      final response =
          await changePasswordRemoteService.fetchChangePassword(request);

      print("STATUS  CHANGE PASSWORD: ${response.statusCode}");

      if (response.statusCode == 200) {
        BaseRemoteResponse<ChangePasswordResponse> baseResponse =
            BaseRemoteResponse<ChangePasswordResponse>.fromJson(
          jsonDecode(response.body),
          (json) =>
              ChangePasswordResponse.fromJson(json as Map<String, dynamic>),
        );

        ChangePasswordResponse.fromJson(
          jsonDecode(response.body),
        );

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else if (baseResponse.data == null) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(baseResponse.data!.toChangePassword());
        }
      } else {
        return ResultError(message: response.body);
      }
    } catch (e) {
      return ResultError(message: e.toString());
    }
  }
}
