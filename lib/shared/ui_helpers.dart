import 'package:flutter/material.dart';

// Horizontal Spacing
const Widget horizontalSpaceTiny = SizedBox(width: 4);
const Widget horizontalSpaceSmall = SizedBox(width: 8);
const Widget horizontalSpaceRegular = SizedBox(width: 16);
const Widget horizontalSpaceMedium = SizedBox(width: 24);
const Widget horizontalSpaceLarge = SizedBox(width: 32);

// Vertical Spacing
const Widget verticalSpaceTiny = SizedBox(height: 4);
const Widget verticalSpaceSmall = SizedBox(height: 8);
const Widget verticalSpaceRegular = SizedBox(height: 16);
const Widget verticalSpaceMedium = SizedBox(height: 24);
const Widget verticalSpaceLarge = SizedBox(height: 32);
const Widget verticalSpaceHuge = SizedBox(height: 64);

// Responsive Helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;
