import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:whatsapp_clone/data/messagelist_data.dart';
import 'package:whatsapp_clone/models/messagelist_model.dart';
import 'package:whatsapp_clone/pages/calls.dart';
import 'package:whatsapp_clone/pages/home_screen.dart';
import 'package:whatsapp_clone/util/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<MessageList> messageList = messageData;

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: buttonClickColor,
        child: const Icon(Icons.add_box_rounded),
      ),
      body:
          // _screens[_currentIndex]
          buildUI(),
    );
  }

  Widget buildUI() {
    return SingleChildScrollView(
      child: Column(
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
          ListView.builder(
            shrinkWrap: true, // Allows ListView to adapt its size
            physics: const NeverScrollableScrollPhysics(),
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
                  tileColor: backgroundColor,
                  title: Text(
                    data.name.toString(),
                    style: const TextStyle(color: primaryColor),
                  ),
                  subtitle: Text(
                    data.recentMessage.toString(),
                    style: const TextStyle(color: primaryColor, fontSize: 12),
                  ),
                  trailing: Column(
                    children: [
                      Badge(
                        smallSize: 8.0,
                        label: Text(
                          data.messageCount.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        isLabelVisible: true,
                        backgroundColor: Colors.green,
                        //child: Icon(Icons.person, size: 50),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.activeDate.toString(),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
