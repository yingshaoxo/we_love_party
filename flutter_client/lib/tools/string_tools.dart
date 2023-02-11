bool validate_username(String username) {
  return RegExp(r'^[a-z]([_](?![_])|[a-z0-9]){1,30}[a-z0-9]$')
      .hasMatch(username);
}

bool validate_email(String username) {
  return RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$').hasMatch(username);
}
