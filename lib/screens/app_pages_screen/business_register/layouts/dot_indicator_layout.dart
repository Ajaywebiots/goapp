import 'package:goapp/config.dart';

class BusinessDotIndicator extends StatelessWidget {
  final int selectedIndex;

  const BusinessDotIndicator({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding =
        Insets.i20 * 2; // if not you're using horizontal padding
    final indicatorCount = 5;
    final spacing = 6.0;
    final totalSpacing = spacing * (indicatorCount - 1);

    final availableWidth = screenWidth - horizontalPadding - totalSpacing;
    final indicatorWidth = availableWidth / indicatorCount;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(indicatorCount, (index) {
        final isSelected = index == selectedIndex;

        return Container(
          width: indicatorWidth,
          height: 6,
          margin:
              EdgeInsets.only(right: index < indicatorCount - 1 ? spacing : 0),
          decoration: BoxDecoration(
            color: isSelected
                ? appColor(context).primary
                : appColor(context).stroke,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    ).paddingSymmetric(horizontal: Insets.i10);
  }
}
