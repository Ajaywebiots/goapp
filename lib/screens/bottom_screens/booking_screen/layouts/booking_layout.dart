import 'dart:developer';

import 'package:goapp/screens/bottom_screens/booking_screen/layouts/service_provider_layout.dart';
import 'package:goapp/screens/bottom_screens/booking_screen/layouts/status_row.dart';
import 'package:intl/intl.dart';

import '../../../../config.dart';
import '../../../../models/booking_model.dart';
import '../../../../providers/bottom_providers/booking_provider.dart';

class BookingLayout extends StatefulWidget {
  final BookingModel? data;
  final GestureTapCallback? onTap, editLocationTap, editDateTimeTap;
  final int? index;

  const BookingLayout(
      {super.key,
      this.data,
      this.onTap,
      this.index,
      this.editLocationTap,
      this.editDateTimeTap});

  @override
  State<BookingLayout> createState() => _BookingLayoutState();
}

class _BookingLayoutState extends State<BookingLayout> {
  @override
  Widget build(BuildContext context) {
    // final value = Provider.of<BookingProvider>(context, listen: true);
    return Consumer<BookingProvider>(builder: (context1, value, child) {
      return Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text(widget.data!.bookingNumber!,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).primary)),
              const HSpace(Sizes.s5),
            ]),
            const VSpace(Sizes.s8),
            Text(language(context, widget.data!.service!.title!),
                style: appCss.dmDenseMedium16
                    .textColor(appColor(context).darkText)),
            Row(children: [
              Text(language(context, "0.00"),
                  style: appCss.dmDenseBold18
                      .textColor(appColor(context).darkText)),
              const HSpace(Sizes.s8),
              if (widget.data!.couponTotalDiscount != null)
                Text(
                    language(context,
                        "(${widget.data!.couponTotalDiscount!.round()}%)"),
                    style:
                        appCss.dmDenseMedium14.textColor(appColor(context).red))
            ])
          ]),
          widget.data!.service!.media != null &&
                  widget.data!.service!.media!.isNotEmpty
              ? Container(
                  height: Sizes.s84,
                  width: Sizes.s84,
                  decoration: ShapeDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              widget.data!.service!.media![0].originalUrl!),
                          fit: BoxFit.cover),
                      shape: const SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius.all(SmoothRadius(
                              cornerRadius: AppRadius.r10,
                              cornerSmoothing: 1)))))
              : Container(
                  height: Sizes.s84,
                  width: Sizes.s84,
                  decoration: ShapeDecoration(
                      image: DecorationImage(
                          image: AssetImage(eImageAssets.noImageFound1),
                          fit: BoxFit.cover),
                      shape: const SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius.all(SmoothRadius(
                              cornerRadius: AppRadius.r10,
                              cornerSmoothing: 1)))))
        ]),
        Image.asset(eImageAssets.bulletDotted)
            .paddingSymmetric(vertical: Insets.i12),
        StatusRow(
          title: appFonts.status,
          statusText: widget.data!.bookingStatus!.name!.toLowerCase(),
          statusId: widget.data!.bookingStatusId,
        ),
        if (widget.data!.bookingStatus!.name!.toLowerCase() !=
            appFonts.cancelled)
          StatusRow(
              statusText: widget.data!.bookingStatus!.name!.toLowerCase(),
              statusId: widget.data!.bookingStatusId,
              title: appFonts.selectedServicemen1,
              title2:
                  "${widget.data!.totalExtraServicemen != "0" ? widget.data!.totalExtraServicemen : "1"} ${language(context, appFonts.serviceman)}",
              style:
                  appCss.dmDenseMedium12.textColor(appColor(context).darkText)),
        StatusRow(
            statusText: widget.data!.bookingStatus!.name,
            statusId: widget.data!.bookingStatusId,
            title: appFonts.dateTime,
            onTap: widget.editDateTimeTap!,
            title2: DateFormat("dd MMM, yyyy - hh:mm aa")
                .format(DateTime.parse(widget.data!.dateTime!)),
            isDateLocation: widget.data!.bookingStatus!.name!.toLowerCase() ==
                    appFonts.pending
                ? true
                : false,
            style:
                appCss.dmDenseMedium12.textColor(appColor(context).darkText)),
        StatusRow(
            statusText: widget.data!.bookingStatus!.name!.toLowerCase(),
            statusId: widget.data!.bookingStatusId,
            title: appFonts.location,
            onTap: widget.editLocationTap,
            title2:
                "${widget.data!.address!.country!.name}-${widget.data!.address!.state!.name}",
            isDateLocation: (widget.data!.bookingStatus!.name!.toLowerCase() ==
                    appFonts.pending &&
                widget.data!.bookingStatus!.name!.toLowerCase() !=
                    appFonts.cancelled),
            style:
                appCss.dmDenseMedium12.textColor(appColor(context).darkText)),
        if (widget.data!.bookingStatus!.name!.toLowerCase() !=
            appFonts.cancelled)
          StatusRow(
              statusText: widget.data!.bookingStatus!.name!.toLowerCase(),
              statusId: widget.data!.bookingStatusId,
              title: appFonts.payment,
              title2: widget.data!.bookingStatus!.name == "completed"
                  ? widget.data!.paymentStatus == "COMPLETED"
                      ? language(context, appFonts.paid)
                      : language(context, appFonts.notPaid)
                  : widget.data!.paymentStatus == "COMPLETED"
                      ? language(context, appFonts.paidInAdvance)
                      : language(context, appFonts.notPaid),
              style:
                  appCss.dmDenseMedium12.textColor(appColor(context).online)),
        Stack(alignment: Alignment.bottomCenter, children: [
          Column(children: [
            if (widget.data!.provider != null)
              ServiceProviderLayout(
                  title: language(context, appFonts.provider),
                  image: widget.data!.provider!.media != null &&
                          widget.data!.provider!.media!.isNotEmpty
                      ? widget.data!.provider!.media![0].originalUrl!
                      : null,
                  name: widget.data!.provider!.name,
                  rate: widget.data!.provider!.reviewRatings != null
                      ? widget.data!.provider!.reviewRatings.toString()
                      : "0",
                  index: 0,
                  list: widget.data!.servicemen),
            if (widget.data!.servicemen!.isNotEmpty)
              widget.data!.isExpand!
                  ? Column(
                      children:
                          widget.data!.servicemen!.asMap().entries.map((s) {
                      return ServiceProviderLayout(
                          isProvider: false,
                          title: language(context, appFonts.serviceman)
                              .capitalizeFirst(),
                          image: s.value.media != null
                              ? s.value.media![0].originalUrl!
                              : null,
                          name: s.value.name,
                          rate: s.value.reviewRatings ?? "0",
                          index: s.key,
                          list: widget.data!.servicemen!);
                    }).toList())
                  : Column(
                      children: widget.data!.servicemen!
                          .getRange(0, 1)
                          .toList()
                          .asMap()
                          .entries
                          .map((s) {
                      return ServiceProviderLayout(
                          isProvider: false,
                          title: language(context, appFonts.serviceman)
                              .capitalizeFirst(),
                          image: s.value.media != null
                              ? s.value.media![0].originalUrl!
                              : null,
                          name: s.value.name,
                          rate: s.value.reviewRatings ?? "0",
                          index: s.key,
                          list: const []);
                    }).toList()),
          ])
              .paddingSymmetric(horizontal: Insets.i12)
              .boxShapeExtension(
                  color: appColor(context).fieldCardBg, radius: AppRadius.r15)
              .paddingOnly(
                  bottom: widget.data!.servicemen!.length > 1 ? Insets.i15 : 0),
          if (widget.data!.servicemen != null)
            if (widget.data!.servicemen!.length > 1)
              CommonArrow(
                  arrow: widget.data!.isExpand == true
                      ? eSvgAssets.upDoubleArrow
                      : eSvgAssets.downDoubleArrow,
                  isThirteen: true,
                  onTap: () => value.onExpand(widget.data, widget.index!),
                  color: appColor(context).whiteBg)
        ])
      ])
          .paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i20)
          .boxBorderExtension(context, isShadow: true)
          .paddingOnly(bottom: Insets.i15, left: Insets.i20, right: Insets.i20)
          .inkWell(onTap: widget.onTap);
    });
  }
}
