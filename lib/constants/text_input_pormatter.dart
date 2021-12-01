part of flutter_modules;


class CustomTextInputFormatter extends TextInputFormatter {

  int numberCharsSplit = 4;
  String splitSymbol = " - ";
  CustomTextInputFormatter(this.numberCharsSplit,this.splitSymbol);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.extentOffset;
      List<String> chars = newValue.text.replaceAll(splitSymbol, '').split('');
      String newString = '';
      for (int i = 0; i < chars.length; i++) {
        if (i % numberCharsSplit == 0 && i != 0) newString += splitSymbol;
        newString += chars[i];
      }

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }
}
