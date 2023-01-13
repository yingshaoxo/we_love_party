class RoutesMap {
  static const welcome = "/welcome";
  static const register = "/register";
  static const registerVerifying = "/register_verifying";
  static const profile_edit_page = "/profile_edit";
  static const roomList = "/room_list";
  static const singleRoomPage = "/single_room";
}

class GrpcConfig {
  static const port_number = 80;

  static const whoami_service = "whoami.weloveparty.domain.local";
  static const account_auth_service = "auth.weloveparty.domain.local";
  static const account_storage_service =
      "account_storage.weloveparty.domain.local";
}

class LivekitConfig {
  static const url = 'ws://106.52.12.33:7880';
}

bool in_dev_mode = true;
