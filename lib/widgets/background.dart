import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/bottom1.png",
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/bottom2.png",
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/top1.png",
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/top2.png",
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          // Load the 'buho.png' image from the assets folder
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/buho.png",
              // constant width and height
              width: 150,
            ),
          ),
          child
        ],
      ),
    );
  }
}
