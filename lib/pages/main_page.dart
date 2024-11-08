import 'package:flutter/material.dart';
import 'package:sdstudio/Screens/home_screen.dart';
import 'package:sdstudio/Screens/class_screen.dart';
import 'package:sdstudio/drawers/info_drawer.dart';
import 'package:sdstudio/Screens/reservation_screen.dart';
import 'package:sdstudio/drawers/alert_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _screenController = PageController();
  int _currentScreenIndex = 0;
  // 나중에 util? 에서 Screen명을 숫자로 대응시키기
  // 0 -> HomeScreen
  // 1 -> LessonScreen
  // 2 -> ReservationScreen

  void _onNavigateToScreen(int index) {
    setState(() {
      _currentScreenIndex = index;
      _screenController.jumpToPage(index);
    });
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Screen Ratio
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon:
                  // right Drawer Icon
                  // Only represents in home screen
                  _currentScreenIndex == 0
                      ? Icon(
                          size: screenWidth * 0.07,
                          Icons.notifications_none_sharp,
                          color: Theme.of(context).colorScheme.tertiary,
                        )
                      : Container(
                          width: screenWidth * 0.07,
                        ),
            ),
          ),
        ],
        title: Text(
          "SeoroDance",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  // left Drawer Icon
                  _currentScreenIndex == 0
                      ? Icon(
                          size: screenWidth * 0.07,
                          Icons.person,
                          color: Theme.of(context).colorScheme.tertiary,
                        )
                      : Container(
                          width: screenWidth * 0.07,
                        ),
                ],
              ));
        }),
      ),
      drawer: const InfoDrawer(),
      endDrawer: const AlertDrawer(),
      body: PageView(
        controller: _screenController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentScreenIndex = index;
          });
        },
        children: [
          HomeScreen(onNavigateToScreen: _onNavigateToScreen),
          const ClassScreen(),
          const ReservationScreen(),
        ],
      ),
      floatingActionButton: _currentScreenIndex != 0
          ? SizedBox(
              width: screenWidth * 0.1,
              height: screenHeight * 0.06,
              child: FloatingActionButton(
                onPressed: () => _onNavigateToScreen(0),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 30,
                ),
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
