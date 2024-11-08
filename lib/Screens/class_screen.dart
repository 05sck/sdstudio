import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//Scaffold -> body 에서 쓰일 widget

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  bool isExpanded = false;
  int numOfClasses = 20;
  final DateTime startDate = DateTime(2023, 10, 1);

  List<DateTime> _generateDates() {
    return List.generate(numOfClasses, (index) {
      return startDate.add(Duration(days: index));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Screen Ratio
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    // Expanded Animation

    List<DateTime> dates = _generateDates();

    return SafeArea(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.en,
        children: [
          SizedBox(
            height: screenHeight * 0.05,
          ),
          SizedBox(
            height: screenHeight * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth * 0.05,
                ),

                // 누적 수강 TextBox
                Container(
                  height: screenHeight * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "  누적 수강: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      //Firebase에서 호출 if(2이면 color Primary로)
                      Text(
                        "$numOfClasses  ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                // ? Icon : 공백
                SizedBox(
                    width: screenWidth * 0.2,
                    child: isExpanded
                        ? IconButton(
                            icon: Icon(
                              Icons.arrow_downward,
                              size: screenHeight * 0.04,
                            ),
                            onPressed: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            })
                        : Container()),

                // 잔존 수강
                Container(
                  height: screenHeight * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "  수강권: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      //Firebase에서 호출 if(2이면 color Primary로)
                      Text(
                        "3  ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.05,
                ),
              ],
            ),
          ),
          Expanded(
            child: isExpanded
                // 확장 상태의 클래스들
                ? SizedBox(
                    width: screenWidth * 0.8,
                    child: ListView.builder(
                        itemCount: numOfClasses,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.08,
                            child: GestureDetector(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        title: Text(
                                      DateFormat('yyyy-MM-dd').format(
                                          dates[numOfClasses - index - 1]),
                                    ));
                                  }),
                              child: Card(
                                elevation: 4,
                                child: Text(
                                  DateFormat('yyyy-MM-dd')
                                      .format(dates[numOfClasses - index - 1]),
                                ),
                              ),
                            ),
                          );
                          // Text(
                          //   DateFormat('yyyy-MM-dd').format(dates[numOfClasses-index-1]),
                          //   );
                        }),
                  )
                // 축소 상태의 클래스들
                : GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUp,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: List.generate(numOfClasses, (index) {
                        return Positioned(
                          bottom: index * 15.0,
                          child: SizedBox(
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.08,
                            child: Card(
                              elevation: 2,
                              child: Text(
                                DateFormat('yyyy-MM-dd').format(dates[index]),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _onVerticalDragUp(DragUpdateDetails details) {
    if (details.delta.dy < -30) {
      setState(() {
        isExpanded = !isExpanded;
      });
    }
  }
}
