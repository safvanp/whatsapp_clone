import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/info.dart';
import 'package:whatsapp_clone/mobile.dart';
import 'package:whatsapp_clone/myMessage.dart';
import 'package:whatsapp_clone/senderMessage.dart';
import 'package:whatsapp_clone/story.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('WhatsApp');
    setWindowMinSize(const Size(765, 520));
    setWindowMaxSize(Size.infinite);
  }
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          Platform.isAndroid || Platform.isIOS ? Mobile() : const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final controllerOne = ScrollController();
final controllerTwo = ScrollController();
final controllerThere = ScrollController();
final controllerFour = ScrollController();
final controllerFive = ScrollController();
final controllerSix = ScrollController();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    debugPrint("width:$screenWidth & height:$screenHeight");
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: SizedBox(
        width: screenWidth / 3.3,
        child: Drawer(
          backgroundColor: const Color.fromRGBO(17, 27, 33, 1),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ListView(
                      controller: controllerThere,
                      padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 90,
                                    backgroundImage: AssetImage(
                                        'assets/images/profile_image.png'),
                                    // backgroundImage: NetworkImage(
                                    //   me[0]['profilePic'].toString(),
                                    // ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50),
                              Text(
                                "Your name",
                                style: TextStyle(color: Colors.green[800]),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    me[0]['name'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                me[0]['inf'].toString(),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 50),
                              Text(
                                "About Me",
                                style: TextStyle(color: Colors.green[800]),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    me[0]['description'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      width: screenWidth,
                      color: const Color.fromRGBO(32, 44, 51, 1),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  const Text(
                                    "Profile",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  color: const Color.fromRGBO(17, 27, 33, 1),
                  width: screenWidth / 3.3,
                  height: screenHeight,
                  child: ListView.separated(
                    controller: controllerOne,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Container(
                      width: 150,
                      height: 70,
                      color: const Color.fromRGBO(17, 27, 33, 1),
                      child: ListTile(
                        leading: CircleAvatar(
                          // backgroundImage: NetworkImage(
                          //   info[index]['profilePic'].toString(),
                          // ),
                          backgroundImage:
                              AssetImage('assets/images/profile_image.png'),
                        ),
                        title: Text(
                          info[index]['name'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          info[index]['message'].toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Text(
                          info[index]['time'].toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    itemCount: info.length,
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    itemBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                      thickness: 0.2,
                      indent: 70,
                    ),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(32, 44, 51, 1),
                  width: screenWidth / 3.3,
                  height: 105,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Container(
                          color: const Color.fromRGBO(32, 44, 51, 1),
                          width: screenWidth / 2.3,
                          height: 60,
                          child: Row(
                            children: [
                              Builder(
                                builder: (BuildContext context) {
                                  return InkWell(
                                    onTap: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    child: const CircleAvatar(
                                        // backgroundImage: NetworkImage(
                                        //   me[0]['profilePic'].toString(),
                                        // ),
                                        backgroundImage: AssetImage(
                                            'assets/images/profile_image.png')),
                                  );
                                },
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Story(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.motion_photos_pause_outlined,
                                  color: Colors.grey,
                                  size: 27,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                  size: 27,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_horiz,
                                  color: Colors.grey,
                                  size: 27,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.red,
                        color: const Color.fromRGBO(17, 27, 33, 1),
                        width: screenWidth / 2.3,
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Search or start a new chat",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 18,
                              ),
                              fillColor: const Color.fromRGBO(32, 44, 51, 1),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.1, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.1, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.grey,
              width: 0.2,
              height: screenHeight,
            ),
            Flexible(
              child: Stack(
                children: [
                  ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    padding: const EdgeInsets.fromLTRB(0, 65, 0, 10),
                    itemBuilder: (context, index) {
                      if (messages[index]['isMe'] == true) {
                        return MyMessage(
                          message: messages[index]['text'].toString(),
                          date: messages[index]['time'].toString(),
                        );
                      }
                      return SenderMessage(
                        message: messages[index]['text'].toString(),
                        date: messages[index]['time'].toString(),
                      );
                    },
                  ),
                  Container(
                    color: const Color.fromRGBO(32, 44, 51, 1),
                    width: screenWidth,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                              // backgroundImage: NetworkImage(
                              //   info[0]['profilePic'].toString(),
                              // ),
                              backgroundImage: AssetImage(
                                  'assets/images/profile_image.png')),
                          const SizedBox(width: 20),
                          Text(
                            info[0]['name'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.video_call_outlined,
                              color: Colors.grey,
                              size: 27,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.call_outlined,
                              color: Colors.grey,
                              size: 27,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            color: Colors.grey,
                            width: 1,
                            height: 20,
                          ),
                          const SizedBox(width: 15),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 27,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                              size: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Container(
                          color: const Color.fromRGBO(32, 44, 51, 1),
                          height: 60,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.mood_outlined,
                                  color: Colors.grey,
                                  size: 26,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.attach_file,
                                  color: Colors.grey,
                                  size: 26,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Container(
                            color: const Color.fromRGBO(32, 44, 51, 1),
                            // width: 150,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                              child: TextField(
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Write a message",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  fillColor:
                                      const Color.fromRGBO(42, 57, 66, 1),
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0.1, color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0.1, color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(32, 44, 51, 1),
                          height: 60,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.mic_none_outlined,
                              color: Colors.grey,
                              size: 26,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
