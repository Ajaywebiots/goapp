import 'dart:async';
import 'dart:developer';

import '../../../config.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context, onBoardPro, child) {
      return StatefulWrapper(
          onInit: () => Timer(const Duration(milliseconds: 150),
              () => onBoardPro.onReady(context)),
          onDispose: () => onBoardPro.onDispose(),
          child: Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                const LanguageDropDownLayout()
                    .paddingSymmetric(horizontal: Insets.i20)
                    .paddingOnly(top: Insets.i20, bottom: Insets.i20),
                onBoardPro.selectIndex == 0
                    ? const AnimationLayoutOne()
                    : onBoardPro.selectIndex == 1
                        ? const AnimationLayoutSecond()
                        : onBoardPro.selectIndex == 2
                            ? const AnimationLayoutThree()
                            : const AnimationFourthLayout(),
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
                    const DotIndicatorLayout()
                  ])
                ]).paddingDirectional(
                    horizontal: Insets.i20,
                    top: onBoardPro.selectIndex == 0 ? Insets.i110 : Insets.i55)
              ])))));
    });
  }
}
