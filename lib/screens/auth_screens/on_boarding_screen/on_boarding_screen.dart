import 'dart:async';
import 'dart:developer';

import '../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context, onBoardPro, child) {
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
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Color(0xffD2D3D4)),
                        shape: BoxShape.circle),
                    child: Container(
                        height: Insets.i300,
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.white),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(onBoardPro
                                        .onBoardingList[onBoardPro.selectIndex]
                                        .media
                                        ?.source ??
                                    ''))))),
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
