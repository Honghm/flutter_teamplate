import 'package:example/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modules/flutter_modules.dart';

class PersistentTabBarView extends StatefulWidget {
  const PersistentTabBarView({Key? key}) : super(key: key);

  @override
  _PersistentTabBarViewState createState() => _PersistentTabBarViewState();
}

class _PersistentTabBarViewState extends State<PersistentTabBarView> {
  late PersistentTabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [HomePage(), Container(), Container(), Container(), Container()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Container(
          height: 30,
          width: 30,
          color: Colors.amber,
        ),
        title: "Trang chủ",
        contentPadding: 10,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          height: 30,
          width: 30,
          color: Colors.amber,
        ),
        title: "Deal",
        contentPadding: 10,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          height: 30,
          width: 30,
          color: Colors.amber,
        ),
        title: "Tin tức",
        contentPadding: 10,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          height: 30,
          width: 30,
          color: Colors.amber,
        ),
        title: "Chat",
        contentPadding: 10,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          height: 30,
          width: 30,
          color: Colors.amber,
        ),
        title: "Setting",
        contentPadding: 10,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      onWillPop: (context)async{
        print("pop $context");
        return false;
      },
      backgroundColor: Colors.blue,
      items: _navBarsItems(),
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
