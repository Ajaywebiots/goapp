import '../../../../config.dart';

class ReadMoreLayout extends StatelessWidget {
  final String? text;
  final int? trimLines;

  const ReadMoreLayout({super.key, this.text, this.trimLines});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(text ?? "",
        trimLines: trimLines ?? 2,
        style: TextStyle(
            color: appColor(context).darkText,
            fontFamily: GoogleFonts.dmSans().fontFamily,
            fontWeight: FontWeight.w500),
        colorClickableText: appColor(context).darkText,
        trimMode: TrimMode.Line,
        lessStyle: appCss.dmDenseRegular14
            .textColor(appColor(context).darkText)
            .underline(appColor(context).darkText),
        moreStyle: appCss.dmDenseRegular14
            .textColor(appColor(context).darkText)
            .underline(appColor(context).darkText),
        trimCollapsedText: 'Read more',
        trimExpandedText: ' Read less');
  }
}
