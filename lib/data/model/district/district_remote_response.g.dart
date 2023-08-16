// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictRemoteResponse _$DistrictRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    DistrictRemoteResponse(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$DistrictRemoteResponseToJson(
        DistrictRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };
