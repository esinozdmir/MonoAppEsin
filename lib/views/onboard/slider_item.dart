part of 'onboard_screen.dart';

class SliderItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const SliderItem({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: SizeConfig.getProportionalHeight(4),
          color: AppColors.backgroundwhite,
        ),
        Image.asset(image,
            fit: BoxFit.cover, height: SizeConfig.getProportionalHeight(50)),
        SizedBox(height: SizeConfig.getProportionalHeight(8)),
        Text(
          title,
          style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: AppColors.greenLine,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.titleColor),
        ),
        //customDivider(),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getProportionalWidth(10)),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.subtitleColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
