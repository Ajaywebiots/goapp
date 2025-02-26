import '../../../../config.dart';

class AnimationLayoutOne extends StatelessWidget {
  const AnimationLayoutOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context, value, child) {
      return Stack(alignment: Alignment.topCenter, children: [
        Center(
            child: Container(
                decoration: BoxDecoration(
                    color: appColor(context).stroke, shape: BoxShape.circle),
                height: Insets.i325,
                width: Insets.i320)),
        Center(
            child: Container(
                decoration: BoxDecoration(
                    color: appColor(context).whiteBg, shape: BoxShape.circle),
                height: Insets.i315,
                width: Insets.i400)),
        Image.asset(height: 315, eImageAssets.onImage)
      ]);
    });
  }
}
