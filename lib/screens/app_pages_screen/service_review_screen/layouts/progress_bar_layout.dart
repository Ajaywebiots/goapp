import '../../../../config.dart';
import '../../../../widgets/progress_bar_common.dart';

class ProgressBarLayout extends StatelessWidget {
  final int? data;
  final int? index;
  final List? list;

  const ProgressBarLayout({super.key, this.data, this.list, this.index});

  @override
  Widget build(BuildContext context) {
    final starRatings = [5, 4, 3, 2, 1];
    int star = (index != null && index! < starRatings.length)
        ? starRatings[index!]
        : 1;

    return Row(children: [
      Text("$star ${language(context, appFonts.star)}",
          style: appCss.dmDenseMedium13.textColor(appColor(context).darkText)),
      Expanded(
          child: ProgressBar(max: 100, current: data?.toString() ?? "0")
              .paddingSymmetric(horizontal: Insets.i15)),
      Text("${data ?? 0}%",
          style: appCss.dmDenseMedium12.textColor(appColor(context).lightText))
    ]).paddingOnly(
        bottom: (index != null && index != list!.length - 1) ? Insets.i10 : 0);
  }
}
