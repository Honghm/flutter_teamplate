# flutter_template

A new Flutter package.


## Usage
[Example] (https://github.com/Honghm/flutter_template/blob/main/example/example.dart)

To use this package: *add the dependency to your [pubspec.yaml] file
```yaml
 dependencies:
    flutter:
        sdk: flutter
    flutter_template:
```
## Add to your dart file
```dart
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

```
## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
"# flutter_template" 
