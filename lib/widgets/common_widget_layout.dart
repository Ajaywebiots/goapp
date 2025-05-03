import '../config.dart';

class CommonWidgetLayout {
  //small text box title and container layout
  Widget commonTitleWithSmallContainer(context, title) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const SmallContainer(),
          const HSpace(Sizes.s20),
          Text(language(context, title),
              style: appCss.dmDenseSemiBold14
                  .textColor(appColor(context).darkText))
        ]),
        const VSpace(Sizes.s8)
      ]);

  //none text input input decoration
  OutlineInputBorder noneDecoration({double? radius, Color? color}) =>
      OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(radius ?? AppRadius.r30)),
          borderSide: BorderSide(color: color ?? Color(0xFFEEEEEE)));
}
