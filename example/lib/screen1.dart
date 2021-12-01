import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modules/flutter_modules.dart';
import 'package:flutter_modules/modules/wallet/models/customize_login_screen.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return NestedWillPopScope(
      onWillPop: () async {
        print("pop screen 1");
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("Screen 1", style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

class DemoWalletLogin extends StatelessWidget {
  const DemoWalletLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletLoginBloc(),
      child: WalletLoginScreen(
        customizeWidgetRemember: CustomizeWidgetRemember(
          title: "Nhớ mật khẩu",
          // rememberMeChanged: (bool value) {},
        ),
        customizeWidgetForgotPassword: CustomizeWidgetForgotPassword(
          onForgotPasswordClicked: () async {
            // return Navigator.push<bool>(
            //   context,
            //   CupertinoPageRoute(
            //     builder: (_) => ForgotPasswordScreen(
            //       onContinueClicked: (email) async {
            //         await Future.delayed(Duration(seconds: 2));
            //         if (email == "1@1")
            //           return true;
            //         else
            //           return false;
            //       },
            //       logo: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Container(
            //               height: 86.h, width: 86.h, child: Icon(Icons.error)),
            //           Flexible(
            //               child: Text(
            //             "USDV",
            //             style: TextConfigs.kText60Bold_4,
            //           ))
            //         ],
            //       ),
            //       subtitle: "Cross-Border Transactions. Simplified.",
            //     ),
            //   ),
            // );
          },
          title: "Quên mật khẩu?",
        ),
        customizeLoginScreen: CustomizeLoginScreen(
          logo: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(height: 86.h, width: 86.h, child: Icon(Icons.error)),
              Flexible(
                  child: Text(
                "USDV",
              ))
            ],
          ),
          subtitle: "Cross-Border Transactions. Simplified.",
          primaryColor: Colors.blue,
          subtitleStyle: TextStyle(color: Colors.orange),
          textFieldStyle:
              TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
        ),
        onWalletLoginClicked: (
          String email,
          String password,
          void Function() onSuccess,
          void Function() onFailed,
        ) async {
          print("run here");
          await Future.delayed(Duration(seconds: 2));
          onSuccess();
          // Navigator.push(
          //   context,
          //   CupertinoPageRoute(
          //     builder: (_) => DemoVerifyCodeScreen(),
          //   ),
          // );
        },
      ),
    );
  }
}
