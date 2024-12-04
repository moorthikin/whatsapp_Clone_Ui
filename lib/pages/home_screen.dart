import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:whatsapp_clone/data/messagelist_data.dart';
import 'package:whatsapp_clone/models/messagelist_model.dart';
import 'package:whatsapp_clone/pages/calls.dart';
import 'package:whatsapp_clone/pages/chatScreen.dart';
import 'package:whatsapp_clone/pages/communities.dart';
import 'package:whatsapp_clone/pages/updates.dart';
import 'package:whatsapp_clone/util/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MessageList> messageList = messageData;
  var _currentIndex = 0;

  final List<Widget> _screens = [
    const ChatScreen(),
    const Updates(),
    const Communities(),
    const CallPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: SalomonBottomBar(
              currentIndex: _currentIndex,
              backgroundColor: backgroundColor,
              onTap: (i) => setState(() => _currentIndex = i),
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.home,
                    color: primaryColor,
                  ),
                  title: const Text(
                    "Home",
                    style: TextStyle(color: buttonClickColor),
                  ),
                  selectedColor: buttonClickColor,
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.upcoming,
                    color: primaryColor,
                  ),
                  title: const Text(
                    "Updates",
                    style: TextStyle(color: buttonClickColor),
                  ),
                  selectedColor: buttonClickColor,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.group,
                    color: primaryColor,
                  ),
                  title: const Text(
                    "Community",
                    style: TextStyle(color: buttonClickColor),
                  ),
                  selectedColor: buttonClickColor,
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.call,
                    color: primaryColor,
                  ),
                  title: const Text(
                    "Calls",
                    style: TextStyle(color: buttonClickColor),
                  ),
                  selectedColor: buttonClickColor,
                ),
              ],
            ),
          ),
        ),
        body: _screens[_currentIndex]
        // buildUI(),
        );
  }
}
