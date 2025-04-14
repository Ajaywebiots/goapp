import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../config.dart';

class RatingLayout extends StatelessWidget {
  final double? initialRating;
  final Color? color;

  const RatingLayout({super.key, this.initialRating, this.color});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
        initialRating: initialRating ?? 4.5,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        maxRating: 5,
        textDirection: TextDirection.ltr,
        itemSize: Sizes.s14,
        itemPadding: EdgeInsets.zero,
        wrapAlignment: WrapAlignment.center,
        ignoreGestures: true,
        ratingWidget: RatingWidget(
            full: SvgPicture.asset(eSvgAssets.star,
                height: Sizes.s14,
                colorFilter: ColorFilter.mode(
                    color ?? appColor(context).primary, BlendMode.srcIn)),
            half: SvgPicture.asset(eSvgAssets.halfStar,
                height: Sizes.s14,
                colorFilter: ColorFilter.mode(
                    color ?? appColor(context).primary, BlendMode.srcIn)),
            empty: Container()),
        onRatingUpdate: (double value) {});
  }
}
