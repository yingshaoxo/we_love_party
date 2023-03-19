class RoutesMap {
  static const welcome = "/welcome";
  static const register = "/register";
  static const register_confirming = "/register_confirming";
  static const profile_edit_page = "/profile_edit";
  static const profile_view_page = "/profile_view";
  static const face_scan_page = "/face_scan";
  static const my_tabs = "/my_tabs";
  static const room_list = "/room_list";
  static const single_room_page = "/single_room";
  static const free_map_page = "/free_map_page";
  static const me_page = "/me_page";
  static const place_search_list_page = "/place_search_list_page";
  static const chat_page = "/chat_page";
  static const contacts_page = "/contacts_page";
  static const add_or_edit_contact_page = "/add_or_edit_contact_page";
  static const one_to_one_chat_page = "/one_to_one_chat_page";
  static const random_life_page = "/random_life_page";
}

// class GrpcConfig {
//   static const port_number = 80;

//   static const whoami_service = "whoami.weloveparty.domain.local";
//   static const account_auth_service = "auth.weloveparty.domain.local";
//   static const account_storage_service =
//       "account_storage.weloveparty.domain.local";
//   static const room_control_service = "room_control.weloveparty.domain.local";
//   static const free_map_service = "free_map.weloveparty.domain.local";
//   static const chat_with_friends_service =
//       "chat_with_friends.weloveparty.domain.local";
// }

// class LivekitConfig {
//   static const url = 'ws://livekit.weloveparty.domain.local';
// }

class GrpcConfig {
  static const port_number = 80;

  static const whoami_service = "whoami.weloveparty.ai-tools-online.xyz";
  static const account_auth_service = "auth.weloveparty.ai-tools-online.xyz";
  static const account_storage_service =
      "account_storage.weloveparty.ai-tools-online.xyz";
  static const room_control_service =
      "room_control.weloveparty.ai-tools-online.xyz";
  static const free_map_service = "free_map.weloveparty.ai-tools-online.xyz";
  static const chat_with_friends_service =
      "chat_with_friends.weloveparty.ai-tools-online.xyz";
}

class LivekitConfig {
  static const url = 'ws://livekit.weloveparty.ai-tools-online.xyz';
  // static const url = 'ws://144.202.109.163';
}

bool in_dev_mode = false;
