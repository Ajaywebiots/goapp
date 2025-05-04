import 'package:goapp/providers/app_pages_provider/business_time_slot_provider.dart';
import 'package:goapp/screens/app_pages_screen/business_register/timeslot_layouts/all_time_slot_layout.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/register_company_provider.dart';
import '../time_slot_screen/layouts/all_time_slot_layout.dart';

class BusinessSignUpFour extends StatelessWidget {
  const BusinessSignUpFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<BusinessTimeSlotProvider, SignUpCompanyProvider>(
        builder: (context1, value, companyCtrl, child) {
      return Form(
          key: companyCtrl.signupFormKey1,
          child: SingleChildScrollView(
              child: Column(children: [
            Stack(children: [
              const FieldsBackground(),
              Column(children: [
                Row(
                        children: appArray.timeSlotStartAtList
                            .asMap()
                            .entries
                            .map((e) => Text(language(context, e.value),
                                    style: appCss.dmDenseBold13
                                        .textColor(appColor(context).lightText))
                                .paddingOnly(
                                    right: e.key == 0
                                        ? Insets.i50
                                        : e.key == 1
                                            ? Insets.i50
                                            : Insets.i10))
                            .toList())
                    .paddingSymmetric(horizontal: Insets.i15),
                const VSpace(Sizes.s15),
                ...appArray.timeSlotList.asMap().entries.map((e) =>
                    BusinessAllTimeSlotLayout(
                        data: e.value,
                        index: e.key,
                        list: appArray.timeSlotList,
                        onTap: () => value.selectTimeBottomSheet(context),
                        onToggle: (val) => value.onToggle(e.value, val)))
              ])
            ])
          ])));
    });
  }
}
