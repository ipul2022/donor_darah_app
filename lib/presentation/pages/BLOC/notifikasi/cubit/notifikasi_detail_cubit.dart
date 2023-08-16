import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/model/Notifikasi/notifikasi_detail_data.dart';
import '../../../../../domain/repository/notifikasi/notifikasi_repository.dart';
part 'notifikasi_detail_state.dart';

class NotifikasiDetailCubit extends Cubit<NotifikasiDetailState> {
  final NotifikasiRepository repository;
  NotifikasiDetailCubit(this.repository) : super(const NotifikasiDetailState());

  Future<void> fetchNotifikasiDetail(
      AuthenticationHeadersRequest header, int id) async {
    print("Fetch Notifikasi Detail");

    final response = await repository.fetchDetailNotifikasi(header, id);
    if (response is ResultSuccess) {
      emit(NotifikasiDetailIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(NotifikasiDetailIsFailed(message: "Data Not Found"));
    }
  }
}
