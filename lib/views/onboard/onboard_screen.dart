library onboard;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mono/helpers/colors.dart';
import 'package:mono/helpers/size_config.dart';
import 'package:mono/views/register/register_screen.dart';
import 'package:mono/views/signup/signup_Screen.dart';

part 'custom_slider.dart';
part 'slider_item.dart';
part 'widgets/signup_text.dart';
part 'widgets/register_button.dart';
part 'slider_data.dart';
part 'widgets/pageview_widget.dart';
part 'widgets/dots_indicator.dart';
part 'widgets/custom_divider.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardBackground,
      body: Column(
        children: [
          Expanded(
            child: CustomSlider(), // `Expanded` ile sarmaladık
          ),
        ],
      ), //alt alta görünmesi için
    ); //iskele için
  }
}
