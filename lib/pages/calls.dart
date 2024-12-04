import 'package:flutter/material.dart';
import 'package:whatsapp_clone/data/messagelist_data.dart';
import 'package:whatsapp_clone/models/messagelist_model.dart';
import 'package:whatsapp_clone/util/colors.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final List<MessageList> data = messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Calls", style: Theme.of(context).textTheme.titleMedium),
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
              Icons.search,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.70),
              child: const Text(
                "Favorites",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 23.0,
                    backgroundColor: buttonClickColor,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: backgroundColor,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Add a Favorites",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.70),
              child: const Text(
                //textAlign: TextAlign.start,
                "Recents",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
            ),
            ListView.builder(
              shrinkWrap: true, // Allows ListView to adapt its size
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final list = data[index];
                return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(list.image),
                    ),
                    title: Text(
                      list.name,
                      style: const TextStyle(color: primaryColor),
                    ),
                    subtitle: Row(
                      children: [
                        const Icon(
                          Icons.arrow_outward_rounded,
                          color: buttonClickColor,
                        ),
                        Text(
                          list.activeDate,
                          style: const TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                    trailing: index == 5 || index == 8
                        ? IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.video_call,
                              color: buttonClickColor,
                            ))
                        : IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.call,
                              color: buttonClickColor,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
