import 'package:donor_darah/utility/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<bool> {
  AuthCubit() : super(false);

  Future<bool> checkToken() async {
    final token = await Commons().getUid();
    print('TOKEN: ${token}');
    if (token != null && token != '') {
      return true;
    } else {
      return false;
      // emit(false);
    }
  }

  void logout() async {
    await Commons().removeUid();
  }
}
