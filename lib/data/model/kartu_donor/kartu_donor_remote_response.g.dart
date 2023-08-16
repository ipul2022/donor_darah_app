// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kartu_donor_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KartuDonorRemoteResponse _$KartuDonorRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    KartuDonorRemoteResponse(
      id: json['id'] as int?,
      date: json['date'] as String?,
      idDonor: json['idDonor'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$KartuDonorRemoteResponseToJson(
        KartuDonorRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idDonor': instance.idDonor,
      'name': instance.name,
      'date': instance.date,
    };
