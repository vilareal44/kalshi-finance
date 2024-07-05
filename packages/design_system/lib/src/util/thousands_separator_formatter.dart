import 'package:flutter/services.dart';

///
class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ',';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    final oldValueText = oldValue.text.replaceAll(separator, '');
    var newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      // Split the string into its integer and decimal parts
      final parts = newValueText.split('.');

      final selectionIndex = newValue.text.length -
          newValue.selection
              .extentOffset; // + (parts.length > 1 ? parts[1].length : 0);
      final chars = parts[0].split('');

      var newString = '';
      for (var i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString + (parts.length > 1 ? '.${parts[1]}' : ''),
        selection: TextSelection.collapsed(
          offset: newString.length -
              selectionIndex +
              (parts.length > 1 ? parts[1].length + 1 : 0),
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
