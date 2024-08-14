part of '../onboard_screen.dart';

RichText signUpText(BuildContext context) {
  return RichText(
    text: TextSpan(
      text: 'Zaten Mono\'luyum ',
      style: TextStyle(color: AppColors.subtitleColor),
      children: <TextSpan>[
        TextSpan(
          text: 'Giriş Yap',
          style: TextStyle(
            color: AppColors.titleColor,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignupScreen(), // Yönlendirilecek sayfa
                ),
              );
            },
        ),
      ],
    ),
  );
}
