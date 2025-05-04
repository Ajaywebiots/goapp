import '../config.dart';

class EditReviewLayout extends StatelessWidget {
  final dynamic data;
  final int? selectIndex, index;
  final GestureTapCallback? onTap;

  const EditReviewLayout(
      {super.key, this.data, this.index, this.selectIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectIndex == index;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      GestureDetector(
          onTap: onTap,
          child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: isSelected
                          ? appColor(context).primary
                          : Colors.grey.shade300,
                      width: 1),
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                          color: appColor(context).primary.withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 4))
                  ]),
              child: SvgPicture.asset(data["icon"],
                  height: 28,
                  width: 28,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                      isSelected
                          ? appColor(context).primary
                          : appColor(context).lightText,
                      BlendMode.srcIn)))),
      VSpace(Insets.i6),
      Text(language(context, data["title"]),
          textAlign: TextAlign.center,
          style: appCss.dmDenseMedium12.textColor(isSelected
              ? appColor(context).primary
              : appColor(context).lightText))
    ]);
  }
}
