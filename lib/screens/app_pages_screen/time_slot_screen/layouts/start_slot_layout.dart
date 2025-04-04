import '../../../../config.dart';

class StartSlotLayout extends StatelessWidget {
  final String? title;
  final bool? isSwitch;

  const StartSlotLayout({super.key, this.title, this.isSwitch = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Sizes.s38,
        width: Sizes.s83,
        child: Text(isSwitch == false ? "-" : title!,
                textAlign: TextAlign.center,
                style: appCss.dmDenseMedium12.textColor(title == "00:00"
                    ? appColor(context).lightText
                    : appColor(context).darkText))
            .alignment(Alignment.center)
            .boxShapeExtension(
                color: isSwitch == false
                    ? appColor(context).borderStroke
                    : appColor(context).whiteBg,
                radius: AppRadius.r6));
  }
}
