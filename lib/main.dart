import 'package:flutter/material.dart';
import 'package:learn_theme/services/db_service.dart';
import 'package:learn_theme/services/theme_service.dart';
import 'pages/home_page.dart';

ThemeService controllerTheme = ThemeService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    controllerTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: controllerTheme.mode,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}