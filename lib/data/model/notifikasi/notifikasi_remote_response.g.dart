// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifikasi_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifikasiRemoteResponse _$NotifikasiRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    NotifikasiRemoteResponse(
      id: json['id'] as int?,
      desc: json['desc'] as String?,
      isRead: json['isRead'] as bool?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$NotifikasiRemoteResponseToJson(
        NotifikasiRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'isRead': instance.isRead,
    };
