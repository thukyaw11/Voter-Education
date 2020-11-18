import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'route_generator.dart';
import 'package:newvote/view/landingPage.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}
