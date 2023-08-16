import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/update_profile/update_profile_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/model/request/update_profil/update_profile-request.dart';
import '../../../../../domain/repository/update_profile/update_profile_repository.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileRepository repository;
  UpdateProfileCubit(this.repository) : super(const UpdateProfileState());

  Future<void> submitUpdateProfile(
      String? email,
      String? placeOfBirth,
      String? userName,
      String? dateOfBirth,
      String? gender,
      int? jobId,
      int? unitId,
      String? phone,
      String? adrress,
      int? subDistrictId,
      int? villageId,
      String? postalCode,
      String? urlImage) async {
    emit(UpdateProfileIsLoading());
    final request = UpdateProfileRequest(
      email,
      villageId,
      userName,
      unitId,
      subDistrictId,
      postalCode,
      phone,
      urlImage,
      placeOfBirth,
      jobId,
      gender,
      dateOfBirth,
      adrress,
    );
    final response = await repository.updateRequest(request);
    if (response is ResultSuccess) {
      emit(UpdateProfileIsSucces(data: (response as ResultSuccess).data));
    } else {
      emit(UpdateProfileIsFailed(message: "Data Not Found"));
    }
  }
}
