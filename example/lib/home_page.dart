import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modules/flutter_modules.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  String text = '';
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();

  }
  @override
  void dispose() {
    controller.dispose();
    errorController!.close();
    super.dispose();
  }

  _onKeyboardTap(String value) {
    setState(() {
      controller.text = controller.text + value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD1D5DB),
      body: Column(
        children: [
          SizedBox(height: 100,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PinCodeTextField(
              length: 6,
              controller: controller,
              symbolPosition: 2,
              symbol: Container(
                height: 2,
                width: 10,
                margin: EdgeInsets.only(left: 5),
                color: Colors.black,
              ),
              showKeyboard: false,
              appContext: context,
              errorAnimationController: errorController,
              pinTheme: PinTheme(
                  fieldHeight: 80,
                  fieldWidth: 50,
                  borderWidth: 1,
                  activeColor: Color(0xFF01AB01),
                  inactiveColor: Color(0xFF888888),
                  shape: PinCodeFieldShape.box
              ),
              onChanged: (String value) {
                if(value.length==6){
                  errorController!.add(ErrorAnimationType
                      .shake);
                }
              },
            ),
          ),
          SizedBox(height: 100,),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  color: Color(0xFFD1D5DB),
                  child: Keyboard(
                    onKeyboardTap: _onKeyboardTap,
                    textStyle: TextStyle(color: Colors.black, fontSize: 20),

                    numHeight: 50,
                    numWidth: 100,
                    rightButtonFn: () {
                      setState(() {
                       if(controller.text.length>0)
                         controller.text = controller.text
                             .substring(0, controller.text.length - 1);
                      });
                    },
                    rightIcon: Icon(
                      Icons.backspace_outlined,
                      color: Colors.black,
                    ),
                    style: KeyboardStyle.STYLE1,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
