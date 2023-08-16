// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/model/notifikasi/notifikasi_remote_response.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/Notifikasi/notifikasi_data.dart';
import '../../../domain/repository/notifikasi/notifikasi_repository.dart';
import '../../base/base_remote_response.dart';
import '../../service/remote/notifikasi/notifikasi_remote_service.dart';

class NotifikasiRemoteRepositoryImpl implements NotifikasiRepository {
  final notifikasiRemoteService = NotifikasiRemoteService();

  @override
  Future<ResultEntity<List<NotifikasiData>>> fetchNotifikasi(
      AuthenticationHeadersRequest header) async {
    try {
      final response = await notifikasiRemoteService.fetchNotifikasi(header);

      print('STATUS CODE NOTIFIKASI: ${response.statusCode}');

      if (response.statusCode == 200) {
        BaseRemoteResponse<List<NotifikasiRemoteResponse>> baseResponseArray =
            BaseRemoteResponse<List<NotifikasiRemoteResponse>>.fromJson(
                jsonDecode(response.body),
                (json) => (json as List)
                    .map((e) => NotifikasiRemoteResponse.fromJson(
                        e as Map<String, dynamic>))
                    .toList());
        if (baseResponseArray.status == null) {
          return ResultError(message: baseResponseArray.status?.message);
        } else if (baseResponseArray.status?.code != 0) {
          return ResultError(message: baseResponseArray.status?.message);
        } else {
          return ResultSuccess(baseResponseArray.data
                  ?.map((e) => e.toNotifikasiData())
                  .toList() ??
              List.empty());
        }
      } else {
        return ResultError<List<NotifikasiData>>();
      }
    } catch (e) {
      print('CATCH : ${e.toString()}');
      return ResultError(message: "Data Not Found");
    }
  }

  @override
  Future<ResultEntity<NotifikasiData>> fetchDetailNotifikasi(
      AuthenticationHeadersRequest header, int id) async {
    try {
      final response =
          await notifikasiRemoteService.fetchDetailNotifikasi(header, id);
      print('STATUS CODE DETAIL NOTIFIKASI: ${response.statusCode}');
      if (response.statusCode == 200) {
        var json = NotifikasiRemoteResponse.fromJson(jsonDecode(response.body))
            .toNotifikasiData();
        return ResultSuccess<NotifikasiData>(json);
      } else {
        return ResultError<NotifikasiData>(message: response.body);
      }
    } catch (e) {
      return ResultError(message: "Data Not Found");
    }
  }
}
