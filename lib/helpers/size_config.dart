import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }

  static double getProportionalWidth(double inputWidth) {
    return (inputWidth / 100) * screenWidth;
  }

  static double getProportionalHeight(double inputHeight) {
    return (inputHeight / 100) * screenHeight;
  }
}
