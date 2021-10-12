part of flutter_template;

class PhoneNumberInput extends StatefulWidget {
  final SelectorConfig selectorConfig;

  final ValueChanged<PhoneNumber>? onInputChanged;
  final ValueChanged<bool>? onInputValidated;

  final VoidCallback? onSubmit;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;
  final ValueChanged<PhoneNumber>? onSaved;

  final TextEditingController? textFieldController;
  final TextInputType keyboardType;
  final TextInputAction? keyboardAction;

  final PhoneNumber? initialValue;
  final String? hintText;
  final String? errorMessage;
  final double? height;
  final double? widthSelector;
  final double selectorButtonOnErrorPadding;

  /// Ignored if [setSelectorButtonAsPrefixIcon = true]
  final double spaceBetweenSelectorAndTextField;
  final int maxLength;

  final bool isEnabled;
  final bool formatInput;
  final bool autoFocus;
  final bool autoFocusSearch;
  final AutovalidateMode autoValidateMode;
  final bool ignoreBlank;
  final bool countrySelectorScrollControlled;
  final BoxDecoration? selectorDecoration;
  final String? locale;

  final TextStyle? textStyle;
  final TextStyle? selectorTextStyle;
  final InputBorder? inputBorder;
  final InputDecoration? inputDecoration;
  final InputDecoration? searchBoxDecoration;
  final Color? cursorColor;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final EdgeInsets scrollPadding;

  final FocusNode? focusNode;
  final Iterable<String>? autofillHints;

  final List<String>? countries;

  const PhoneNumberInput(
      {Key? key,
      this.selectorConfig = const SelectorConfig(),
      required this.onInputChanged,
      this.onInputValidated,
      this.onSubmit,
      this.height,
      this.onFieldSubmitted,
      this.validator,
      this.onSaved,
      this.widthSelector,
      this.textFieldController,
      this.keyboardAction,
      this.selectorDecoration,
      this.keyboardType = TextInputType.phone,
      this.initialValue,
      this.hintText = 'Phone number',
      this.errorMessage = 'Invalid phone number',
      this.selectorButtonOnErrorPadding = 24,
      this.spaceBetweenSelectorAndTextField = 12,
      this.maxLength = 15,
      this.isEnabled = true,
      this.formatInput = true,
      this.autoFocus = false,
      this.autoFocusSearch = false,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.ignoreBlank = false,
      this.countrySelectorScrollControlled = true,
      this.locale,
      this.textStyle,
      this.selectorTextStyle,
      this.inputBorder,
      this.inputDecoration,
      this.searchBoxDecoration,
      this.textAlign = TextAlign.start,
      this.textAlignVertical = TextAlignVertical.center,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.focusNode,
      this.cursorColor,
      this.autofillHints,
      this.countries})
      : super(key: key);

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      selectorConfig: widget.selectorConfig,
      onInputChanged: widget.onInputChanged,
      onInputValidated: widget.onInputValidated,
      onSubmit: widget.onSubmit,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      onSaved: widget.onSaved,
      textFieldController: widget.textFieldController,
      keyboardType: widget.keyboardType,
      keyboardAction: widget.keyboardAction,
      initialValue: widget.initialValue,
      hintText: widget.hintText,
      errorMessage: widget.errorMessage,
      height: widget.height,
      widthSelector: widget.widthSelector,
      selectorButtonOnErrorPadding: widget.selectorButtonOnErrorPadding,
      spaceBetweenSelectorAndTextField: widget.spaceBetweenSelectorAndTextField,
      maxLength: widget.maxLength,
      isEnabled: widget.isEnabled,
      formatInput: widget.formatInput,
      autoFocus: widget.autoFocus,
      autoFocusSearch: widget.autoFocusSearch,
      autoValidateMode: widget.autoValidateMode,
      ignoreBlank: widget.ignoreBlank,
      countrySelectorScrollControlled: widget.countrySelectorScrollControlled,
      selectorDecoration: widget.selectorDecoration,
      locale: widget.locale,
      textStyle: widget.textStyle,
      selectorTextStyle: widget.selectorTextStyle,
      inputBorder: widget.inputBorder,
      inputDecoration: widget.inputDecoration,
      searchBoxDecoration: widget.searchBoxDecoration,
      cursorColor: widget.cursorColor,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      scrollPadding: widget.scrollPadding,
      focusNode: widget.focusNode,
      autofillHints: widget.autofillHints,
      countries: widget.countries,
    );
  }
}
