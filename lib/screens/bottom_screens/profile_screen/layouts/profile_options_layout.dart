import 'package:goapp/screens/bottom_screens/profile_screen/layouts/profile_option_layout.dart';

import '../../../../config.dart';
import '../../../../providers/bottom_providers/profile_provider.dart';
import 'become_provider_layout.dart';

class ProfileOptionsLayout extends StatelessWidget {
  final AnimationController controller;
  final TickerProvider? sync;
  const ProfileOptionsLayout({super.key, required this.controller, this.sync});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<ProfileProvider>(context, listen: true);

    return Column(
        children: value.profileLists
            .asMap()
            .entries
            .map((e) =>
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  if (e.key != 2)
                    Text(
                            language(context, e.value.title)
                                .toString()
                                .toUpperCase(),
                            style: appCss.dmDenseBold14.textColor(e.key == 3
                                ? appColor(context).red
                                : appColor(context).primary))
                        .paddingSymmetric(vertical: Insets.i15),
                  if (e.value.data != null)
                    Container(
                        decoration: ShapeDecoration(
                            color: appColor(context).whiteBg,
                            shadows: [
                              BoxShadow(
                                  color: appColor(context)
                                      .darkText
                                      .withOpacity(0.06),
                                  spreadRadius: 1,
                                  blurRadius: 2)
                            ],
                            shape: SmoothRectangleBorder(
                                side: BorderSide(
                                    color: appColor(context).fieldCardBg),
                                borderRadius: SmoothBorderRadius(
                                    cornerRadius: AppRadius.r12,
                                    cornerSmoothing: 1))),
                        child: Column(children: [
                          ...e.value.data!.asMap().entries.map((s) =>
                              ProfileOptionLayout(
                                  data: s.value,
                                  index: s.key,
                                  list: e.value.data,
                                  onTap: () => value.onTapOption(
                                      s.value, context, controller, sync))),
                        ]).paddingAll(Insets.i15)),
                  if (e.key == 2) const BecomeProviderLayout()
                ]))
            .toList());
  }
}
