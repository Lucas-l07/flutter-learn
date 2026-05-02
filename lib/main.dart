import 'package:flutter/material.dart';
import 'package:flutter_learn/controller/routes.dart';
import 'package:flutter_learn/examples/listView/listview_page.dart';
import 'package:flutter_learn/examples/notifier/notifier_home_page.dart';
import 'package:flutter_learn/examples/stream/stream_home.dart';
import 'package:flutter_learn/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.notifier: (context) => const NotifierHomePage(),
        Routes.stream: (context) => const StreamHome(),
        Routes.listView: (context) => const ListViewPage(),
      },
    );
  }
}
