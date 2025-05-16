import '../config.dart';

class EmptyLayout extends StatelessWidget {
  final String? title, subtitle, buttonText, inkText;
  final Widget? widget;
  final GestureTapCallback? bTap, inkOnTap;
  final bool isInk, isButtonShow, isBooking;
  final double? height, topHeight, horizon;

  const EmptyLayout(
      {super.key,
      this.subtitle,
      this.bTap,
      this.title,
      this.buttonText,
      this.widget,
      this.inkText,
      this.inkOnTap,
      this.isInk = false,
      this.isButtonShow = true,
      this.isBooking = false,
      this.height,
      this.topHeight,
      this.horizon});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: topHeight ?? Insets.i50),
          widget ?? const SizedBox(),
          SizedBox(height: Insets.i80),
          SizedBox(height: height),
          Column(children: [
            Text(language(context, title ?? ""),
                style:
                    appCss.dmDenseBold18.textColor(appColor(context).darkText)),
            const SizedBox(height: 8),
            Text(language(context, subtitle ?? ""),
                textAlign: TextAlign.center,
                style: appCss.dmDenseRegular14
                    .textColor(appColor(context).lightText))
          ]).paddingSymmetric(horizontal: horizon ?? 0),
          const SizedBox(height: Insets.i25),
          if (isButtonShow)
            Column(children: [
              ButtonCommon(title: buttonText ?? "", onTap: bTap)
                  .paddingOnly(bottom: isInk ? Insets.i15 : Insets.i100),
              if (isInk)
                Text(language(context, inkText ?? ""),
                        style: appCss.dmDenseMedium16
                            .textColor(appColor(context).primary))
                    .inkWell(onTap: inkOnTap)
                    .paddingOnly(bottom: Insets.i40)
            ])
        ]).paddingSymmetric(horizontal: Insets.i20);
  }
}
