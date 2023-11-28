import 'package:flutter/material.dart';
import 'package:bukatokoid/core/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
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
                const Text(
                  'Fachrul Rivaldy',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
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
                      onPressedFunction: () {},
                      text: 'Pending',
                      icon: Icons.shopping_bag_outlined,
                    ),
                    OrderHistoryButton(
                      onPressedFunction: () {},
                      text: 'Packed',
                      icon: Icons.shopping_bag_outlined,
                    ),
                    OrderHistoryButton(
                      onPressedFunction: () {},
                      text: 'Shipping',
                      icon: Icons.shopping_bag_outlined,
                    ),
                    OrderHistoryButton(
                      onPressedFunction: () {},
                      text: 'Arrived',
                      icon: Icons.shopping_bag_outlined,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
