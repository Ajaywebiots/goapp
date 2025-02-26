import '../../../../config.dart';

class AnimationLayoutSecond extends StatelessWidget {
  const AnimationLayoutSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
      builder: (context,value,child) {
        return Stack(alignment: Alignment.center, children: [
          if(value.animation != null)
          Stack(alignment: Alignment.topCenter, children: [
            // INNER CONTAINERS
            Center(
                child: Container(
                    decoration:  const BoxDecoration(
                          color: Color(0XFFD4D4D4), shape: BoxShape.circle),
                    height: 320,
                    width: 310)),
            Positioned(
                top: 19,
                right: 0,
                left: 0,
                child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: appColor(context).whiteBg, width: 3),
                            color: appColor(context).fieldCardBg,
                            shape: BoxShape.circle),
                        height: 300,
                        width: 400))),
          ]),

          // ROUND CONTAINER OUT OF CONTAINERS
          Stack(alignment: Alignment.center, children: [
            Container(
                height: 330,
                width: 350,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 13, color: appColor(context).whiteBg))),
              Positioned(
                  top: 21,
                  child: Container(
                      height: 300,
                      width: 408,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: appColor(context).whiteBg))))
          ]),

          Positioned(top: 20,child: Image.asset(height: 307, eImageAssets.onImage1))
        ]).paddingOnly(bottom: Insets.i50);
      }
    );
  }
}
