import 'package:flutter/services.dart';

/// extends TextInputFormatter to format the text input to a number, adding ',' every 3 digits
///

class CurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final selectionIndex = newValue.selection.end;
    var count = 0;
    final chars = newValue.text.split('');
    final result = <String>[];

    for (var i = chars.length - 1; i >= 0; i--) {
      count++;
      if (count % 3 == 0 && i != 0) {
        result.insert(0, ',');
      }
      result.insert(0, chars[i]);
    }

    return TextEditingValue(
      text: result.join(),
      selection: TextSelection.collapsed(offset: selectionIndex + 1),
    );
  }
}
