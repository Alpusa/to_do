import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/core/constants/app_routes.dart';

void main() {
  group('AppRoutes', () {
    test('contains correct home route', () {
      expect(AppRoutes.home, '/'); // test the home route
    });
  });
}
