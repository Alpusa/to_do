import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:to_do/core/utils/validators.dart';

/// we perform several tests to ensure that each of the validators is working properly
void main() {
  group('Validators Tests', () {
    setUp(() {
      // Set up the Intl default locale if needed
      Intl.defaultLocale = 'en';
    });

    test('requiredField returns error message when value is null', () {
      // Call the validator with a null value
      final result = Validators.requiredField(null);

      // Expect the returned value to match the translated message
      expect(result, equals(Intl.message("field_required")));
    });

    test('requiredField returns error message when value is empty', () {
      // Call the validator with an empty string
      final result = Validators.requiredField('');

      // Expect the returned value to match the translated message
      expect(result, equals(Intl.message("field_required")));
    });

    test('requiredField returns error message when value is whitespace', () {
      // Call the validator with a string of whitespace
      final result = Validators.requiredField('   ');

      // Expect the returned value to match the translated message
      expect(result, equals(Intl.message("field_required")));
    });

    test('requiredField returns null when value is valid', () {
      // Call the validator with a non-empty string
      final result = Validators.requiredField('Valid Input');

      // Expect the returned value to be null (no error)
      expect(result, isNull);
    });
  });
}
