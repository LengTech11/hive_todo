import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hive Todo App",
      theme: ThemeData(
        textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Colors.black,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            displaySmall: TextStyle(
              color: Color.fromARGB(255, 234, 234, 234),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            headlineMedium: TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
            headlineSmall: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            titleLarge: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 40,
            ),
            titleSmall: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
      ),
      home: const TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
