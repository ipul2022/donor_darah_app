import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/Notifikasi/notifikasi_data.dart';

abstract class NotifikasiRepository {
  Future<ResultEntity<List<NotifikasiData>>> fetchNotifikasi(
      AuthenticationHeadersRequest header);
  Future<ResultEntity<NotifikasiData>> fetchDetailNotifikasi(
      AuthenticationHeadersRequest header, int id);
}
