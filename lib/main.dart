import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/chatScreen.dart';
import 'package:whatsapp_clone/pages/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          textTheme: const TextTheme(
              titleMedium: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255))),
        ),
        home: const HomeScreen()
        // ChatScreen(),
        );
  }
}
