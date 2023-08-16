import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/model/request/update_profil/update_profile-request.dart';
import 'package:http/http.dart';

class UpdateProfileRemoteService {
  Client client = Client();

  Future<Response> updateRequest(UpdateProfileRequest request) async {
    final urI = Uri.http(BaseConfig.BASE_DOMAIN,
        BaseConfig.BASE_PATH + BaseConfig.fetchUpdateProfile);
    return client.get(urI);
  }
}
