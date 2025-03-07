import 'dart:developer';

import '../../../config.dart';
import '../../../providers/bottom_providers/booking_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import 'layouts/booking_layout.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context2, dash, child) {
      return Consumer<BookingProvider>(builder: (context1, value, child) {
        return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 100),
              () => value.onFetchData(context, this)),
          child: LoadingComponent(
            child: Scaffold(
                appBar: AppBar(
                    leadingWidth: 80,
                    title: Text(language(context, appFonts.bookings),
                            style: appCss.dmDenseBold18
                                .textColor(appColor(context).darkText))
                        .paddingSymmetric(horizontal: Insets.i10),
                    actions: [
                      Container(
                              alignment: Alignment.center,
                              height: Sizes.s40,
                              width: Sizes.s40,
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    SvgPicture.asset(eSvgAssets.notification,
                                        alignment: Alignment.center,
                                        fit: BoxFit.scaleDown,
                                        colorFilter: ColorFilter.mode(
                                            appColor(context).darkText,
                                            BlendMode.srcIn)),
                                    Positioned(
                                        top: 2,
                                        right: 2,
                                        child: Icon(Icons.circle,
                                            size: Sizes.s7,
                                            color: appColor(context).red))
                                  ]))
                          .decorated(
                              shape: BoxShape.circle,
                              color: appColor(context).fieldCardBg)
                          .inkWell(onTap: () {})
                          .paddingOnly(
                              left: rtl(context) ? Insets.i20 : 0,
                              right: rtl(context) ? 0 : Insets.i20)
                    ]),
                body: RefreshIndicator(
                    onRefresh: () async {
                      dash.getBookingHistory(context);
                    },
                    child: dash.isSearchData
                        ? EmptyLayout(
                            title: appFonts.noMatching,
                            subtitle: appFonts.attemptYourSearch,
                            buttonText: appFonts.refresh,
                            isBooking: true,
                            bTap: () {
                              value.clearTap(context, isBack: false);
                              dash.getBookingHistory(context);
                            },
                            widget: Stack(children: [
                              Image.asset(eImageAssets.noSearch,
                                      height: Sizes.s346)
                                  .paddingOnly(top: Insets.i40),
                              if (value.animationController != null)
                                Positioned(
                                    left: 40,
                                    top: 0,
                                    child: RotationTransition(
                                        turns: Tween(begin: 0.01, end: -.01)
                                            .chain(CurveTween(
                                                curve: Curves.easeIn))
                                            .animate(
                                                value.animationController!),
                                        child: Image.asset(eImageAssets.mGlass,
                                            height: Sizes.s190,
                                            width: Sizes.s178)))
                            ]))
                        : value.bookingList.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    const VSpace(Sizes.s25),
                                    Text(language(context, appFonts.allBooking),
                                            style: appCss.dmDenseBold18
                                                .textColor(
                                                    appColor(context).darkText))
                                        .paddingSymmetric(
                                            horizontal: Insets.i20),
                                    const VSpace(Sizes.s15),
                                    /*...value.bookingList.asMap().entries.map((e) =>
                                BookingLayout(
                                    data: e.value,
                                    index: e.key,
                                    editLocationTap: () =>
                                        value.editAddress(context, e.value),
                                    editDateTimeTap: () =>
                                        value.editDateTimeTap(context, e.value),
                                    onTap: () =>
                                        value.onTapBookings(e.value, context)))*/
                                    Expanded(
                                      child: ListView.builder(
                                          controller: value.scrollController,
                                          itemCount: value.bookingList.length,
                                          itemBuilder: (context, index) {
                                            return BookingLayout(
                                                data: value.bookingList[index],
                                                index: index,
                                                editLocationTap: () => value
                                                    .editAddress(
                                                        context,
                                                        value.bookingList[
                                                            index]),
                                                editDateTimeTap: () => value
                                                    .editDateTimeTap(
                                                        context,
                                                        value.bookingList[
                                                            index]),
                                                onTap: () =>
                                                    value.onTapBookings(
                                                        value
                                                            .bookingList[index],
                                                        context));
                                          }),
                                    ),
                                    VSpace(dash.isTap ? 0 : Insets.i80)
                                  ])
                            : EmptyLayout(
                                title: appFonts.ohhNoList,
                                subtitle: appFonts.yourBookingList,
                                buttonText: appFonts.refresh,
                                bTap: () => dash.getBookingHistory(context),
                                widget: Stack(children: [
                                  Image.asset(eImageAssets.noList,
                                      height: Sizes.s306)
                                ])))),
          ),
        );
      });
    });
  }
}
