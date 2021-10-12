import 'package:flutter/material.dart';
import 'package:flutter_template/flutter_template.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  String text = '';
  @override
  Widget build(BuildContext context) {
    _onKeyboardTap(String value) {
      setState(() {
        text = text + value;
      });
    }
    return Scaffold(
      backgroundColor: Color(0xFFD1D5DB),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 300,
          child: PinCodeTextField(
            length: 6,
            controller: controller,
            appContext: context,

            onChanged: (String value) {},
          ),
        ),
      ),
    );
  }
}
