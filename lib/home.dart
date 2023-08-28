import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortune/pages/Home/homepage.dart';
import 'package:fortune/pages/inboxPage/inboxpage.dart';
import 'package:fortune/pages/socialpage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;
  List<Widget> pages= [HomePage(),InboxPage(),SocialPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _selectedPage,
        onTap: (int) {
          setState(() {
            _selectedPage = int;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(FontAwesomeIcons.home, color: Colors.white24),
                SizedBox(height: 4), // İstediğiniz boşluğu ekleyebilirsiniz
              ],
            ),
            label: "Ana Sayfa",
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.home,
                  color: Colors.yellowAccent,
                ),
                SizedBox(height: 4), // İstediğiniz boşluğu ekleyebilirsiniz
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(   FontAwesomeIcons.envelope, color: Colors.white24),
                SizedBox(height: 4), // İstediğiniz boşluğu ekleyebilirsiniz
              ],
            ),
            label: "Gelen Kutusu",
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               Icon(
              FontAwesomeIcons.envelope,
              color: Colors.yellowAccent,
                   ),
                SizedBox(height: 4), // İstediğiniz boşluğu ekleyebilirsiniz
              ],
            ),
          ),
          BottomNavigationBarItem(

            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(FontAwesomeIcons.peopleArrows,color: Colors.white24),
                SizedBox(height: 4), // İstediğiniz boşluğu ekleyebilirsiniz
              ],
            ),
            label: "Socaial",
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.peopleArrows,
                  color: Colors.yellowAccent,
                ),
                SizedBox(height: 4), // İstediğiniz boşluğu ekleyebilirsiniz
              ],
            ),
          ),
        ],

        unselectedItemColor: Colors.white, //
        selectedItemColor: Colors.yellow,

      ),
    );
  }
}

