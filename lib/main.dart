import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

int indexClicked = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = const [
    Center(
      child: Text('Message'),
    ),
    Center(
      child: Text('Sent'),
    ),
    Center(
      child: Text('Draft'),
    ),
    Center(
      child: Text('Outbox'),
    ),
    Center(
      child: Text('Delete'),
    ),
    Center(
      child: Text('Trash'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavDrawer'),
      ),
      body: pages[indexClicked],
      drawer: Drawer(
        // backgroundColor: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/bg.jpeg'),
                ),
              ),
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 22),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/tanjiro.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Kamado Tanjiro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'kamado@hashira.com',
                    style: TextStyle(
                        color: Colors.white, fontSize: 11, letterSpacing: 1),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  // Widget section Testing
                  ListTileWidget(
                    icon: Icons.message,
                    text: 'Message',
                    index: 0,
                    onTap: () {
                      setState(() {
                        indexClicked = 0;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTileWidget(
                      icon: Icons.forward,
                      text: 'Sent',
                      index: 1,
                      onTap: () {
                        setState(() {
                          indexClicked = 1;
                        });
                        Navigator.pop(context);
                      }),
                  ListTileWidget(
                      icon: Icons.drafts,
                      text: 'Drafts',
                      index: 2,
                      onTap: () {
                        setState(() {
                          indexClicked = 2;
                        });
                        Navigator.pop(context);
                      }),
                  ListTileWidget(
                      icon: Icons.outbox,
                      text: 'Outbox',
                      index: 3,
                      onTap: () {
                        setState(() {
                          indexClicked = 3;
                        });
                        Navigator.pop(context);
                      }),

                  ListTileWidget(
                      icon: Icons.delete,
                      text: 'Delete',
                      index: 4,
                      onTap: () {
                        setState(() {
                          indexClicked = 4;
                        });
                        Navigator.pop((context));
                      }),
                  ListTileWidget(
                      icon: Icons.folder_delete,
                      text: 'Trash',
                      index: 5,
                      onTap: () {
                        setState(() {
                          indexClicked = 5;
                        });
                        Navigator.pop(context);
                      }),
                  const SizedBox(height: 10),
                  const Divider(
                    height: 2,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                    color: Color.fromRGBO(72, 30, 20, 1),
                  ),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      'IbnSireen',
                      style: TextStyle(
                          color: Color.fromRGBO(12, 12, 12, 1), fontSize: 15),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'IbnSireen@dev.com',
                      style: TextStyle(
                          color: Color.fromRGBO(12, 12, 12, 1),
                          fontSize: 13,
                          letterSpacing: 1),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                    color: Color.fromRGBO(72, 30, 20, 1),
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

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.index,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: ListTile(
        selected: indexClicked == index,
        selectedColor: Colors.white,
        selectedTileColor: const Color.fromRGBO(72, 30, 20, 1),
        onTap: onTap,
        leading: Icon(icon),
        title: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
