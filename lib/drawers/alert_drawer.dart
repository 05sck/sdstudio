import 'package:flutter/material.dart';

class AlertDrawer extends StatelessWidget {
  const AlertDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: ListView(
        children: [
          ListTile(
            title: const Text(
              "알림",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            tileColor: Theme.of(context).colorScheme.tertiary,
          ),
          const ListTile(
            title: Text("hello1"),
          ),
          const ListTile(
            title: Text("hello1"),
          ),
          const ListTile(
            title: Text("hello1"),
          ),
          const ListTile(
            title: Text("hello1"),
          ),
        ],
      ),
    ));
  }
}
