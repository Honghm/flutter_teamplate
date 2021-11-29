
part of flutter_modules;



typedef LoginCallback = Future<void> Function(String email, String password,
    void Function() onSuccess, void Function() onFailed);

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    this.rememberMeChanged,
    this.onForgotPasswordClicked,
    required this.onLoginClicked,
    this.primaryColor,
    this.backgroundColor,
    this.subtitle,
    this.logo,
    this.subtitleStyle,
    this.textFieldStyle,
    this.buttonIdleText,
    this.buttonErrorText,
    this.buttonSuccessText,
    this.buttonErrorColor,
    this.buttonSuccessColor,
    this.buttonTextStyle,
    this.forgotPasswordText,
    this.rememberMeText,
    this.textFieldDecoration,
  })  : assert((rememberMeChanged == null && rememberMeText == null) ||
            (rememberMeChanged != null && rememberMeText != null)),
        assert((forgotPasswordText == null &&
                onForgotPasswordClicked == null) ||
            (forgotPasswordText != null && onForgotPasswordClicked != null)),
        assert(subtitle == null && subtitleStyle == null || subtitle != null),
        super(key: key);

  final ValueChanged<bool>? rememberMeChanged;
  final Future<bool?> Function()? onForgotPasswordClicked;
  final LoginCallback onLoginClicked;
  final Color? primaryColor;
  final Color? backgroundColor;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Widget? logo;
  final TextStyle? textFieldStyle;
  final String? buttonIdleText;
  final String? buttonErrorText;
  final String? buttonSuccessText;
  final Color? buttonErrorColor;
  final Color? buttonSuccessColor;
  final TextStyle? buttonTextStyle;
  final String? forgotPasswordText;
  final String? rememberMeText;
  final InputDecoration? textFieldDecoration;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  LoginBloc? _bloc;
  TextStyle get buttonTextStyle =>
      widget.buttonTextStyle ?? TextConfigs.kTextConfig;
  @override
  void didChangeDependencies() {
    if (_bloc == null) {
      _bloc = BlocProvider.of<LoginBloc>(context, listen: false);
    }
    _email.text = _bloc!.state.email;
    _password.text = _bloc!.state.password;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isNotification) {
          Flushbar(
            message:
                "If your email address exists in our database, you will receive a password recovery link at your email address.",
            duration: Duration(seconds: 3),
            backgroundColor: ColorConfigs.kColorError,
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
      },
      child: Scaffold(
        backgroundColor: widget.backgroundColor ?? ColorConfigs.kColorLight,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 100.h),
            child: ListView(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 98.h,
                    ),
                    if (widget.logo != null) widget.logo!,
                    SizedBox(
                      height: 32.h,
                    ),
                    if (widget.subtitle != null)
                      Text(
                        widget.subtitle!,
                        style:
                            widget.subtitleStyle ?? TextConfigs.kText40Normal_Dark,
                      ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                  ],
                ),
                TextFormField(
                  controller: _email,
                  style: widget.textFieldStyle ?? TextConfigs.kText40Normal_Dark,
                  onChanged: (val) => _bloc!.add(LoginEmailChanged(val)),
                  cursorColor: widget.primaryColor ?? ColorConfigs.kColorPrimary,
                  keyboardType: TextInputType.emailAddress,
                  decoration: widget.textFieldDecoration ??
                      InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 40.h, horizontal: 24.w),
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.primaryColor ??
                                    ColorConfigs.kColorPrimary)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConfigs.kColorHint)),
                        hintStyle: widget.textFieldStyle
                                ?.copyWith(color: ColorConfigs.kColorHint) ??
                            TextConfigs.kText40Normal_Hint,
                        hintText: "Email",
                      ),
                ),
                BlocSelector<LoginBloc, LoginState, String>(
                  selector: (state) => state.emailValidator,
                  builder: (context, emailValidator) {
                    return SizedBox(
                      height: 50.h,
                      child: emailValidator != ""
                          ? Container(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Text(
                                emailValidator,
                                style: TextConfigs.kText40Normal_Error,
                              ),
                            )
                          : SizedBox.shrink(),
                    );
                  },
                ),
                TextFormField(
                  onChanged: (val) => _bloc!.add(LoginPasswordChanged(val)),
                  controller: _password,
                  style: widget.textFieldStyle ?? TextConfigs.kText40Normal_Dark,
                  cursorColor: widget.primaryColor ?? ColorConfigs.kColorPrimary,
                  obscureText: true,
                  decoration: widget.textFieldDecoration ??
                      InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 40.h, horizontal: 24.w),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConfigs.kColorHint)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.primaryColor ??
                                    ColorConfigs.kColorPrimary)),
                        hintStyle: widget.textFieldStyle
                                ?.copyWith(color: ColorConfigs.kColorHint) ??
                            TextConfigs.kText40Normal_Hint,
                        hintText: "Password",
                      ),
                ),
                BlocSelector<LoginBloc, LoginState, String>(
                  selector: (state) => state.passwordValidator,
                  builder: (context, passwordValidator) {
                    return passwordValidator != ""
                        ? Container(
                            height: 50.h,
                            padding: EdgeInsets.only(top: 5.h),
                            child: Text(
                              passwordValidator,
                              style: TextConfigs.kText40Normal_Error,
                            ))
                        : SizedBox.shrink();
                  },
                ),
                SizedBox(
                  height: 70.h,
                ),
                if (widget.rememberMeText != null)
                  InkWell(
                    onTap: () {
                      _bloc!.add(LoginRememberMeChanged(
                          !_bloc!.state.rememberMe, widget.rememberMeChanged!));
                    },
                    child: Container(
                      height: 84.h,
                      child: Row(
                        children: [
                          BlocSelector<LoginBloc, LoginState, bool>(
                            selector: (state) => state.rememberMe,
                            builder: (context, rememberMe) {
                              return Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: BoxDecoration(
                                  color: rememberMe
                                      ? widget.primaryColor ??
                                          ColorConfigs.kColorPrimary
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: widget.primaryColor ??
                                          ColorConfigs.kColorPrimary),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Flexible(
                            child: Container(
                                height: 84.h,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.rememberMeText ?? "Remember me",
                                  style: TextConfigs.kText40Normal_Dark,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                SizedBox(
                  height: 100.h,
                ),
                Container(
                  alignment: Alignment.center,
                  child: BlocSelector<LoginBloc, LoginState, ButtonStatus>(
                    selector: (state) => state.buttonStatus,
                    builder: (context, buttonStatus) {
                      return ProgressButtonAnimation(
                        height: 120.h,
                        maxWidth: _size.width,
                        state: buttonStatus,
                        onPressed: () => _bloc!.add(
                          LoginClicked(widget.onLoginClicked),
                        ),
                        stateWidgets: {
                          ButtonStatus.idle: Text(
                            widget.buttonIdleText ?? "LOG IN",
                            style: buttonTextStyle,
                          ),
                          ButtonStatus.fail: Text(
                            widget.buttonErrorText ?? "Có lỗi xảy ra",
                            style: buttonTextStyle,
                          ),
                          ButtonStatus.success: Text(
                            widget.buttonSuccessText ?? "LOG IN",
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
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 75.h,
                ),
                if (widget.forgotPasswordText != null)
                  Container(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        _bloc!.add(LoginForgotPasswordClicked(
                            widget.onForgotPasswordClicked!));
                      },
                      child: Text(
                        widget.forgotPasswordText!,
                        style: TextConfigs.kText40Normal_Primary
                            .copyWith(color: widget.primaryColor),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
