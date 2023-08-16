import 'dart:convert';
import 'package:donor_darah/domain/model/request/update_profil/update_profile-request.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import '../../../domain/model/update_profile/update_profile_data.dart';
import '../../../domain/repository/update_profile/update_profile_repository.dart';
import '../../base/base_remote_response.dart';
import '../../model/update_profile/update_profile_remote_response.dart';
import '../../service/remote/update_profile/update_profile_remote_service.dart';

class UpdateProfileRemoteRepositoryImpl implements UpdateProfileRepository {
  final updateProfileRemoteService = UpdateProfileRemoteService();

  @override
  Future<ResultEntity<UpdateProfileData>> updateRequest(
      UpdateProfileRequest request) async {
    try {
      final response = await updateProfileRemoteService.updateRequest(request);
      if (response.statusCode == 200) {
        BaseRemoteResponse<UpdateProfileRemoteResponse> baseStatusResponse =
            BaseRemoteResponse<UpdateProfileRemoteResponse>.fromJson(
                jsonDecode(response.body),
                (json) => UpdateProfileRemoteResponse.fromJson(
                    json as Map<String, dynamic>));

        if (baseStatusResponse.status == null) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else if (baseStatusResponse.status?.code != 0) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else {
          return ResultSuccess(baseStatusResponse.data!.toUpdateProfileData());
        }
      } else {
        return ResultError<UpdateProfileData>();
      }
    } catch (e) {
      return ResultError(message: "Data Not Found");
    }
  }
}
