// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Blood Banks/Blood Banks.dart';
import 'History/history.dart';
import 'Make Request/makerequest.dart';
import 'View Requests/viewrequest.dart';
import 'chat/chat.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  late String _title;
  @override
  // ignore: must_call_super
  initState() {
    _title = 'Chat';
  }

  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    Chat(),
    ViewRequest(),
    MakeRequest(),
    BloodBanks(),
    History(),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          _title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.purple,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedIconTheme: IconThemeData(size: 28),
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 16,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(size: 30, color: Colors.black),
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Chat',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_rounded),
            label: 'View Requests',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert_sharp),
            label: 'Make Request',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work_sharp),
            label: 'Blood Banks',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'History',
            // backgroundColor: Colors.purple,
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 310,
                color: Colors.deepPurple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/person.png'),
                          radius: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Blood for Life",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(
                        Icons.backup,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Backup"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(
                        Icons.restore,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Restore"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(
                        Icons.star,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Previous chats"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(
                        Icons.person_add,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Invite a friend"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(
                        Icons.mail,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Feedback"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(
                        Icons.info,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("App Info"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 25),
                      Text("Exit"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'Chat';
          }
          break;
        case 1:
          {
            _title = 'View Requests';
          }
          break;
        case 2:
          {
            _title = 'Create Request';
          }
          break;
        case 3:
          {
            _title = 'Blood Banks';
          }
          break;
        case 4:
          {
            _title = 'History';
          }
          break;
      }
    });
  }

  showConfirmLogout() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        message: Text("Would you like to sign out?"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text(
              "Sign Out",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
