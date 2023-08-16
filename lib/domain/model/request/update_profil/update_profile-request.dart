import 'package:json_annotation/json_annotation.dart';

part 'update_profile-request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  String? email;
  String? placeOfBirth;
  String? userName;
  String? dateOfBirth;
  String? gender;
  int? jobId;
  int? unitId;
  String? phone;
  String? adrress;
  int? subDistrictId;
  int? villageId;
  String? postalCode;
  String? urlImage;
  UpdateProfileRequest(
    this.email,
    this.villageId,
    this.userName,
    this.unitId,
    this.subDistrictId,
    this.postalCode,
    this.phone,
    this.urlImage,
    this.placeOfBirth,
    this.jobId,
    this.gender,
    this.dateOfBirth,
    this.adrress,
  );

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  Map<String, dynamic> toJson() {
    return _$UpdateProfileRequestToJson(this);
  }
}
