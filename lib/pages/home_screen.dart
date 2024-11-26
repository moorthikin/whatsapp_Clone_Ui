import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:whatsapp_clone/data/messagelist_data.dart';
import 'package:whatsapp_clone/models/messagelist_model.dart';
import 'package:whatsapp_clone/util/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  bool heart = false;
  final controller = PageController();
  final List<MessageList> messageList = messageData;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Whatsapp", style: Theme.of(context).textTheme.titleMedium),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_rounded,
              color: primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: primaryColor,
            ),
          ),
        ],
      ),
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
      body: buildUI(),
    );
  }

  Widget buildUI() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Ask Meta AI or Search",
              hintStyle: const TextStyle(fontSize: 16, color: fadedColor),
              prefixIcon: const Icon(
                Icons.bubble_chart,
                color: fadedColor,
                size: 30,
              ),
              filled: true,
              fillColor: fadedColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: messageList.length,
            itemBuilder: (context, index) {
              final data = messageList[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    //  side: const BorderSide(color: Colors.black),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(data.image),
                  ),
                  tileColor: primaryColor,
                  title: Text(
                    data.name.toString(),
                    style: const TextStyle(color: backgroundColor),
                  ),
                  subtitle: Text(
                    data.recentMessage.toString(),
                    style:
                        const TextStyle(color: backgroundColor, fontSize: 12),
                  ),
                  trailing: Text(
                    data.activeDate.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
