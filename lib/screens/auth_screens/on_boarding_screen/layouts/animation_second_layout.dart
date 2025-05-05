import '../../../../config.dart';

class AnimationLayoutSecond extends StatelessWidget {
  const AnimationLayoutSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context1, onboard, child) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Stack(alignment: Alignment.center, children: [
          Stack(alignment: Alignment.topCenter, children: [
            Center(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0XFFD4D4D4), shape: BoxShape.circle),
                    height: 305,
                    width: 305)),
            Positioned(
                top: 8,
                right: 0,
                left: 0,
                child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: appColor(context).whiteBg, width: 3),
                            color: appColor(context).fieldCardBg,
                            shape: BoxShape.circle),
                        height: 300,
                        width: 410))),
            ClipOval(
                child: Image.network(
                    width: 300,
                    fit: BoxFit.cover,
                    height: 305,
                    onboard.onBoardingList[1].media!.source!)),
            Image.asset(height: 170, eImageAssets.subtract)
          ]),
          Stack(alignment: Alignment.center, children: [
            Container(
                height: 330,
                width: 350,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 13, color: appColor(context).whiteBg))),
            Positioned(
                top: 21,
                child: Container(
                    height: 300,
                    width: 408,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 4, color: appColor(context).whiteBg))))
          ])
        ])
      ]).paddingOnly(bottom: Insets.i50);
    });
  }
}
