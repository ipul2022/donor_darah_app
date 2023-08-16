import 'package:donor_darah/base/result_entity/result_entity.dart';
import '../../model/change_password/change_pasword.dart';
import '../../model/request/change_password/change_password_request.dart';

abstract class ChangePasswordRepository {
  Future<ResultEntity<ChangePassword>> fetchChangePassword(
      ChangePasswordRequest request);
}
