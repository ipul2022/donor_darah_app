import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/request/update_profil/update_profile-request.dart';
import 'package:donor_darah/domain/model/update_profile/update_profile_data.dart';

abstract class UpdateProfileRepository {
  Future<ResultEntity<UpdateProfileData>> updateRequest(
      UpdateProfileRequest request);
}
