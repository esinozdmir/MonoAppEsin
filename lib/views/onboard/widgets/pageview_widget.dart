part of '../onboard_screen.dart';

Expanded pageViewWidget(PageController pageController, int currentPage,
    Function(int) onPageChanged) {
  return Expanded(
    child: PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: sliderData.length,
      itemBuilder: (context, index) {
        return SliderItem(
          image: sliderData[index]['image']!,
          title: sliderData[index]['title']!,
          subtitle: sliderData[index]['subtitle']!,
        );
      },
    ),
  );
}
