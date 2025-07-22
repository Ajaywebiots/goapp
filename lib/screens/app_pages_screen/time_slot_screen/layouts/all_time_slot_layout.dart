import 'package:goapp/screens/app_pages_screen/time_slot_screen/layouts/start_slot_layout.dart';
import '../../../../config.dart';
import '../../../../widgets/dotted_line.dart';

class AllTimeSlotLayout extends StatelessWidget {
  final dynamic data;
  final ValueChanged<bool>? onToggle;
  final int? index;
  final List? list;
  final GestureTapCallback? onTap, onTapSecond;

  const AllTimeSlotLayout(
      {super.key,
      this.data,
      this.onToggle,
      this.index,
      this.list,
      this.onTap,
      this.onTapSecond});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(data["days"],
            style: appCss.dmDenseMedium12.textColor(appColor(context).primary)),
        Row(children: [
          // Container(
          //     height: 38,
          //     decoration: BoxDecoration(
          //         color: appColor(context).stroke,
          //         borderRadius: BorderRadius.all(Radius.circular(6)))),
          StartSlotLayout(title: data["start_at"], isSwitch: data["status"])
              .inkWell(onTap: onTap),
          const HSpace(Sizes.s20),
          StartSlotLayout(title: data["end_at"], isSwitch: data["status"])
              .inkWell(onTap: onTapSecond)
        ])
      ]),
      if (index != list!.length - 1)
        DottedLines(color: appColor(context).stroke)
            .paddingSymmetric(vertical: Insets.i12)
    ]).paddingSymmetric(horizontal: Insets.i15);
  }
}
