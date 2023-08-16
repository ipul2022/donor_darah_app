import 'package:donor_darah/domain/model/data/login/login_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_data_response.g.dart';

abstract class LoginDataResponseMapper {
  LoginData toLoginData();
}

@JsonSerializable()
class LoginDataResponse implements LoginDataResponseMapper {
  String? token;

  LoginDataResponse({this.token});

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataResponseToJson(this);
  @override
  LoginData toLoginData() {
    return LoginData(token: token ?? '');
  }
}
