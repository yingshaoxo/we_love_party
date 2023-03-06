class RoutesMap {
  static const location_management = "/location_management";
  static const login = "/login";
}

class GrpcConfig {
  static const management_service_web_url =
      "http://management.weloveparty.domain.local:80";
}

bool in_dev_mode = false;
