import 'package:bukatokoid/screens/cart_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bukatokoid/core/widgets.dart';
import 'package:bukatokoid/screens/favorite_screen.dart';
import 'package:bukatokoid/screens/home_screen.dart';
import 'package:bukatokoid/screens/login_screen.dart';
import 'package:bukatokoid/screens/notification_screen.dart';
import 'package:bukatokoid/screens/profile_screen.dart';
import 'package:bukatokoid/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _selectedIndex = 0;

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserInfo() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return await _firestore.collection('users').doc(user.uid).get();
    } else {
      throw Exception('User not signed in');
    }
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Get.toNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: FutureBuilder(
        future: _getUserInfo(),
        builder: (context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || !snapshot.data!.exists) {
            return const Center(child: Text('Error: User data not found'));
          } else {
            Map<String, dynamic> userInfo = snapshot.data!.data()!;
            return Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountEmail: Text(_auth.currentUser!.email!),
                    accountName: Text(userInfo['name']),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/avatar.jpg"),
                    ),
                  ),
                  DrawerListTile(
                    iconData: Icons.settings,
                    title: "Settings",
                    onTilePressed: () {
                      showModal(context);
                    },
                  ),
                  DrawerListTile(
                    iconData: Icons.logout,
                    title: "Logout",
                    onTilePressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      _signOut();
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: GestureDetector(
                onTap: () {
                  Get.toNamed('/notification');
                },
                child: const Icon(Icons.notifications_outlined)),
          )
        ],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BukaToko',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: primaryColor)),
            Text('ID',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey.shade400,
        onTap: _onItemTapped,
      ),
    );
  }
}
