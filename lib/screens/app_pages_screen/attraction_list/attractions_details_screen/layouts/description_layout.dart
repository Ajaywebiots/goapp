import '../../../../../config.dart';

class DescriptionLayout extends StatelessWidget {
  final String? icon, title, subtitle;
  final double? padding;

  const DescriptionLayout(
      {super.key, this.icon, this.title, this.subtitle, this.padding});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SvgPicture.asset(icon!,
            height: Sizes.s20,
            width: Sizes.s20,
            colorFilter:
                ColorFilter.mode(appColor(context).darkText, BlendMode.srcIn)),
        Container(height: Sizes.s15, width: 1, color: appColor(context).stroke)
            .paddingSymmetric(horizontal: Insets.i9, vertical: Insets.i3),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(language(context, title!),
                  style: appCss.dmDenseMedium12
                      .textColor(appColor(context).darkText)),
              Text(language(context, subtitle!),
                  style: appCss.dmDenseMedium12
                      .textColor(appColor(context).lightText))
            ],
          ),
        )
      ]),
    ]);
  }
}
