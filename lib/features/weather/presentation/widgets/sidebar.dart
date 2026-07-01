import 'package:flutter/material.dart';

import 'sidebar_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: const BoxDecoration(
        color: Color(0xff111827),
        border: Border(
          right: BorderSide(
            color: Color(0xff1F2937),
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),

          const CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xff4F8CFF),
            child: Icon(
              Icons.cloud,
              color: Colors.white,
              size: 34,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "SkyCast",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 40),

          const SidebarItem(
            icon: Icons.dashboard_rounded,
            title: "Dashboard",
            isSelected: true,
          ),

          const SidebarItem(
            icon: Icons.cloud_queue_rounded,
            title: "Weather",
          ),

          const SidebarItem(
            icon: Icons.radar,
            title: "Radar",
          ),

          const SidebarItem(
            icon: Icons.air,
            title: "Air Quality",
          ),

          const SidebarItem(
            icon: Icons.favorite_border,
            title: "Favorites",
          ),

          const SidebarItem(
            icon: Icons.settings_outlined,
            title: "Settings",
          ),

          const Spacer(),

          const Divider(
            color: Colors.white12,
            indent: 20,
            endIndent: 20,
          ),

          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xff4F8CFF),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            title: const Text(
              "Aditya",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              "Cloud Engineer",
              style: TextStyle(color: Colors.white54),
            ),
            onTap: () {},
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}