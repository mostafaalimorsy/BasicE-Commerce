import 'package:flutter/material.dart';
import 'package:iiii/componans.dart';
import 'package:iiii/constant.dart';
import 'package:iiii/model/boarding/boarding_model.dart';
import 'package:iiii/view/screen/login_screen.dart';
import 'package:iiii/view/widget/on_boarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/img/onboard/onboardd1.jpg',
        title: 'Screen Title:',
        body: 'Screen Body'),
    BoardingModel(
        image: 'assets/img/onboard/onboard2.jpg',
        title: 'Screen 2 Title:',
        body: 'Screen Body'),
    BoardingModel(
        image: 'assets/img/onboard/onboard3.png',
        title: 'Screen  3 Title:',
        body: 'Screen Body'),
  ];

  bool islast = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                // image and text of boarding
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (index) {
                      index == (boarding.length) - 1
                          ? setState(() => islast = true)
                          : setState(() => islast = false);
                    },
                    controller: boardController,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        onBoarding(boarding[index]),
                    itemCount: boarding.length,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                // the indicator and moving button
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      count: boarding.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: defaultColor,
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        expansionFactor: 4,
                        spacing: 5,
                      ),
                    ),
                    Spacer(),
                    islast
                        ? FloatingActionButton(
                            onPressed: () {
                              islast
                                  ? navigatReplace(context , LoginScreen())
                                  : boardController.nextPage(
                                      duration: Duration(
                                        milliseconds: 750,
                                      ),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                    );
                            },
                            child: Icon(Icons.arrow_forward_ios),
                          )
                        : Row(
                          children: [
                            TextButton(onPressed: (){
                      navigatReplace(context , LoginScreen());
                    }, child: Text("SKIP")),
                            SizedBox(height: 55,)
                          ],
                        )
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        );

  }
}



