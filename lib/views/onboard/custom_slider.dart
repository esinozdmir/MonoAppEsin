part of 'onboard_screen.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        pageViewWidget(_pageController, _currentPage, (index) {
          setState(() {
            _currentPage = index;
          });
        }),
        // Sayfanın altında noktalar
        customDotsIndicator(_currentPage),
        SizedBox(height: SizeConfig.getProportionalHeight(3)),
        // Kayıt Ol butonu
        registerButton(context),
        SizedBox(
            height: SizeConfig.getProportionalHeight(
                2.5)), // Butonlar arasında boşluk
        // Giriş Yap kısmı

        signUpText(context),
        SizedBox(
            height: SizeConfig.getProportionalHeight(
                5)), // Butonlar ile alt kenar arasında boşluk
      ],
    );
  }
}
