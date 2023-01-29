import '../common_user_interface/pop_up_window.dart';
import '../generated_grpc/account_auth_service.pb.dart';
import '../store/controllers.dart';

Future<bool> has_internet() async {
  try {
    await auth_grpc_controller
        .get_account_authentication_service_client()
        .isOnline(IsOnlineRequest());
  } catch (e) {
    await show_message(msg: e.toString());
    await show_message(msg: "I can't connect to the Internet, sorry.");
    return false;
  }
  return true;
}
