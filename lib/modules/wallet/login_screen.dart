part of flutter_modules;

typedef WalletLoginCallback = Future<void> Function(String email,
    String password, void Function() onSuccess, void Function() onFailed);

class WalletLoginScreen extends StatefulWidget {
  final WalletLoginCallback onWalletLoginClicked;
  final CustomizeLoginScreen? customizeLoginScreen;
  final bool showRememberMe;
  final bool showForgotPassword;
  final bool showSignUp;
  final CustomizeWidgetRemember? customizeWidgetRemember;
  final CustomizeWidgetForgotPassword? customizeWidgetForgotPassword;

  const WalletLoginScreen({
    Key? key,
    this.customizeLoginScreen,
    required this.onWalletLoginClicked,
    this.showRememberMe = true,
    this.showSignUp = true,
    this.showForgotPassword = true,
    this.customizeWidgetRemember,
    this.customizeWidgetForgotPassword,
  }) : super(key: key);

  @override
  _WalletLoginScreenState createState() => _WalletLoginScreenState();
}

class _WalletLoginScreenState extends State<WalletLoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  WalletLoginBloc? _bloc;

  @override
  void didChangeDependencies() {
    if (_bloc == null) {
      _bloc = BlocProvider.of<WalletLoginBloc>(context, listen: false);
    }
    _email.text = _bloc!.state.email;
    _password.text = _bloc!.state.password;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return BlocListener<WalletLoginBloc, WalletLoginState>(
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
        backgroundColor: widget.customizeLoginScreen!.backgroundColor,
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
                    if (widget.customizeLoginScreen!.logo != null)
                      widget.customizeLoginScreen!.logo!,
                    SizedBox(
                      height: 32.h,
                    ),
                    if (widget.customizeLoginScreen!.subtitle != null)
                      Text(
                        widget.customizeLoginScreen!.subtitle!,
                        style: widget.customizeLoginScreen!.subtitleStyle,
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
                  style: widget.customizeLoginScreen!.textFieldStyle,
                  onChanged: (val) => _bloc!.add(WalletLoginEmailChanged(val)),
                  cursorColor: widget.customizeLoginScreen!.primaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: widget
                          .customizeLoginScreen!.textFieldDecoration ??
                      InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 40.h, horizontal: 24.w),
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    widget.customizeLoginScreen!.primaryColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConfigs.kColorHint)),
                        hintStyle: widget.customizeLoginScreen!.textFieldStyle!
                            .copyWith(color: ColorConfigs.kColorHint),
                        hintText: "Email",
                      ),
                ),
                BlocSelector<WalletLoginBloc, WalletLoginState, String>(
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
                  onChanged: (val) =>
                      _bloc!.add(WalletLoginPasswordChanged(val)),
                  controller: _password,
                  style: widget.customizeLoginScreen!.textFieldStyle,
                  cursorColor: widget.customizeLoginScreen!.primaryColor,
                  obscureText: true,
                  decoration: widget
                          .customizeLoginScreen!.textFieldDecoration ??
                      InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 40.h, horizontal: 24.w),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorConfigs.kColorHint)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    widget.customizeLoginScreen!.primaryColor)),
                        hintStyle: widget.customizeLoginScreen!.textFieldStyle
                            ?.copyWith(color: ColorConfigs.kColorHint),
                        hintText: "Password",
                      ),
                ),
                BlocSelector<WalletLoginBloc, WalletLoginState, String>(
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
                if (widget.showRememberMe)
                  InkWell(
                    onTap: () {
                      _bloc!.add(WalletLoginRememberMeChanged(
                          !_bloc!.state.rememberMe,
                          widget.customizeWidgetRemember!.rememberMeChanged ??
                              (value) {}));
                    },
                    child: Container(
                      height: 84.h,
                      child: Row(
                        children: [
                          BlocSelector<WalletLoginBloc, WalletLoginState, bool>(
                            selector: (state) => state.rememberMe,
                            builder: (context, result) {
                              if (result) {
                                return widget
                                        .customizeWidgetRemember!.iconEnable ??
                                    Container(
                                      height: 50.h,
                                      width: 50.h,
                                      decoration: BoxDecoration(
                                        color: ColorConfigs.kColorPrimary,
                                        border: Border.all(
                                            color: widget.customizeLoginScreen!
                                                .primaryColor),
                                      ),
                                    );
                              } else {
                                return widget
                                        .customizeWidgetRemember!.iconDisable ??
                                    Container(
                                      height: 50.h,
                                      width: 50.h,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                            color: widget.customizeLoginScreen!
                                                .primaryColor),
                                      ),
                                    );
                              }
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
                                  widget.customizeWidgetRemember!.title ??
                                      "Remember me",
                                  style: widget.customizeWidgetRemember!
                                          .styleTitle ??
                                      TextConfigs.kText40Normal_Dark,
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
                  child: BlocSelector<WalletLoginBloc, WalletLoginState,
                      ButtonStatus>(
                    selector: (state) => state.buttonStatus,
                    builder: (context, buttonStatus) {
                      return ProgressButtonAnimation(
                          height: 120.h,
                          maxWidth: _size.width,
                          state: buttonStatus,
                          onPressed: () => _bloc!.add(
                                WalletLoginClicked(widget.onWalletLoginClicked),
                              ),
                          stateWidgets:
                              widget.customizeLoginScreen!.stateWidgets,
                          stateColors:
                              widget.customizeLoginScreen!.stateColors);
                    },
                  ),
                ),
                SizedBox(
                  height: 75.h,
                ),
                if (widget.showForgotPassword)
                  Container(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {

                        if (widget.customizeWidgetForgotPassword!
                                .onForgotPasswordClicked !=
                            null) {
                          _bloc!.add(WalletLoginForgotPasswordClicked(widget
                              .customizeWidgetForgotPassword!
                              .onForgotPasswordClicked!));
                        } else {

                        }
                      },
                      child: Text(
                        widget.customizeWidgetForgotPassword!.title ??
                            "Forgot password?",
                        style: widget
                                .customizeWidgetForgotPassword!.styleTitle ??
                            TextConfigs.kText40Normal_Primary.copyWith(
                                color:
                                    widget.customizeLoginScreen!.primaryColor),
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
