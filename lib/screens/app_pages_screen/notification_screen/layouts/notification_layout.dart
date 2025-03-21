import 'package:intl/intl.dart';
import '../../../../config.dart';
import '../../../../models/notification_model.dart';
import '../../../../widgets/DirectionalityRtl.dart';

class NotificationLayout extends StatelessWidget {
  final NotificationModel? data;
  final GestureTapCallback? onTap;

  const NotificationLayout({super.key, this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return DirectionalityRtl(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                data!.data!.thumbnail != null
                    ? Image.asset(data!.data!.thumbnail!,
                            fit: BoxFit.fill,
                            color: data!.readAt != null
                                ? appColor(context).lightText
                                : appColor(context).darkText,
                            height: Sizes.s18)
                        .paddingAll(Insets.i7)
                        .decorated(
                            color: data!.readAt != null
                                ? appColor(context).fieldCardBg
                                : appColor(context).whiteBg,
                            shape: BoxShape.circle)
                    : Image.asset(eImageAssets.noImageFound1, height: Sizes.s18)
                        .paddingAll(Insets.i7)
                        .decorated(
                            color: data!.readAt != null
                                ? appColor(context).fieldCardBg
                                : appColor(context).whiteBg,
                            shape: BoxShape.circle),
                const HSpace(Sizes.s12),
                Text(data!.data!.title!,
                    style: appCss.dmDenseMedium14.textColor(data!.readAt != null
                        ? appColor(context).lightText
                        : appColor(context).darkText))
              ]),
              Text(checkCurrentDateShowMin(data!.createdAt!).toString(),
                  style: appCss.dmDenseRegular12
                      .textColor(appColor(context).lightText))
            ]),
        Row(children: [
          const SizedBox(height: Sizes.s32, width: Sizes.s32)
              .paddingSymmetric(horizontal: Insets.i6),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(data!.data!.message ?? "",
                        style: appCss.dmDenseRegular12.textColor(
                            data!.readAt != null
                                ? appColor(context).lightText
                                : appColor(context).darkText))
                    .paddingOnly(top: Insets.i2),
                if (data!.data!.image != null)
                  Image.asset(data!.data!.image!, height: Sizes.s53)
                      .paddingOnly(top: Insets.i10)
                      .decorated(
                          borderRadius: BorderRadius.circular(AppRadius.r4))
              ]))
        ])
      ])
          .paddingAll(Insets.i12)
          .boxBorderExtension(context,
              bColor: appColor(context).fieldCardBg,
              color: data!.readAt != null
                  ? appColor(context).whiteBg
                  : appColor(context).fieldCardBg,
              isShadow: data!.readAt != null ? true : false,
              radius: AppRadius.r12)
          .paddingOnly(bottom: Insets.i15, left: Insets.i20, right: Insets.i20)
          .inkWell(onTap: onTap),
    );
  }
}

checkCurrentDateShowMin(date) {
  DateTime now = DateTime.now();
  if (DateFormat("dd/MM/yyyy").format(now) ==
      DateFormat("dd/MM/yyyy").format(DateTime.parse(date))) {
    if (DateTime.now().difference(DateTime.parse(date)).inMinutes < 1) {
      return "seconds ago";
    } else if (DateTime.now().difference(DateTime.parse(date)).inMinutes < 60) {
      return "${DateTime.now().difference(DateTime.parse(date)).inMinutes} minutes";
    } else if (DateTime.now().difference(DateTime.parse(date)).inMinutes <
        1440) {
      return "${DateTime.now().difference(DateTime.parse(date)).inHours} hours";
    }
  } else {
    if (DateTime.now().difference(DateTime.parse(date)).inMinutes > 1440 &&
        DateTime.now().difference(DateTime.parse(date)).inMinutes <= 2880) {
      return "${DateTime.now().difference(DateTime.parse(date)).inDays} days";
    } else {
      return DateFormat("dd/MM/yyyy").format(DateTime.parse(date));
    }
  }
}
