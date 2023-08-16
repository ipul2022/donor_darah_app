import 'dart:convert';

import 'package:http/http.dart';
import '../../../../base/base_config/base_config.dart';
import '../../../../domain/model/request/change_password/change_password_request.dart';

class ChangePasswordService {
  Client client = Client();
  Future<Response> fetchChangePassword(ChangePasswordRequest request) async {
    final url = Uri.http(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.fetchChangePassword,
    );
    print("URL : ${url.toString()}");
    return client.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
