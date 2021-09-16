import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_template/flutter_template.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ButtonStatus stateOnlyText = ButtonStatus.idle;
  ButtonStatus stateTextWithIcon = ButtonStatus.idle;

  void onPressedCustomButton() {
    switch (stateOnlyText) {
      case ButtonStatus.idle:
        stateOnlyText = ButtonStatus.loading;
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            stateOnlyText = Random.secure().nextBool()
                ? ButtonStatus.success
                : ButtonStatus.fail;
          });
        });

        break;
      case ButtonStatus.loading:
        break;
      case ButtonStatus.success:
        stateOnlyText = ButtonStatus.idle;
        break;
      case ButtonStatus.fail:
        stateOnlyText = ButtonStatus.idle;
        break;
    }
    setState(() {
      stateOnlyText = stateOnlyText;
    });
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonStatus.idle:
        stateTextWithIcon = ButtonStatus.loading;
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            stateTextWithIcon = Random.secure().nextBool()
                ? ButtonStatus.success
                : ButtonStatus.fail;
          });
        });

        break;
      case ButtonStatus.loading:
        break;
      case ButtonStatus.success:
        stateTextWithIcon = ButtonStatus.idle;
        break;
      case ButtonStatus.fail:
        stateTextWithIcon = ButtonStatus.idle;
        break;
    }
    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });
  }

  List<Widget> _options = <Widget>[
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    // Text('page 1'),
    // Text('page 2'),
    // Text('page 3'),
    // Text('page 4'),
    // Text('page 5'),
  ];
  PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        iconSize: 26,
        icon: Icon(Icons.home),
        title: ('Home'),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        iconSize: 26,
        icon: Icon(Icons.book),
        title: ('News'),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.book,color: Colors.black,),
        title: ('News'),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        iconSize: 26,
        icon: Icon(Icons.map),
        title: ('Map'),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        iconSize: 26,
        icon: Icon(Icons.local_hospital),
        title: ('Doctors'),
      ),
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:  PersistentTabView(
          this.context,
          controller: _controller,
          screens: _options,
          items: _navBarsItems(),
          confineInSafeArea: true,
          navBarHeight: 95,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          hideNavigationBarWhenKeyboardShows: true,
          popAllScreensOnTapOfSelectedTab: true,
          navBarStyle: NavBarStyle.style19,
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     ProgressButtonAnimation(
        //       maxWidth: 150,
        //       minWidth: 150,
        //       stateWidget: Text(
        //         "Send",
        //         style: TextStyle(
        //             color: Colors.white, fontWeight: FontWeight.w500),
        //       ),
        //       stateColor: Colors.amber.shade500,
        //     ),
        //     SizedBox(
        //       height: 50,
        //     ),
        //     ProgressButtonAnimation(
        //       onPressed: onPressedCustomButton,
        //       state: stateOnlyText,
        //       maxWidth: 150,
        //       stateWidgets: {
        //         ButtonStatus.idle: Text(
        //           "Send",
        //           style: TextStyle(
        //               color: Colors.white, fontWeight: FontWeight.w500),
        //         ),
        //         ButtonStatus.loading: Text(
        //           "Loading",
        //           style: TextStyle(
        //               color: Colors.white, fontWeight: FontWeight.w500),
        //         ),
        //         ButtonStatus.fail: Text(
        //           "Fail",
        //           style: TextStyle(
        //               color: Colors.white, fontWeight: FontWeight.w500),
        //         ),
        //         ButtonStatus.success: Text(
        //           "Success",
        //           style: TextStyle(
        //               color: Colors.white, fontWeight: FontWeight.w500),
        //         )
        //       },
        //       stateColors: {
        //         ButtonStatus.idle: Colors.deepPurple.shade500,
        //         ButtonStatus.loading: Colors.blue.shade300,
        //         ButtonStatus.fail: Colors.red.shade300,
        //         ButtonStatus.success: Colors.green.shade400,
        //       },
        //     ),
        //     SizedBox(
        //       height: 50,
        //     ),
        //     ProgressButtonAnimation.icon(
        //       buttonWithIcon: ButtonWithIcon(
        //           text: "Send",
        //           icon: Icon(Icons.send, color: Colors.white),
        //           color: Colors.deepPurple.shade500),
        //       maxWidth: 150,
        //     ),
        //     SizedBox(
        //       height: 50,
        //     ),
        //     ProgressButtonAnimation.icon(
        //       buttonWithIcons: {
        //         ButtonStatus.idle: ButtonWithIcon(
        //             text: "Send",
        //             icon: Icon(Icons.send, color: Colors.white),
        //             color: Colors.deepPurple.shade500),
        //         ButtonStatus.loading: ButtonWithIcon(
        //             text: "Loading", color: Colors.blue.shade700),
        //         ButtonStatus.fail: ButtonWithIcon(
        //             text: "Failed",
        //             icon: Icon(Icons.cancel, color: Colors.white),
        //             color: Colors.red.shade300),
        //         ButtonStatus.success: ButtonWithIcon(
        //             text: "Success",
        //             icon: Icon(
        //               Icons.check_circle,
        //               color: Colors.white,
        //             ),
        //             color: Colors.green.shade400)
        //       },
        //       onPressed: onPressedIconWithText,
        //       maxWidth: 150,
        //       state: stateTextWithIcon,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
