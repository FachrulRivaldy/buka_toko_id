import 'package:flutter/material.dart';
import 'package:bukatokoid/core/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ProfileScreen({super.key});

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserInfo() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return await _firestore.collection('users').doc(user.uid).get();
    } else {
      throw Exception('User not signed in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
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
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/avatar.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userInfo['name'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    userInfo['phone'],
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Text("Member Gold"),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Order History")),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OrderHistoryButton(
                        onPressedFunction: () {
                          showModal(context);
                        },
                        text: 'Pending',
                        icon: Icons.pending_actions_outlined,
                      ),
                      OrderHistoryButton(
                        onPressedFunction: () {
                          showModal(context);
                        },
                        text: 'Packed',
                        icon: Icons.shopping_bag_outlined,
                      ),
                      OrderHistoryButton(
                        onPressedFunction: () {
                          showModal(context);
                        },
                        text: 'Shipping',
                        icon: Icons.local_shipping_outlined,
                      ),
                      OrderHistoryButton(
                        onPressedFunction: () {
                          showModal(context);
                        },
                        text: 'Arrived',
                        icon: Icons.where_to_vote_outlined,
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
