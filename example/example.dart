// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_template/flutter_template.dart';
//
//
// class ExProgressButton extends StatefulWidget {
//   const ExProgressButton({Key? key}) : super(key: key);
//
//   @override
//   _ExProgressButtonState createState() => _ExProgressButtonState();
// }
//
// class _ExProgressButtonState extends State<ExProgressButton> {
//   ButtonStatus stateOnlyText = ButtonStatus.idle;
//   ButtonStatus stateTextWithIcon = ButtonStatus.idle;
//   ButtonStatus stateTextWithIconMinWidthState = ButtonStatus.idle;
//
//   Widget buildCustomButton() {
//     var progressTextButton = ProgressButtonAnimation(
//       stateWidgets: {
//         ButtonStatus.idle: Text(
//           "Idle",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
//         ),
//         ButtonStatus.loading: Text(
//           "Loading",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
//         ),
//         ButtonStatus.fail: Text(
//           "Fail",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
//         ),
//         ButtonStatus.success: Text(
//           "Success",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
//         )
//       },
//       stateColors: {
//         ButtonStatus.idle: Colors.grey.shade400,
//         ButtonStatus.loading: Colors.blue.shade300,
//         ButtonStatus.fail: Colors.red.shade300,
//         ButtonStatus.success: Colors.green.shade400,
//       },
//       onPressed: onPressedCustomButton,
//       state: stateOnlyText,
//       padding: EdgeInsets.all(8.0),
//     );
//     return progressTextButton;
//   }
//
//   Widget buildTextWithIcon() {
//     return ProgressButtonAnimation.icon(stateButton: {
//       ButtonStatus.idle: StateButton(
//           text: "Send",
//           icon: Icon(Icons.send, color: Colors.white),
//           color: Colors.deepPurple.shade500),
//       ButtonStatus.loading:
//           StateButton(text: "Loading", color: Colors.deepPurple.shade700),
//       ButtonStatus.fail: StateButton(
//           text: "Failed",
//           icon: Icon(Icons.cancel, color: Colors.white),
//           color: Colors.red.shade300),
//       ButtonStatus.success: StateButton(
//           text: "",
//           icon: Icon(
//             Icons.check_circle,
//             color: Colors.white,
//           ),
//           color: Colors.green.shade400)
//     }, onPressed: onPressedIconWithText, state: stateTextWithIcon);
//   }
//
//   Widget buildTextWithIconWithMinState() {
//     return ProgressButtonAnimation.icon(
//       stateButton: {
//         ButtonStatus.idle: StateButton(
//             text: "Send",
//             icon: Icon(Icons.send, color: Colors.white),
//             color: Colors.deepPurple.shade500),
//         ButtonStatus.loading:
//             StateButton(text: "Loading", color: Colors.deepPurple.shade700),
//         ButtonStatus.fail: StateButton(
//             text: "Failed",
//             icon: Icon(Icons.cancel, color: Colors.white),
//             color: Colors.red.shade300),
//         ButtonStatus.success: StateButton(
//             icon: Icon(
//               Icons.check_circle,
//               color: Colors.white,
//             ),
//             color: Colors.green.shade400)
//       },
//       onPressed: onPressedIconWithMinWidthStateText,
//       state: stateTextWithIconMinWidthState,
//       minWidthStates: [ButtonStatus.loading, ButtonStatus.success],
//     );
//   }
//
//   void onPressedCustomButton() {
//     setState(() {
//       switch (stateOnlyText) {
//         case ButtonStatus.idle:
//           stateOnlyText = ButtonStatus.loading;
//           break;
//         case ButtonStatus.loading:
//           stateOnlyText = ButtonStatus.fail;
//           break;
//         case ButtonStatus.success:
//           stateOnlyText = ButtonStatus.idle;
//           break;
//         case ButtonStatus.fail:
//           stateOnlyText = ButtonStatus.success;
//           break;
//       }
//     });
//   }
//
//   void onPressedIconWithText() {
//     switch (stateTextWithIcon) {
//       case ButtonStatus.idle:
//         stateTextWithIcon = ButtonStatus.loading;
//         Future.delayed(Duration(seconds: 1), () {
//           setState(() {
//             stateTextWithIcon = Random.secure().nextBool()
//                 ? ButtonStatus.success
//                 : ButtonStatus.fail;
//           });
//         });
//
//         break;
//       case ButtonStatus.loading:
//         break;
//       case ButtonStatus.success:
//         stateTextWithIcon = ButtonStatus.idle;
//         break;
//       case ButtonStatus.fail:
//         stateTextWithIcon = ButtonStatus.idle;
//         break;
//     }
//     setState(() {
//       stateTextWithIcon = stateTextWithIcon;
//     });
//   }
//
//   void onPressedIconWithMinWidthStateText() {
//     switch (stateTextWithIcon) {
//       case ButtonStatus.idle:
//         stateTextWithIconMinWidthState = ButtonStatus.loading;
//         Future.delayed(Duration(seconds: 1), () {
//           setState(() {
//             stateTextWithIconMinWidthState = Random.secure().nextBool()
//                 ? ButtonStatus.success
//                 : ButtonStatus.fail;
//           });
//         });
//
//         break;
//       case ButtonStatus.loading:
//         break;
//       case ButtonStatus.success:
//         stateTextWithIconMinWidthState = ButtonStatus.idle;
//         break;
//       case ButtonStatus.fail:
//         stateTextWithIconMinWidthState = ButtonStatus.idle;
//         break;
//     }
//     setState(() {
//       stateTextWithIconMinWidthState = stateTextWithIconMinWidthState;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           buildCustomButton(),
//           Container(
//             height: 32,
//           ),
//           buildTextWithIcon(),
//           Container(
//             height: 32,
//           ),
//           buildTextWithIconWithMinState(),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_template/flutter_template.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ProgressButtonAnimation(
            stateWidgets: {
              ButtonStatus.idle: Text(
                "Idle",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              ButtonStatus.loading: Text(
                "Loading",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              ButtonStatus.fail: Text(
                "Fail",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              ButtonStatus.success: Text(
                "Success",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              )
            },
            stateColors: {
              ButtonStatus.idle: Colors.grey.shade400,
              ButtonStatus.loading: Colors.blue.shade300,
              ButtonStatus.fail: Colors.red.shade300,
              ButtonStatus.success: Colors.green.shade400,
            },
            onPressed: (){},
            padding: EdgeInsets.all(8.0),
          ),
        ),
      ),
    );
  }
}

