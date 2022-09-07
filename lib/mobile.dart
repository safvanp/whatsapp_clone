import 'package:flutter/material.dart';
import 'package:whatsapp_clone/info.dart';
import 'package:whatsapp_clone/mcall.dart';
import 'package:whatsapp_clone/mchat.dart';
import 'package:whatsapp_clone/mstory.dart';
import 'main.dart';

class Mobile extends StatefulWidget {
  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  var deviceSize;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(18, 27, 34, 1),
        appBar: AppBar(
          title: Text(
            "WhatsApp",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
            ),
          ],
          backgroundColor: Color.fromRGBO(31, 44, 52, 1),
          bottom: TabBar(
            indicatorColor: Color.fromRGBO(0, 168, 132, 1),
            labelColor: Color.fromRGBO(0, 168, 132, 1),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: Icon(Icons.photo_camera, size: 18),
              ),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.black,
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.flash_auto,
                      color: Colors.white,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 40,
                  top: deviceSize.height / 2,
                  left: 10,
                  right: 10,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.circle_outlined,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.cameraswitch_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Text('Hold for video, tap for photo',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            MChat(),
            MStory(),
            MCall(),
          ],
        ),
      ),
    );
  }
}
