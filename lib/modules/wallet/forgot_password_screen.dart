part of flutter_modules;

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({
    Key? key,
    this.subtitle,
    this.subtitleStyle,
    this.logo,
    this.backgroundColor,
    this.backIcon,
    this.buttonIdleText,
    this.buttonErrorText,
    this.buttonSuccessText,
    this.buttonErrorColor,
    this.buttonSuccessColor,
    this.buttonTextStyle,
    this.primaryColor,
    this.emailMessage,
    this.textFieldDecoration,
    this.title,
    required this.onContinueClicked,
  }) : super(key: key);
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Widget? logo;
  final Color? backgroundColor;
  final Widget? backIcon;
  final String? buttonIdleText;
  final String? buttonErrorText;
  final String? buttonSuccessText;
  final Color? buttonErrorColor;
  final Color? buttonSuccessColor;
  final TextStyle? buttonTextStyle;
  final Color? primaryColor;
  final Text? emailMessage;
  final InputDecoration? textFieldDecoration;
  final Text? title;
  final Future<bool> Function(String email) onContinueClicked;

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _email = TextEditingController();

  TextStyle get buttonTextStyle =>
      widget.buttonTextStyle ?? TextConfigs.kTextConfig;
  final _formKey = GlobalKey<FormState>();

  final RegExp emailReg = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConfigs.kColorLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.backgroundColor ?? ColorConfigs.kColorLight,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: widget.backIcon ??
              Icon(
                Icons.arrow_back_ios,
                color: ColorConfigs.kColorDark,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 100.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (widget.logo != null) widget.logo!,
                SizedBox(
                  height: 32.h,
                ),
                if (widget.subtitle != null)
                  Text(
                    widget.subtitle!,
                    style: widget.subtitleStyle ?? TextConfigs.kText40Normal_Dark,
                  ),
                SizedBox(
                  height: 56.h,
                ),
                widget.title ??
                    Text(
                      "Forgot your password?",
                      style: TextConfigs.kText45Bold_Hint,
                      textAlign: TextAlign.center,
                    ),
                SizedBox(
                  height: 52.h,
                ),
                TextFormField(
                  controller: _email,
                  style: TextConfigs.kText40Normal_Dark,
                  cursorColor: ColorConfigs.kColorSecondary,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val == null || emailReg.hasMatch(val)) return null;
                    return "Invalid Email";
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: widget.textFieldDecoration ??
                      InputDecoration(
                        contentPadding: EdgeInsets.all(32.h),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: ColorConfigs.kColorSecondary)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: ColorConfigs.kColorHint)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: ColorConfigs.kColorError)),
                        hintStyle: TextConfigs.kText40Normal_Hint,
                        hintText: "Email",
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 52.h, bottom: 150.h),
                  child: widget.emailMessage ??
                      Text(
                        "Enter the email address you used to sign in to Heineken to reset your password.",
                        style: TextConfigs.kText30Normal_Hint,
                      ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: ProgressButtonAnimation(
                    height: 120.h,
                    maxWidth: _size.width,
                    state: stateOnlyText,
                    onPressed: _listenStateButton,
                    stateWidgets: {
                      ButtonStatus.idle: Text(
                        widget.buttonIdleText ?? "Continue",
                        style: buttonTextStyle,
                      ),
                      ButtonStatus.fail: Text(
                        widget.buttonErrorText ?? "Có lỗi xảy ra",
                        style: buttonTextStyle,
                      ),
                      ButtonStatus.success: Text(
                        widget.buttonSuccessText ?? "Continue",
                        style: buttonTextStyle,
                      ),
                    },
                    stateColors: {
                      ButtonStatus.idle:
                      widget.primaryColor ?? ColorConfigs.kColorPrimary,
                      ButtonStatus.loading:
                      widget.primaryColor ?? ColorConfigs.kColorPrimary,
                      ButtonStatus.fail:
                      widget.buttonErrorColor ?? ColorConfigs.kColorError,
                      ButtonStatus.success:
                      widget.buttonSuccessColor ?? ColorConfigs.kColorPrimary,
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ButtonStatus stateOnlyText = ButtonStatus.idle;

  _listenStateButton() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      stateOnlyText = ButtonStatus.loading;
    });
    if (await widget.onContinueClicked(_email.text)) {
      setState(() {
        stateOnlyText = ButtonStatus.success;
      });
      Navigator.pop(context, true);
    } else {
      setState(() {
        stateOnlyText = ButtonStatus.fail;
      });
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        stateOnlyText = ButtonStatus.idle;
      });
    }
  }
}
