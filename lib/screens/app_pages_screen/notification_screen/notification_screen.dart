import '../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';
import 'layouts/notification_layout.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(builder: (context1, value, child) {
      return LoadingComponent(
          child: StatefulWrapper(
              onInit: () => Future.delayed(
                  DurationClass.ms50, () => value.onAnimate(this, context)),
              child: WillPopScope(
                  onWillPop: () async {
                    value.onBack();
                    return true;
                  },
                  child: DirectionalityRtl(
                      child: Scaffold(
                          appBar: AppBar(
                              leadingWidth: 80,
                              toolbarHeight: Sizes.s80,
                              title: Text(
                                  language(context, appFonts.notifications),
                                  style: appCss.dmDenseBold18
                                      .textColor(appColor(context).darkText)),
                              centerTitle: true,
                              leading: CommonArrow(
                                  arrow: rtl(context)
                                      ? eSvgAssets.arrowRight
                                      : eSvgAssets.arrowLeft,
                                  onTap: () {
                                    value.onBack();
                                    route.pop(context);
                                  }).paddingAll(Insets.i18),
                              actions: [
                                if (value.notificationList.isNotEmpty)
                                  CommonArrow(
                                      arrow: eSvgAssets.readAll,
                                      onTap: () => value.readAll(context)),
                                if (value.notificationList.isNotEmpty)
                                  const HSpace(Sizes.s10),
                                if (value.notificationList.isNotEmpty)
                                  CommonArrow(
                                          arrow: eSvgAssets.delete,
                                          color: appColor(context)
                                              .red
                                              .withOpacity(0.10),
                                          svgColor: appColor(context).red,
                                          onTap: () {
                                            value.notificationList.clear();
                                            value.notifyListeners();
                                          })
                                      .paddingOnly(
                                          right: rtl(context) ? 0 : Insets.i20,
                                          left: rtl(context) ? Insets.i20 : 0)
                              ]),
                          body: RefreshIndicator(
                              onRefresh: () async {
                                value.getNotificationList(context);
                              },
                              child: value.notificationList.isNotEmpty
                                  ? ListView(
                                      children: value.notificationList
                                          .asMap()
                                          .entries
                                          .map((e) => NotificationLayout(
                                              data: e.value,
                                              onTap: () => value.onTap(
                                                  e.value, context)))
                                          .toList())
                                  : EmptyLayout(
                                      title: appFonts.nothingHere,
                                      subtitle: appFonts.clickTheRefresh,
                                      buttonText: appFonts.refresh,
                                      bTap: () => value.onRefresh(context),
                                      widget: Image.asset(eImageAssets.noNoti,
                                          height: Sizes.s200))))))));
    });
  }
}
