import 'dart:convert';
import 'dart:developer';

import 'package:goapp/common_tap.dart';
import 'package:goapp/config.dart';
import 'package:goapp/widgets/alert_message_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../models/cart_model.dart';
import '../../models/checkout_model.dart';
import '../../models/coupon_model.dart';
import '../../models/service_model.dart';
import 'dashboard_provider.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> cartList = [];
  CouponModel? data;
  bool isLoading = false;
  dynamic checkoutBody;
  AnimationController? animationController;
  bool isPositionedRight = false;
  bool isAnimateOver = false;
  AnimationController? controller;
  Animation<Offset>? offsetAnimation;
  CheckoutModel? checkoutModel;

  onCode(context, values) {
    data = values;
    notifyListeners();
  }

  // onReady(context) async {
  //   notifyListeners();
  //   try {
  //     cartList = appArray.cartList.map((e) => CartModel.fromJson(e)).toList();
  //
  //     notifyListeners();
  //   } catch (e) {
  //     log("cartList : $e");
  //   }
  // }

  // onServiceDetail(context, {data, packageServices, totalServiceman}) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //     builder: (context2) {
  //       return ServiceDetailLayout(
  //         data: data,
  //         packageService: packageServices,
  //         totalServiceman: totalServiceman,
  //       );
  //     },
  //   );
  // }

  int totalRequiredServiceMan(List<Services> service) {
    int count = 0;
    service.asMap().entries.forEach((element) {
      count = count + int.parse(element.value.selectedRequiredServiceMan!);
    });

    notifyListeners();
    return count;
  }

  editCart(CartModel cart, context, index) async {
    if (cart.isPackage!) {
      // route.pushNamed(context, routeName.selectServiceScreen, arg: {
      //   "services": cart.servicePackageList!,
      //   "id": cart.servicePackageList!.id
      // });
    } else {
      // onBook(context, cart.serviceList!,
      //
      //     addTap: () => onAdd(index),
      //     minusTap: () => onRemoveService(context, index));
    }
  }

  onRemoveService(context, index) {
    if (int.parse(cartList[index].serviceList!.selectedRequiredServiceMan!) ==
        1) {
      route.pop(context);
    } else {
      cartList[index].serviceList!.selectedRequiredServiceMan =
          (int.parse(cartList[index].serviceList!.selectedRequiredServiceMan!) -
                  1)
              .toString();
    }

    notifyListeners();
  }

  onAdd(index) {
    int count =
        int.parse(cartList[index].serviceList!.selectedRequiredServiceMan!);
    count++;
    cartList[index].serviceList!.selectedRequiredServiceMan = count.toString();

    notifyListeners();
  }

  deleteCart(context, index) async {
    route.pop(context);
    cartList.removeAt(index);
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(session.cart);
    List<String> personsEncoded =
        cartList.map((person) => jsonEncode(person.toJson())).toList();
    preferences.setString(session.cart, json.encode(personsEncoded));
    notifyListeners();
    completeSuccess(context);
  }

  completeSuccess(context) {
    showCupertinoDialog(
      context: context,
      builder: (context1) {
        return AlertDialogCommon(
          title: appFonts.successfullyDelete,
          height: Sizes.s140,
          image: eGifAssets.successGif,
          subtext: language(context, appFonts.cartDeletedSuccessfully),
          bText1: language(context, appFonts.okay),
          b1OnTap: () {
            route.pop(context);
          },
        );
      },
    );
  }

  onApplyRemoveTap(context) {
    if (data == null) {
      // route
      //     .pushNamed(context, routeName.couponListScreen)
      //     .then((values) => onCode(context, values));
    } else {
      data = null;
      notifyListeners();
    }
  }

  deleteCartConfirmation(context, sync, id) {
    animateDesign(sync);
    showDialog(
        context: context,
        builder: (context1) {
          return StatefulBuilder(builder: (context2, setState) {
            return Consumer<CartProvider>(builder: (context3, value, child) {
              return AlertDialog(
                  insetPadding:
                      const EdgeInsets.symmetric(horizontal: Insets.i20),
                  shape: const SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.all(SmoothRadius(
                          cornerRadius: AppRadius.r14, cornerSmoothing: 1))),
                  backgroundColor: appColor(context).whiteBg,
                  content: Stack(alignment: Alignment.topRight, children: [
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      // Gif
                      Stack(alignment: Alignment.topCenter, children: [
                        Stack(alignment: Alignment.topCenter, children: [
                          SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        SizedBox(
                                            height: Sizes.s180,
                                            width: Sizes.s150,
                                            child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                curve: isPositionedRight
                                                    ? Curves.bounceIn
                                                    : Curves.bounceOut,
                                                alignment: isPositionedRight
                                                    ? Alignment.center
                                                    : Alignment.topCenter,
                                                child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 200),
                                                    height: 40,
                                                    child: Image.asset(
                                                        eImageAssets
                                                            .cartTrash)))),
                                        Image.asset(eImageAssets.dustbin,
                                                height: Sizes.s88,
                                                width: Sizes.s88)
                                            .paddingOnly(bottom: Insets.i24)
                                      ]))
                              .decorated(
                                  color: appColor(context).fieldCardBg,
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r10)),
                        ]),
                        if (offsetAnimation != null)
                          SlideTransition(
                              position: offsetAnimation!,
                              child: (offsetAnimation != null &&
                                      isAnimateOver == true)
                                  ? Image.asset(eImageAssets.dustbinCover,
                                      height: 38)
                                  : const SizedBox())
                      ]),
                      // Sub text
                      const VSpace(Sizes.s15),
                      Text(language(context, appFonts.deleteCartSuccessfully),
                          textAlign: TextAlign.center,
                          style: appCss.dmDenseRegular14
                              .textColor(appColor(context).lightText)
                              .textHeight(1.2)),
                      const VSpace(Sizes.s20),
                      Row(children: [
                        Expanded(
                            child: ButtonCommon(
                                onTap: () => route.pop(context),
                                title: appFonts.no,
                                borderColor: appColor(context).primary,
                                color: appColor(context).whiteBg,
                                style: appCss.dmDenseSemiBold16
                                    .textColor(appColor(context).primary))),
                        const HSpace(Sizes.s15),
                        Expanded(
                            child: ButtonCommon(
                                color: appColor(context).primary,
                                fontColor: appColor(context).whiteColor,
                                onTap: () => deleteCart(context, id),
                                title: appFonts.yes))
                      ])
                    ]).padding(top: Insets.i40),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Title
                          Text(language(context, appFonts.successfullyDelete),
                              style: appCss.dmDenseExtraBold18
                                  .textColor(appColor(context).darkText)),
                          Icon(CupertinoIcons.multiply,
                                  size: Sizes.s20,
                                  color: appColor(context).darkText)
                              .inkWell(onTap: () => route.pop(context))
                        ])
                  ]));
            });
          });
        }).then((value) {
      isPositionedRight = false;
      isAnimateOver = false;
      notifyListeners();
    });
  }

  animateDesign(TickerProvider sync) {
    Future.delayed(DurationClass.ms500).then((value) {
      isPositionedRight = true;
      notifyListeners();
    }).then((value) {
      Future.delayed(DurationClass.ms150).then((value) {
        isAnimateOver = true;
        notifyListeners();
      }).then((value) {
        controller = AnimationController(
            vsync: sync, duration: const Duration(seconds: 2))
          ..forward();
        offsetAnimation = Tween<Offset>(
                begin: const Offset(0, 0.5), end: const Offset(0, 1))
            .animate(
                CurvedAnimation(parent: controller!, curve: Curves.elasticOut));
        notifyListeners();
      });
    });

    notifyListeners();
  }

  addServiceEmptyTap(context) {
    // route.pushNamedAndRemoveUntil(
    //     context, routeName.dashboard);
    final dash = Provider.of<DashboardProvider>(context, listen: false);
    dash.selectIndex = 0;
    dash.notifyListeners();
  }
}
