import 'package:donor_darah/utility/commons.dart';

class AuthRepository {
  Future<bool> hasValidToken() async {
    final String? token = await Commons().getUid();

    return token != null && token.isNotEmpty;
  }

  Future<void> removeToken() async {
    await Commons().removeUid();
  }
}
