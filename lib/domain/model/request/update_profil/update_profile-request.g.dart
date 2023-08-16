// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile-request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequest(
      json['email'] as String?,
      json['villageId'] as int?,
      json['userName'] as String?,
      json['unitId'] as int?,
      json['subDistrictId'] as int?,
      json['postalCode'] as String?,
      json['phone'] as String?,
      json['urlImage'] as String?,
      json['placeOfBirth'] as String?,
      json['jobId'] as int?,
      json['gender'] as String?,
      json['dateOfBirth'] as String?,
      json['adrress'] as String?,
    );

Map<String, dynamic> _$UpdateProfileRequestToJson(
        UpdateProfileRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'placeOfBirth': instance.placeOfBirth,
      'userName': instance.userName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'jobId': instance.jobId,
      'unitId': instance.unitId,
      'phone': instance.phone,
      'adrress': instance.adrress,
      'subDistrictId': instance.subDistrictId,
      'villageId': instance.villageId,
      'postalCode': instance.postalCode,
      'urlImage': instance.urlImage,
    };
