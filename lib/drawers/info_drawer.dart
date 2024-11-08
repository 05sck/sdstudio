import 'package:flutter/material.dart';
import 'package:sdstudio/widgets/drawer_tile.dart';

class InfoDrawer extends StatelessWidget {
  const InfoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
      child: SafeArea(
        child: Column(children: [
          SizedBox(
            height: screenHeight * 0.02,
          ),
          // App logo
          Icon(
            Icons.circle,
            size: 80,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),

          DrawerTile(text: "개인정보 수정", icon: Icons.edit, onTap: () {}),
          DrawerTile(text: "알림설정", icon: Icons.notifications, onTap: () {}),
          const Spacer(),
          DrawerTile(text: "로그아웃", icon: Icons.logout, onTap: () {}),
          const SizedBox(
            height: 25,
          ),
        ]),
      ),
    );
  }
}
