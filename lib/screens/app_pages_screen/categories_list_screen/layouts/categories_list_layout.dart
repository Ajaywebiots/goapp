
import '../../../../config.dart';
import '../../../../widgets/DirectionalityRtl.dart';

class CategoriesListLayout extends StatelessWidget {
  final data;
  final GestureTapCallback? onTap;

  const CategoriesListLayout({super.key, this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return DirectionalityRtl(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          Image.network(data.icon,
              fit: BoxFit.fill, height: Sizes.s20, width: Sizes.s20),
          const HSpace(Sizes.s12),
          SvgPicture.asset("assets/svg/line.svg", height: 16),
          const HSpace(Sizes.s12),
          Text(language(context, data?.translatedValue),
              style:
                  appCss.dmDenseMedium14.textColor(appColor(context).darkText))
        ]),
        SvgPicture.asset(
            rtl(context) ? eSvgAssets.arrowLeft : eSvgAssets.arrowRight,
            colorFilter:
                ColorFilter.mode(appColor(context).lightText, BlendMode.srcIn))
      ])
          .paddingAll(Insets.i15)
          .boxBorderExtension(context, isShadow: true)
          .inkWell(onTap: onTap)
          .paddingOnly(bottom: Insets.i12),
    );
  }
}
