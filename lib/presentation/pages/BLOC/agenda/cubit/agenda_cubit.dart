import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/model/agenda/agenda_data.dart';
import '../../../../../domain/repository/agenda/agenda_repository.dart';

part 'agenda_state.dart';

class AgendaCubit extends Cubit<AgendaState> {
  final AgendaRepository repository;

  AgendaCubit(this.repository) : super(const AgendaState());

  Future<void> fetchAgenda() async {
    final token = await Commons().getUid();
    print("ini token agenda : ${token}");
    final response = await repository.fetchAgenda(
      AuthenticationHeadersRequest(token!),
    );

    if (response is ResultSuccess) {
      emit(AgendaIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(AgendaIsFailed(message: response.toString()));
    }
  }
}
