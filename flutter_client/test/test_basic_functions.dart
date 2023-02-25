import 'package:flutter_client/tools/string_tools.dart';
import 'package:test/test.dart';

void main() {
  group('basic functions', () {
    test('if username is valid', () {
      expect(validate_username("hiyou"), true);
      expect(validate_username(".hiyou."), false);
      expect(validate_username("hiy_ou"), true);
      expect(validate_username("hi_"), false);
    });
  });
}
