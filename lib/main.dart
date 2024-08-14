import 'package:flutter/material.dart';
import 'package:mono/views/onboard/onboard_screen.dart';
import 'helpers/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig.init(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Responsive App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: OnboardScreen(),
            );
          },
        );
      },
    );
  }
}
