import 'package:flutter/material.dart';
import 'package:mono/helpers/colors.dart';
import 'package:mono/helpers/size_config.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  List<bool> isSelected = [
    true,
    false
  ]; // İlk seçenek olarak "Cep Telefonu" seçili

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ToggleButtons(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.getProportionalWidth(13)),
                  child: Text("Cep Telefonu"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.getProportionalWidth(13)),
                  child: Text("E-posta"),
                ),
              ],
              isSelected: isSelected,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }
                });
              },
              borderRadius: BorderRadius.circular(8.0),
              selectedColor: AppColors.backgroundwhite,
              fillColor: AppColors.onboardBackground,
              borderColor: AppColors.onboardBackground,
              selectedBorderColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 20),
            if (isSelected[0]) ...[
              Image.asset(
                'assets/images/login1.jpg',
                fit: BoxFit.fitHeight,
                height: SizeConfig.getProportionalHeight(30),
                width: double.infinity,
              ),
            ] else ...[
              Image.asset(
                'assets/images/login2.jpg',
                fit: BoxFit.fitHeight,
                height: SizeConfig.getProportionalHeight(25),
                width: double.infinity,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
