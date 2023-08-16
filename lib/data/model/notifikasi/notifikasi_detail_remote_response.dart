import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/Notifikasi/notifikasi_detail_data.dart';

part 'notifikasi_detail_remote_response.g.dart';

@JsonSerializable()
class NotifikasiDetailResponse implements NotifikasiDetailResponseMapper {
  String? title;
  String? desc;

  NotifikasiDetailResponse({this.desc, this.title});

  factory NotifikasiDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$NotifikasiDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotifikasiDetailResponseToJson(this);

  @override
  NotifikasiDetailData toNotifikasiDetailData() {
    return NotifikasiDetailData();
  }

  map(Function(dynamic e) param0) {}
}

abstract class NotifikasiDetailResponseMapper {
  NotifikasiDetailData toNotifikasiDetailData();
}
