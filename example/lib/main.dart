
import 'package:example/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modules/flutter_modules.dart';

import 'persistent_tab_bar_view.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}

class App extends StatefulWidget  {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1080, 1920),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:HomePage(),
        );
      }
    );
  }

}

