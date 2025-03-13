import '../../../../config.dart';

class FilterRadioLayout extends StatelessWidget {
  final bool? isCheck;
  final GestureTapCallback? onTap;
  const FilterRadioLayout({super.key,this.isCheck,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Sizes.s22,
        height: Sizes.s22,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: isCheck == true ? appColor(context).appTheme.trans : appColor(context).appTheme.stroke),
            color: isCheck == true ? appColor(context).appTheme.primary.withOpacity(0.18) :  appColor(context).appTheme.trans ),
        child: isCheck == true ? Icon(Icons.circle,
            color: appColor(context).appTheme.primary, size: 13) : null).inkWell(onTap: onTap);
  }
}
