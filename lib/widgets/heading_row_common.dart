import '../config.dart';

class HeadingRowCommon extends StatelessWidget {
  final String? title, subTitle;
  final GestureTapCallback? onTap;
  final bool isTextSize;
  final bool isNotStatic;
  final TextStyle? style;

  const HeadingRowCommon(
      {super.key,
      this.title,
      this.onTap,
      this.isTextSize = false,
      this.subTitle,
      this.isNotStatic = false,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
          child: Text(language(context, title!),
              overflow: TextOverflow.clip,
              style: isNotStatic
                  ? style
                  : isTextSize
                      ? appCss.dmDenseBold18
                          .textColor(appColor(context).darkText)
                      : appCss.dmDenseBold16
                          .textColor(appColor(context).darkText))),
      Text(language(context, subTitle ?? appFonts.viewAll),
              style:
                  appCss.dmDenseRegular14.textColor(appColor(context).primary))
          .inkWell(onTap: onTap)
    ]);
  }
}
