import 'dart:ui';

import 'package:demo_task/res/text_styel.dart';
import 'package:demo_task/ui/se.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:demo_task/res/common_list.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  bool isShow = false;
  late AnimationController animationController;
  Animation? degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation? rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  ///
  TabController? _tabController;
  int bottomSelector = 0;
  int selectedTab = 0;
  List<String> bottomIcon = [
    'assets/images/acc.svg',
    'assets/images/done.svg',
    'assets/images/add.svg',
    'assets/images/notification.svg',
    'assets/images/acc.svg',
  ];

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });

    ///
    _tabController = TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        height: 60,
        // width: w * 0.1,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            5,
            (index) => GestureDetector(
                onTap: () {
                  if (index == 2) {
                    if (animationController.isCompleted) {
                      animationController.reverse();
                    } else {
                      animationController.forward();
                    }
                    setState(() {
                      isShow = !isShow;
                    });
                  } else {
                    setState(() {
                      bottomSelector = index;
                    });
                  }
                },
                child: bottomSelector == index
                    ? Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: const Color(0xFFE8EFFF),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  blurRadius: 6,
                                  offset: Offset(2, 2))
                            ]),
                        padding: EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          '${bottomIcon[index]}',
                          color: Color(0xFF447BFB),
                        ),
                      )
                    : SvgPicture.asset('${bottomIcon[index]}')),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: Get.height / 1.1,
                width: Get.width,
                color: Color(0xff336DF3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 13.h,
                            ),
                            Text(
                              'Hello Jessie,',
                              style:
                                  TextCommon.commonStyel(color: Colors.white),
                            ),
                            Text(
                              'at the moment you have,',
                              style: TextCommon.commonStyleMedium(
                                  color: Color(0xffABC3FC)),
                            ),
                            SizedBox(
                              height: 1.9.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  '32,5 GB ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25.sp,
                                      fontFamily: 'Avenir'),
                                ),
                                Text(
                                  'of 100 GB',
                                  style: TextCommon.commonStyleMedium(
                                      color: Color(0xffABC3FC)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 6.sp),
                              child: LinearPercentIndicator(
                                width: 78.w,
                                lineHeight: 8.0,
                                percent: 0.5,
                                backgroundColor: Colors.black.withOpacity(0.15),
                                progressColor: Color(0xffFF6AA2),
                              ),
                            ),
                            // LinearProgressIndicator(
                            //   //color: Color(0xffFF6AA2),
                            //
                            //   value: 0.6,
                            //   backgroundColor: Colors.black.withOpacity(.1),
                            //   minHeight: 5,
                            //   valueColor:
                            //       AlwaysStoppedAnimation(Color(0xffFF6AA2)),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Expanded(
                      child: Container(
                        height: 50.h,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 7.h,
                                width: Get.width,
                                alignment: Alignment.centerLeft,
                                // color: Color(0xFFFEDF1FA),
                                // color: Colors.red,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFEDF1FA),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.search_rounded,
                                          color: Color(0xff959FBA),
                                        ),
                                        hintText: 'Search',
                                        hintStyle: TextCommon.commonStyleSmall(
                                            color: Color(0xff959FBA))),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 8.h,
                              width: Get.width,
                              child: TabBar(
                                controller: _tabController,
                                onTap: (value) {
                                  setState(() {
                                    selectedTab = value;
                                  });
                                },
                                tabs: [
                                  Text('FILES',
                                      style: TextCommon.commonStyleSmall(
                                          color: selectedTab == 0
                                              ? Color(0xFF447BFB)
                                              : Color(0xff7E8494))),
                                  Text('FOLDERS',
                                      style: TextCommon.commonStyleSmall(
                                          color: selectedTab == 1
                                              ? Color(0xFF447BFB)
                                              : Color(0xff7E8494))),
                                ],
                                indicator: MaterialIndicator(
                                  color: Color(0xFF447BFB),
                                  horizontalPadding: 30,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                // color: Colors.deepOrange,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Center(child: Text('Some Files')),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      color: Colors.white,
                                      child: GridView.builder(
                                        itemCount: CommonList.folderList.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: .85,
                                          crossAxisSpacing: 15,
                                          mainAxisSpacing: 30,
                                        ),
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF5F7FC),
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(25.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                '${CommonList.folderList[index]['title']}',
                                                                style: TextCommon
                                                                    .commonStyle16(
                                                                        color: Color(
                                                                            0xff242833)),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                '${CommonList.folderList[index]['subTitle']}',
                                                                style: TextCommon
                                                                    .commonStyleSmall(
                                                                        color: Color(
                                                                            0xff5D6373)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          // overflow:
                                                          //     Overflow.visible,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: [
                                                            Container(
                                                              height: 45,
                                                              width: 60.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: AssetImage(
                                                                        '${CommonList.listOfPhotos[0]}')),
                                                                color:
                                                                    Colors.grey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 20,
                                                              child: Container(
                                                                height: 50,
                                                                width: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          '${CommonList.listOfPhotos[1]}')),
                                                                  color: Colors
                                                                      .grey,
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 3),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18),
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 40,
                                                              child: Container(
                                                                height: 50,
                                                                width: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          '${CommonList.listOfPhotos[2]}')),
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 3),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18),
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 60,
                                                              child: Container(
                                                                height: 50,
                                                                width: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF959FBA),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 3),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18),
                                                                ),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  '+${CommonList.folderList[index]['cnt']}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.more_vert,
                                                    size: 30,
                                                    color: Colors.grey,
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Text
            ],
          ),
          Positioned(
            child: SvgPicture.asset(
              'assets/images/Path Copy 8.svg',
              //color: Colors.red,
              width: Get.width,
            ),
          ),
          isShow
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: size.width,
                    height: size.height,
                    color: Colors.black54,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                IgnorePointer(
                                  child: Container(
                                    color: Colors.transparent,
                                    height: 150.0,
                                    width: 150.0,
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset.fromDirection(
                                      getRadiansFromDegree(330),
                                      degOneTranslationAnimation!.value * 120),
                                  child: Transform(
                                    transform: Matrix4.rotationZ(
                                        getRadiansFromDegree(
                                            rotationAnimation!.value))
                                      ..scale(
                                          degOneTranslationAnimation!.value),
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        CircularButton(
                                          color: Colors.blue,
                                          width: 50,
                                          height: 50,
                                          svgPath: 'assets/images/upload.svg',
                                          onClick: () {
                                            print('First Button');
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Upload',
                                            style: TextCommon.commonStyleSmall(
                                                color: Colors.black
                                                    .withOpacity(.6)))
                                      ],
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset.fromDirection(
                                      getRadiansFromDegree(270),
                                      degTwoTranslationAnimation!.value * 120),
                                  child: Transform(
                                    transform: Matrix4.rotationZ(
                                        getRadiansFromDegree(
                                            rotationAnimation!.value))
                                      ..scale(
                                          degTwoTranslationAnimation!.value),
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        CircularButton(
                                          color: Colors.black,
                                          width: 50,
                                          height: 50,
                                          svgPath: 'assets/images/camera.svg',
                                          onClick: () {
                                            print('Second button');
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Camera',
                                            style: TextCommon.commonStyleSmall(
                                                color: Colors.black
                                                    .withOpacity(.6)))
                                      ],
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset.fromDirection(
                                      getRadiansFromDegree(210),
                                      degThreeTranslationAnimation!.value *
                                          120),
                                  child: Transform(
                                    transform: Matrix4.rotationZ(
                                        getRadiansFromDegree(
                                            rotationAnimation!.value))
                                      ..scale(
                                          degThreeTranslationAnimation!.value),
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        CircularButton(
                                          color: Colors.orangeAccent,
                                          width: 50,
                                          height: 50,
                                          svgPath: 'assets/images/scan.svg',
                                          onClick: () {
                                            print('Third Button');
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Scan',
                                            style: TextCommon.commonStyleSmall(
                                                color: Colors.black
                                                    .withOpacity(.6)))
                                      ],
                                    ),
                                  ),
                                ),
                                // Transform(
                                //   transform: Matrix4.rotationZ(
                                //       getRadiansFromDegree(
                                //           rotationAnimation!.value)),
                                //   alignment: Alignment.center,
                                //   child: CircularButton(
                                //     color: Colors.red,
                                //     width: 40,
                                //     height: 40,
                                //     svgPath: 'assets/images/close.svg',
                                //     shadow: [
                                //       BoxShadow(
                                //           color: Colors.grey.withOpacity(0.5),
                                //           blurRadius: 8,
                                //           offset: Offset(0, 5))
                                //     ],
                                //     onClick: () {
                                //       if (animationController.isCompleted) {
                                //         animationController.reverse();
                                //       } else {
                                //         animationController.forward();
                                //       }
                                //     },
                                //   ),
                                // )
                              ],
                            )),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            "assets/images/Path Copy 8.png",
                            fit: BoxFit.fitWidth,
                            width: Get.width,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final String? svgPath;
  void Function()? onClick;
  final List<BoxShadow>? shadow;

  CircularButton(
      {this.color,
      this.width,
      this.height,
      this.svgPath,
      this.onClick,
      this.shadow});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFE8EFFF),
            boxShadow: shadow),
        width: width,
        height: height,
        // child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
        padding: EdgeInsets.all(12),
        child: SvgPicture.asset(
          svgPath!,
          color: Color(0xFF447BFB),
        ),
      ),
    );
  }
}
