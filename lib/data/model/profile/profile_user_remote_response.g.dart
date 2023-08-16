// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_user_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUserRemoteResponse _$ProfileUserRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    ProfileUserRemoteResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      iphoned: json['iphoned'] as String?,
      jobId: json['jobId'] as String?,
      unitId: json['unitId'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      subDistrictId: json['subDistrictId'] as String?,
      villageId: json['villageId'] as String?,
      address: json['address'] as String?,
      postalCode: json['postalCode'] as String?,
      role: json['role'] as String?,
      memberCode: json['memberCode'] as String?,
    );

Map<String, dynamic> _$ProfileUserRemoteResponseToJson(
        ProfileUserRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'iphoned': instance.iphoned,
      'jobId': instance.jobId,
      'unitId': instance.unitId,
      'placeOfBirth': instance.placeOfBirth,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'subDistrictId': instance.subDistrictId,
      'villageId': instance.villageId,
      'address': instance.address,
      'postalCode': instance.postalCode,
      'role': instance.role,
      'memberCode': instance.memberCode,
    };
