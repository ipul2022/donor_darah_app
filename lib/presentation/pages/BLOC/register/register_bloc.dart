// import 'package:donor_darah/base/result_entity/result_entity.dart';
// import 'package:donor_darah/presentation/pages/BLOC/register/register_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../domain/repository/register/register_repository.dart';
// import '../../../../domain/model/request/register/register_request.dart';

// class RegisterCubit extends Cubit<RegisterState> {
//   final RegisterRepository repository;
//   RegisterCubit(
//     this.repository,
//   ) : super(RegisterInitial());

//   Future<void> onSubmitRegister(
//       String? email,
//       String? pass,
//       String? userName,
//       String? dateOfBirth,
//       String? placeOfBirth,
//       String? gender,
//       int? jobId,
//       int? unitId,
//       String? phone,
//       String? adrress,
//       int? subDistrictId,
//       int? villageId,
//       String? postalCode,
//       String? passConfirm) async {
//     emit(RegisterIsLoading());
//     final request = RegisterRequest(
//       email,
//       villageId,
//       userName,
//       unitId,
//       subDistrictId,
//       postalCode,
//       phone,
//       passConfirm,
//       pass,
//       jobId,
//       gender,
//       dateOfBirth,
//       placeOfBirth,
//       adrress,
//     );
//     final response = await repository.registerUser(request);
//     if (response is ResultSuccess) {
//       emit(RegisterIsSucces(
//         data: (response as ResultSuccess).data,
//       ));
//       final token = (response as ResultSuccess).data;
//       // ignore: avoid_print
//       print(token);
//       // Commons().setUid(token);
//     } else {
//       emit(RegisterIsFailed(message: (response as ResultError).message));
//     }
//   }
// }
