import 'package:donor_darah/domain/model/Notifikasi/notifikasi_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifikasi_remote_response.g.dart';

abstract class NotifikasiRemoteResponseMapper {
  NotifikasiData toNotifikasiData();
}

@JsonSerializable()
class NotifikasiRemoteResponse implements NotifikasiRemoteResponseMapper {
  int? id;
  String? title;
  String? desc;
  bool? isRead;

  NotifikasiRemoteResponse({this.id, this.desc, this.isRead, this.title});

  factory NotifikasiRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$NotifikasiRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotifikasiRemoteResponseToJson(this);

  @override
  NotifikasiData toNotifikasiData() {
    return NotifikasiData(
        id: id, desc: desc ?? "", title: title ?? "", isRead: isRead);
  }
}
