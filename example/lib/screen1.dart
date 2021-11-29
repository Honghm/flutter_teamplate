
import 'package:flutter/material.dart';
import 'package:flutter_modules/flutter_modules.dart';


class Screen1 extends StatefulWidget {
  const Screen1({ Key? key }) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return NestedWillPopScope(
      onWillPop: ()async{
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