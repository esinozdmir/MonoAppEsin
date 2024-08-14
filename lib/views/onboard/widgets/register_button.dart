part of '../onboard_screen.dart';

Padding registerButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.75, // %75 genişlik
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterScreen(), // Yönlendirilecek sayfa
            ),
          );
        },
        child: Text(
          'Kayıt Ol',
          style: TextStyle(color: AppColors.onboardBackground, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 48),
        ),
      ),
    ),
  );
}
