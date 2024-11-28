import 'package:intl/intl.dart'; // Para usar Intl

class Validators {
  // Validado para campos requeridos
  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Intl.message("field_required");
    }
    return null;
  }
}
