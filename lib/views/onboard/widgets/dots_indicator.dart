part of '../onboard_screen.dart';

Row customDotsIndicator(int currentPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      sliderData.length,
      (index) => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 3.0),
        height: SizeConfig.getProportionalHeight(1.3),
        width: SizeConfig.getProportionalHeight(
            1.3), // Tüm noktalar aynı genişlikte olacak
        decoration: BoxDecoration(
          color: currentPage == index
              ? Colors.white
              : Colors.transparent, // Aktif olan beyaz, diğerleri şeffaf
          border: Border.all(
            color: Colors.white, // Kenarlar beyaz
            width: 1.0, // Kenar genişliği
          ),
          borderRadius: BorderRadius.circular(100.0), // Yuvarlak kenarlar
        ),
      ),
    ),
  );
}
