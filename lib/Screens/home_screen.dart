import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdstudio/Screens/reservation_screen.dart';
import 'package:sdstudio/core/theme/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  final Function(int) onNavigateToScreen;

  const HomeScreen({super.key, required this.onNavigateToScreen});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Screen Ratio
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    //Provider
    //final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/cardboardImage.png'),
                    fit: BoxFit.cover)),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.01),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    // Home Banner (Welcome,With, Goal)
                    Container(
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(2, 4),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: screenWidth * 0.01,
                            color: const Color.fromRGBO(255, 213, 79, 1)),
                        color: Colors.amber[100],
                      ),
                      child: Column(
                        children: [
                          // Welcome Banner
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 10),
                                  Text(
                                    "Welcome Seoro",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.3),
                                  Text(
                                    "With D+350",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenHeight * 0.005,
                              ),
                              Row(children: [
                                SizedBox(
                                  width: screenWidth * 0.04,
                                ),
                                const Text(
                                  "목표: ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                const Text(
                                  "자유를 춤추기",
                                  style: TextStyle(fontSize: 16),
                                )
                              ])
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.015,
                    ),

                    // Notice Banner
                    Container(
                        height: screenHeight * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.amber[100],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(2, 4),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            //borderPadding: const EdgeInsets.all(10),
                            dashPattern: const [12, 11],
                            color: Colors.red,
                            strokeWidth: 3,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      " NOTICE",
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ],
                                ),
                                //Contents as Event/Notification
                                const Center(
                                  child: Text("SummerEvent",
                                      style: TextStyle(fontSize: 25)),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    //두 일의 년도 다르면 년도 표기
                                    // Day1, Day2
                                    Text(
                                      " D - 3",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: screenHeight * 0.015,
                    ),

                    // Guide Banner
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(2, 4),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: screenWidth * 0.01,
                              color: const Color.fromRGBO(255, 213, 79, 1)),
                          color: Colors.amber[100]),
                      height: screenHeight * 0.07,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  // 그림자 부분
                                  Positioned(
                                    top: 3, // 그림자의 y축 위치
                                    left: 3, // 그림자의 x축 위치
                                    child: ShaderMask(
                                      shaderCallback: (bounds) =>
                                          RadialGradient(
                                        colors: [
                                          Colors.black.withOpacity(0.5),
                                          Colors.transparent
                                        ],
                                        center: Alignment.center,
                                        radius: 1.0,
                                      ).createShader(bounds),
                                      blendMode: BlendMode.dstIn,
                                      child: Image.asset(
                                        "assets/images/tagImage.png",
                                        width: screenWidth * 0.07,
                                        height: screenHeight * 0.028,
                                        color: Colors.black
                                            .withOpacity(0.5), // 그림자 색상과 투명도
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/tagImage.png",
                                    width: screenWidth * 0.07,
                                    height: screenHeight * 0.028,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("    이번 수업: 10/15일 오후5시 10분"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),

                    // Photo, CouponBook Banner
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Photo Banner
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: screenHeight * 0.005,
                              color: Colors.brown,
                            ),
                            color: Colors.amber[100],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(2, 4),
                              )
                            ],
                          ),
                          child: Image.asset(
                            'assets/images/exImage.png',
                            width: screenHeight * 0.23,
                          ),
                        ),

                        // CouponBook Banner
                        IconButton(
                            icon: Transform.rotate(
                              angle: 0.12,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 5, // 그림자의 y축 위치
                                    left: 5, // 그림자의 x축 위치
                                    child: ShaderMask(
                                      shaderCallback: (bounds) =>
                                          RadialGradient(
                                        colors: [
                                          Colors.black.withOpacity(0.5),
                                          Colors.transparent
                                        ],
                                        center: Alignment.center,
                                        radius: 1.0,
                                      ).createShader(bounds),
                                      blendMode: BlendMode.dstIn,
                                      child: Icon(Icons.book,
                                          size: screenHeight * 0.166,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Icon(Icons.book,
                                      size: screenHeight * 0.166,
                                      color: const Color.fromARGB(
                                          255, 218, 95, 1)),
                                  Icon(
                                    Icons.book,
                                    size: screenHeight * 0.157,
                                    color: Colors.amber[900],
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        width: double.maxFinite,
                                        height: screenHeight * 0.72,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.amber[900],
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: const Offset(2, 4),
                                            )
                                          ],
                                        ),
                                        child: PageView(
                                          children: [
                                            // 쿠폰북 표지

                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.amber[900],
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Image.asset(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 188, 30, 18),
                                                          width:
                                                              screenWidth * 0.5,
                                                          'assets/images/seoroImage.png'),
                                                      Image.asset(
                                                          width: screenWidth *
                                                              0.49,
                                                          'assets/images/seoroImage.png'),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // first page 1~50
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.amber[100],
                                              ),
                                              child: GridView.builder(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 5),
                                                  itemCount: 50,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    String displayText =
                                                        '${index + 1}';

                                                    // 20배수의 경우 텍스트 지정 혹시 이미지도 가능?
                                                    if ((index + 1) == 20) {
                                                      displayText = "에코백";
                                                    } else if ((index + 1) ==
                                                        40) {
                                                      displayText = "모자";
                                                    } else if ((index + 1) ==
                                                        60) {
                                                      displayText = "??";
                                                    }

                                                    return Padding(
                                                      padding: EdgeInsets.all(
                                                          screenHeight *
                                                              0.0027),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .amber[100],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Center(
                                                          child: Text(
                                                            displayText,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black26,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                            // second page 51~100
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.amber[100],
                                              ),
                                              child: GridView.builder(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 5),
                                                  itemCount: 50,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    String displayText =
                                                        '${index + 51}';

                                                    // 20배수의 경우 텍스트 지정 혹시 이미지도 가능?
                                                    if ((index + 1) == 10) {
                                                      displayText = "가방";
                                                    } else if ((index + 1) ==
                                                        30) {
                                                      displayText = "?";
                                                    } else if ((index + 1) ==
                                                        50) {
                                                      displayText = "??";
                                                    }

                                                    return Padding(
                                                      padding: EdgeInsets.all(
                                                          screenHeight *
                                                              0.0027),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .amber[100],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Center(
                                                          child: Text(
                                                            displayText,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black26,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Lesson, Reservation Banner
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Class Banner
                        GestureDetector(
                          onTap: () => widget.onNavigateToScreen(1),
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            height: 110,
                            width: 175,
                            decoration: BoxDecoration(
                              color: Colors.amber[100],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(2, 4),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: screenWidth * 0.01,
                                  color: const Color.fromRGBO(255, 213, 79, 1)),
                            ),
                            child: const Text("클래스"),
                          ),
                        ),
                        const SizedBox(width: 20),

                        // Reservation Banner
                        GestureDetector(
                          onTap: () => widget.onNavigateToScreen(2),
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            height: 110,
                            width: 175,
                            decoration: BoxDecoration(
                              color: Colors.amber[100],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(2, 4),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: screenWidth * 0.01,
                                  color: const Color.fromRGBO(255, 213, 79, 1)),
                            ),
                            child: const Text("예약/상담\n    신청"),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
