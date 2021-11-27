// import 'package:demo_task/res/text_styel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// class SecondPage extends StatefulWidget {
//   const SecondPage({Key? key}) : super(key: key);
//
//   @override
//   _SecondPageState createState() => _SecondPageState();
// }
//
// class _SecondPageState extends State<SecondPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   Animation? degOneTranslationAnimation,
//       degTwoTranslationAnimation,
//       degThreeTranslationAnimation;
//   Animation? rotationAnimation;
//
//   double getRadiansFromDegree(double degree) {
//     double unitRadian = 57.295779513;
//     return degree / unitRadian;
//   }
//
//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 250));
//     degOneTranslationAnimation = TweenSequence([
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 1, end: 1.2), weight: 75.0),
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 1.2, end: 0), weight: 25.0),
//     ]).animate(animationController);
//     degTwoTranslationAnimation = TweenSequence([
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 1, end: 1.4), weight: 55.0),
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 1.4, end: 0), weight: 45.0),
//     ]).animate(animationController);
//     degThreeTranslationAnimation = TweenSequence([
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 1, end: 1.75), weight: 35.0),
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 1.75, end: 0), weight: 65.0),
//     ]).animate(animationController);
//     rotationAnimation = Tween<double>(begin: 360.0, end: 0.0).animate(
//         CurvedAnimation(parent: animationController, curve: Curves.easeOut));
//     super.initState();
//     animationController.addListener(() {
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: Container(
//       width: size.width,
//       height: size.height,
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//               right: 0,
//               left: 0,
//               bottom: 30,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: <Widget>[
//                   IgnorePointer(
//                     child: Container(
//                       color: Colors.transparent,
//                       height: 150.0,
//                       width: 150.0,
//                     ),
//                   ),
//                   Transform.translate(
//                     offset: Offset.fromDirection(getRadiansFromDegree(330),
//                         degOneTranslationAnimation!.value * 120),
//                     child: Transform(
//                       transform: Matrix4.rotationZ(
//                           getRadiansFromDegree(rotationAnimation!.value))
//                         ..scale(degOneTranslationAnimation!.value),
//                       alignment: Alignment.center,
//                       child: Column(
//                         children: [
//                           CircularButton(
//                             color: Colors.blue,
//                             width: 50,
//                             height: 50,
//                             svgPath: 'assets/images/upload.svg',
//                             onClick: () {
//                               print('First Button');
//                             },
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text('Upload',
//                               style: TextCommon.commonStyleSmall(
//                                   color: Color(0xff5D6373)))
//                         ],
//                       ),
//                     ),
//                   ),
//                   Transform.translate(
//                     offset: Offset.fromDirection(getRadiansFromDegree(270),
//                         degTwoTranslationAnimation!.value * 120),
//                     child: Transform(
//                       transform: Matrix4.rotationZ(
//                           getRadiansFromDegree(rotationAnimation!.value))
//                         ..scale(degTwoTranslationAnimation!.value),
//                       alignment: Alignment.center,
//                       child: Column(
//                         children: [
//                           CircularButton(
//                             color: Colors.black,
//                             width: 50,
//                             height: 50,
//                             svgPath: 'assets/images/camera.svg',
//                             onClick: () {
//                               print('Second button');
//                             },
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text('Camera',
//                               style: TextCommon.commonStyleSmall(
//                                   color: Color(0xff5D6373)))
//                         ],
//                       ),
//                     ),
//                   ),
//                   Transform.translate(
//                     offset: Offset.fromDirection(getRadiansFromDegree(210),
//                         degThreeTranslationAnimation!.value * 120),
//                     child: Transform(
//                       transform: Matrix4.rotationZ(
//                           getRadiansFromDegree(rotationAnimation!.value))
//                         ..scale(degThreeTranslationAnimation!.value),
//                       alignment: Alignment.center,
//                       child: Column(
//                         children: [
//                           CircularButton(
//                             color: Colors.orangeAccent,
//                             width: 50,
//                             height: 50,
//                             svgPath: 'assets/images/scan.svg',
//                             onClick: () {
//                               print('Third Button');
//                             },
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text('Scan',
//                               style: TextCommon.commonStyleSmall(
//                                   color: Color(0xff5D6373)))
//                         ],
//                       ),
//                     ),
//                   ),
//                   Transform(
//                     transform: Matrix4.rotationZ(
//                         getRadiansFromDegree(rotationAnimation!.value)),
//                     alignment: Alignment.center,
//                     child: CircularButton(
//                       color: Colors.red,
//                       width: 40,
//                       height: 40,
//                       svgPath: 'assets/images/close.svg',
//                       shadow: [
//                         BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             blurRadius: 8,
//                             offset: Offset(0, 5))
//                       ],
//                       onClick: () {
//                         if (animationController.isCompleted) {
//                           animationController.reverse();
//                         } else {
//                           animationController.forward();
//                         }
//                       },
//                     ),
//                   )
//                 ],
//               )),
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               "assets/images/Path Copy 8.png",
//               fit: BoxFit.fitWidth,
//               width: Get.width,
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

// class CircularButton extends StatelessWidget {
//   final double? width;
//   final double? height;
//   final Color? color;
//   final String? svgPath;
//   void Function()? onClick;
//   final List<BoxShadow>? shadow;
//
//   CircularButton(
//       {this.color,
//       this.width,
//       this.height,
//       this.svgPath,
//       this.onClick,
//       this.shadow});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onClick,
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Color(0xFFE8EFFF),
//             boxShadow: shadow),
//         width: width,
//         height: height,
//         // child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
//         padding: EdgeInsets.all(12),
//         child: SvgPicture.asset(
//           svgPath!,
//           color: Color(0xFF447BFB),
//         ),
//       ),
//     );
//   }
// }
