import '../../../../config.dart';
import '../../../../widgets/dotted_line.dart';
import '../../../../widgets/flutter_switch_common.dart';
import '../../time_slot_screen/layouts/start_slot_layout.dart';

class AllTimeSlotLayout extends StatelessWidget {
  final dynamic data;
  final ValueChanged<bool>? onToggle;
  final int? index;
  final List? list;
  final GestureTapCallback? onTap;

  const AllTimeSlotLayout(
      {super.key, this.data, this.onToggle, this.index, this.list, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(data["days"].toUpperCase(),
                style:
                    appCss.dmDenseMedium12.textColor(appColor(context).primary))
            .paddingAll(Insets.i10)
            .decorated(
                shape: BoxShape.circle,
                color: appColor(context).primary.withOpacity(0.1)),
        Row(children: [
          StartSlotLayout(title: data["start_at"], isSwitch: data["status"])
              .inkWell(onTap: onTap),
          const HSpace(Sizes.s12),
          StartSlotLayout(title: data["end_at"], isSwitch: data["status"])
              .inkWell(onTap: onTap)
        ]),
        FlutterSwitchCommon(value: data["status"], onToggle: onToggle)
      ]),
      if (index != list!.length - 1)
        const DottedLines().paddingSymmetric(vertical: Insets.i12)
    ]).paddingSymmetric(horizontal: Insets.i15);
  }
}
