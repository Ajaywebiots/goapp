import 'dart:async';
import 'dart:developer';
import 'package:goapp/config.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context, onBoardPro, child) {
      int index = onBoardPro.selectIndex;
      final mediaSource =
          (index >= 0 && index < onBoardPro.onBoardingList.length)
              ? onBoardPro.onBoardingList[index].media?.source
              : null;

      return StatefulWrapper(
          onInit: () => Timer(const Duration(milliseconds: 100),
              () => onBoardPro.onReady(context)),
          child: DirectionalityRtl(
              child: Scaffold(
                  body: SafeArea(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                const LanguageDropDownLayout()
                    .paddingSymmetric(horizontal: Insets.i20)
                    .paddingOnly(top: Insets.i20, bottom: Insets.i10),
                Container(
                  height: Insets.i432,
                  width: Insets.i335,
                  margin: EdgeInsets.only(
                      left: Insets.i20, right: Insets.i20, bottom: Insets.i5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(mediaSource ?? ''))),
                ),
                Stack(alignment: Alignment.center, children: [
                  Image.asset(eImageAssets.onBoardBox,
                          color: appColor(context).darkText.withOpacity(1))
                      .paddingOnly(bottom: Insets.i20),
                  Column(children: [
                    SizedBox(
                        height: Sizes.s120,
                        child: PageView.builder(
                            onPageChanged: (index) =>
                                onBoardPro.onPageChange(index),
                            itemCount: onBoardPro.onBoardingList.length,
                            controller: onBoardPro.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (pageContext, index) {
                              log("onBoardPro.onBoardingList[index]::${onBoardPro.onBoardingList[index].title}");
                              return BottomLayout(
                                  title: language(context,
                                      onBoardPro.onBoardingList[index].title),
                                  subText: language(
                                      context,
                                      onBoardPro
                                          .onBoardingList[index].description));
                            })),
                    const VSpace(Sizes.s10),
                    const DotIndicatorOnBoardingLayout()
                  ])
                ]).paddingDirectional(horizontal: Insets.i20)
              ])))));
    });
  }
}
