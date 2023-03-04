class RoutesMap {
  static const test = "/test";
}

class GrpcConfig {
  static const management_service_web_url =
      "http://management.weloveparty.domain.local:80";
}

// class GrpcConfig {
//   static const port_number = 80;

//   static const whoami_service = "whoami.weloveparty.ai-tools-online.xyz";
//   static const account_auth_service = "auth.weloveparty.ai-tools-online.xyz";
//   static const account_storage_service =
//       "account_storage.weloveparty.ai-tools-online.xyz";
//   static const room_control_service =
//       "room_control.weloveparty.ai-tools-online.xyz";
//   static const free_map_service = "free_map.weloveparty.ai-tools-online.xyz";
//   static const chat_with_friends_service =
//       "chat_with_friends.weloveparty.ai-tools-online.xyz";
// }

bool in_dev_mode = false;
