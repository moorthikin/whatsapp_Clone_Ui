import 'package:flutter/material.dart';
import 'package:whatsapp_clone/data/messagelist_data.dart';
import 'package:whatsapp_clone/models/messagelist_model.dart';
import 'package:whatsapp_clone/util/colors.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  final List<MessageList> data = messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Updates", style: Theme.of(context).textTheme.titleMedium),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: buttonClickColor,
        onPressed: () {},
        child: const Icon(Icons.camera_alt),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.020),
              child: const Text(
                "Status",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection:
                      Axis.horizontal, // Enable horizontal scrolling
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    // Check if it's the first container
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0), // Add gap to the right
                        child: Container(
                          height: 50,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: backgroundColor,
                                  size: 35.0,
                                ),
                                Text(
                                  "Add Status",
                                  style: TextStyle(color: primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      // Render containers with images for all other indices
                      final list = data[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0), // Add gap to the right
                        child: Container(
                          height: 50,
                          width: 90,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            children: [
                              Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                    height: 150,
                                    list.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: CircleAvatar(
                                    backgroundColor: buttonClickColor,
                                    // minRadius: 30,
                                    maxRadius: 20,
                                    child: CircleAvatar(
                                      maxRadius: 18,
                                      backgroundColor: buttonClickColor,
                                      backgroundImage: AssetImage(list.image),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 120.0, left: 10.0),
                                  child: Text(
                                    list.name,
                                    style: const TextStyle(
                                        color: primaryColor,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    "Status",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Explore  >",
                    style: TextStyle(color: buttonClickColor),
                  ),
                ),
              ],
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
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.call,
                      color: buttonClickColor,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
