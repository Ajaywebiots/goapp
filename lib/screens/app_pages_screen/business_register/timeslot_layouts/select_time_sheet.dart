import 'package:flutter/cupertino.dart';
import 'package:goapp/screens/app_pages_screen/business_register/timeslot_layouts/select_time_wheel_layout.dart';

import '../../../../config.dart';
import '../../../../providers/app_pages_provider/business_time_slot_provider.dart';
import '../../time_slot_screen/layouts/am_pm_layout.dart';
import '../../time_slot_screen/layouts/hour_layout.dart';
import '../../time_slot_screen/layouts/min_layout.dart';

class SelectTimeSheet extends StatelessWidget {
  const SelectTimeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Consumer<BusinessTimeSlotProvider>(
          builder: (context, value, child) {
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.58,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
                child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(language(context, "Select Time"),
                    style: appCss.dmDenseblack18
                        .textColor(appColor(context).darkText)),
                const Icon(CupertinoIcons.multiply)
                    .inkWell(onTap: () => route.pop(context))
              ]).paddingAll(Insets.i20),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SelectTimeWheelLayout(
                        childCount: 12,
                        controller: value.controller,
                        onSelectedItemChanged: (val) => value.onHourChange(val),
                        builder: (context, index) {
                          return HourLayout(
                              hours: index + 1,
                              index: index,
                              selectIndex: value.scrollHourIndex);
                        }),
                    const HSpace(Sizes.s12),
                    SelectTimeWheelLayout(
                        childCount: 59,
                        onSelectedItemChanged: (val) => value.onMinChange(val),
                        builder: (context, index) {
                          return MyMinutes(
                              index: index,
                              selectIndex: value.scrollMinIndex,
                              min: index + 1);
                        }),
                    const HSpace(Sizes.s12),
                    SelectTimeWheelLayout(
                        childCount: 2,
                        onSelectedItemChanged: (val) => value.onAmPmChange(val),
                        builder: (context, index) {
                          if (index == 0) {
                            return AmPmLayout(
                                index: index,
                                selectIndex: value.scrollDayIndex,
                                isItAm: true);
                          } else {
                            return AmPmLayout(
                                index: index,
                                selectIndex: value.scrollDayIndex,
                                isItAm: false);
                          }
                        })
                  ]).paddingSymmetric(horizontal: Insets.i20),
              ButtonCommon(title: "Add Time")
                  .paddingSymmetric(horizontal: Insets.i20)
            ]))).bottomSheetExtension(context);
      });
    });
  }
}
