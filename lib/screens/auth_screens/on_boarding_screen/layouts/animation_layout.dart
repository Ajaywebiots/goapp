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
                height: 315,
                width: Insets.i300)),
        Center(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.white),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            value.onBoardingList[0].media!.source!)),
                    color: appColor(context).whiteBg,
                    shape: BoxShape.circle),
                height: Insets.i300))
        // Image.network(height: 315, value.onBoardingList[0].media!.source!)
      ]);
    });
  }
}
