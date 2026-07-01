import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Row(
        children: [

          Text(
            "Dashboard",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          Spacer(),

          Icon(Icons.search),

          SizedBox(width: 25),

          Icon(Icons.notifications_none),

          SizedBox(width: 25),

          CircleAvatar(
            radius: 18,
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}