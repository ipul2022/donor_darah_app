import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/model/agenda/agenda_detail_data.dart';
import '../../../../../domain/repository/agenda/agenda_repository.dart';
part 'agenda_detail_state.dart';

class AgendaDetailCubit extends Cubit<AgendaDetailState> {
  final AgendaRepository repository;
  AgendaDetailCubit(this.repository) : super(const AgendaDetailState());

  Future<void> fetchAgendaDetail(
    int id,
  ) async {
    final token = await Commons().getUid();
    final response = await repository.fetchAgenda(
      AuthenticationHeadersRequest(token!),
    );

    if (response is ResultSuccess) {
      emit(AgendaDetailIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(AgendaDetailIsFailed(message: "Data Not Found"));
    }
  }
}
