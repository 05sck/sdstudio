import 'package:flutter/material.dart';
import 'package:sdstudio/drawers/administrator_drawer.dart';

class WebMainPage extends StatefulWidget {
  const WebMainPage({super.key});

  @override
  State<WebMainPage> createState() => _WebMainPageState();
}

class _WebMainPageState extends State<WebMainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("SeoroDance Administrator")),
        drawer: const AdministratorDrawer(),
        body: const Column(
          children: [
            Text("Wow"),
          ],
        ));
  }
}
