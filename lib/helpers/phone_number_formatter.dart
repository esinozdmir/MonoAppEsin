import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formattedText = '';
    int selectionIndex = newValue.selection.baseOffset;

    if (digits.isNotEmpty) {
      formattedText += '0 ';
      if (digits.length > 3) {
        formattedText += '(${digits.substring(1, 4)}) ';
        digits = digits.substring(4);
      } else {
        formattedText += '(${digits.substring(1)}) ';
        selectionIndex += 2 + digits.length;
        return newValue.copyWith(
          text: formattedText,
          selection:
              TextSelection.fromPosition(TextPosition(offset: selectionIndex)),
        );
      }
      if (digits.length > 3) {
        formattedText += '${digits.substring(0, 3)} ';
        digits = digits.substring(3);
      } else {
        formattedText += '${digits.substring(0)} ';
        selectionIndex += 5 + digits.length;
        return newValue.copyWith(
          text: formattedText,
          selection:
              TextSelection.fromPosition(TextPosition(offset: selectionIndex)),
        );
      }
      if (digits.length > 2) {
        formattedText += '${digits.substring(0, 2)} ';
        digits = digits.substring(2);
      } else {
        formattedText += '${digits.substring(0)} ';
        selectionIndex += 8 + digits.length;
        return newValue.copyWith(
          text: formattedText,
          selection:
              TextSelection.fromPosition(TextPosition(offset: selectionIndex)),
        );
      }
      formattedText += digits;
    }

    selectionIndex = formattedText.length;

    if (selectionIndex > formattedText.length) {
      selectionIndex = formattedText.length;
    }

    return newValue.copyWith(
      text: formattedText,
      selection:
          TextSelection.fromPosition(TextPosition(offset: selectionIndex)),
    );
  }
}
