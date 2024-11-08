import 'package:flutter/material.dart';

class AdministratorDrawer extends StatelessWidget {
  const AdministratorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          ListTile(title: Text("Hello!!")),
          ListTile(title: Text("Hello!!")),
          ListTile(title: Text("Hello!!")),
        ],
      ),
    );
  }
}
