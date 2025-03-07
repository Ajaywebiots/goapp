import 'dart:async';

import 'package:nb_utils/nb_utils.dart';

import '../../../../config.dart';
import '../../../../models/category_model.dart';

class TopCategoriesLayout extends StatelessWidget {
  final CategoryModel? data;
  final GestureTapCallback? onTap;
  final int? index, selectedIndex;
  final double? rPadding;

  const TopCategoriesLayout(
      {super.key,
      this.onTap,
      this.data,
      this.index,
      this.selectedIndex,
      this.rPadding});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: Sizes.s60,
          width: Sizes.s60,
          decoration: ShapeDecoration(
              color: selectedIndex == index
                  ? appColor(context).primary.withOpacity(0.2)
                  : appColor(context).fieldCardBg,
              shape: SmoothRectangleBorder(
                  side: BorderSide(
                      color: selectedIndex == index
                          ? appColor(context).primary
                          : appColor(context).trans),
                  borderRadius: SmoothBorderRadius(
                      cornerRadius: AppRadius.r10, cornerSmoothing: 1))),
          child: data!.media != null && data!.media!.isNotEmpty
              ? SvgPicture.asset(data!.media![0].originalUrl!,
                      colorFilter: ColorFilter.mode(
                          selectedIndex == index
                              ? appColor(context).primary
                              : appColor(context).darkText,
                          BlendMode.srcIn),
                      fit: BoxFit.fill,
                      height: Sizes.s24,
                      width: Sizes.s24)
                  .paddingAll(Insets.i17)
              : selectedIndex == index
                  ? Image.asset(eImageAssets.noImageFound1,
                          color: appColor(context).primary,
                          fit: BoxFit.cover,
                          height: Sizes.s24,
                          width: Sizes.s24)
                      .paddingAll(Insets.i18)
                  : Image.asset(eImageAssets.noImageFound1,
                          fit: BoxFit.cover,
                          height: Sizes.s24,
                          width: Sizes.s24)
                      .paddingAll(Insets.i18)),
      const VSpace(Sizes.s8),
      /*   Text(data!.title!,
          textAlign: TextAlign.center,

          style: appCss.dmDenseRegular13.textColor(selectedIndex == index
              ? appColor(context)primary
              : appColor(context)darkText))*/
      Marquee(
          directionMarguee: DirectionMarguee.oneDirection,
          animationDuration: const Duration(milliseconds: 1500),
          pauseDuration: const Duration(milliseconds: 1000),
          child: Text(language(context, data!.title!),
              textAlign: TextAlign.center,
              style: appCss.dmDenseRegular13.textColor(selectedIndex == index
                  ? appColor(context).primary
                  : appColor(context).darkText))),
    ]).width(Sizes.s68).inkWell(onTap: onTap);
  }
}

class ScrollingText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Axis scrollAxis;
  final double ratioOfBlankToScreen;

  const ScrollingText({
    super.key,
    required this.text,
    this.textStyle,
    this.scrollAxis = Axis.horizontal,
    this.ratioOfBlankToScreen = 0.25,
  });

  @override
  State<StatefulWidget> createState() {
    return ScrollingTextState();
  }
}

class ScrollingTextState extends State<ScrollingText>
    with SingleTickerProviderStateMixin {
  ScrollController? scrollController;
  double? screenWidth;
  double? screenHeight;
  double position = 0.0;
  Timer? timer;
  final double _moveDistance = 3.0;
  final int _timerRest = 100;
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      startTimer();
    });
  }

  void startTimer() {
    if (_key.currentContext != null) {
      double widgetWidth =
          _key.currentContext!.findRenderObject()!.paintBounds.size.width;
      double widgetHeight =
          _key.currentContext!.findRenderObject()!.paintBounds.size.height;

      timer = Timer.periodic(Duration(milliseconds: _timerRest), (timer) {
        double maxScrollExtent = scrollController!.position.maxScrollExtent;
        double pixels = scrollController!.position.pixels;
        if (pixels + _moveDistance >= maxScrollExtent) {
          if (widget.scrollAxis == Axis.horizontal) {
            position = (maxScrollExtent -
                        screenWidth! * widget.ratioOfBlankToScreen +
                        widgetWidth) /
                    2 -
                widgetWidth +
                pixels -
                maxScrollExtent;
          } else {
            position = (maxScrollExtent -
                        screenHeight! * widget.ratioOfBlankToScreen +
                        widgetHeight) /
                    2 -
                widgetHeight +
                pixels -
                maxScrollExtent;
          }
          scrollController!.jumpTo(position);
        }
        position += _moveDistance;
        scrollController!.animateTo(position,
            duration: Duration(milliseconds: _timerRest), curve: Curves.linear);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  Widget getBothEndsChild() {
    if (widget.scrollAxis == Axis.vertical) {
      String newString = widget.text.split("").join("\n");
      return Center(
        child: Text(
          newString,
          style: widget.textStyle,
          textAlign: TextAlign.center,
        ),
      );
    }
    return Center(
        child: Text(
      widget.text,
      style: widget.textStyle,
    ));
  }

  Widget getCenterChild() {
    if (widget.scrollAxis == Axis.horizontal) {
      return Container(width: screenWidth! * widget.ratioOfBlankToScreen);
    } else {
      return Container(height: screenHeight! * widget.ratioOfBlankToScreen);
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: _key,
      scrollDirection: widget.scrollAxis,
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        getBothEndsChild(),
        getCenterChild(),
        getBothEndsChild(),
      ],
    );
  }
}
