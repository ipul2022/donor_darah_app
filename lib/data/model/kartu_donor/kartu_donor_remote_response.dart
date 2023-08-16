import 'package:donor_darah/domain/model/kartu_donor/kartu_donor_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kartu_donor_remote_response.g.dart';

abstract class KartuDonorRemoteResponseMapper {
  KartuDonorData toKartuDonorData();
}

@JsonSerializable()
class KartuDonorRemoteResponse implements KartuDonorRemoteResponseMapper {
  int? id;
  int? idDonor;
  String? name;
  String? date;
  KartuDonorRemoteResponse({this.id, this.date, this.idDonor, this.name});

  factory KartuDonorRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$KartuDonorRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KartuDonorRemoteResponseToJson(this);

  @override
  KartuDonorData toKartuDonorData() {
    return KartuDonorData(id ?? id, idDonor ?? idDonor, name ?? "", date ?? "");
  }
}
