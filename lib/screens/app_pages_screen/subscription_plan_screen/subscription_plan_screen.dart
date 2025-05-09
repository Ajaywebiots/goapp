import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../../config.dart';
import '../../../widgets/DirectionalityRtl.dart';

class SubscriptionPlanScreen extends StatelessWidget {
  const SubscriptionPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List sss = [
      {
        "icon": "assets/svg/shieldTick.svg",
        "title": "Add up to 10 service",
      },
      {
        "icon": "assets/svg/shieldTick.svg",
        "title": "Add up to 10 servicemen",
      },
      {
        "icon": "assets/svg/shieldTick.svg",
        "title": "Add up to 6 service location",
      },
      {
        "icon": "assets/svg/shieldTick.svg",
        "title": "Add up to 6 service in packages",
      }
    ];
    return DirectionalityRtl(
      child: Scaffold(
          body: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/subscription.png"))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VSpace(MediaQuery.of(context).size.height * (70 / 800)),
                  Image.asset(
                    eImageAssets.appLogo,
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  VSpace(MediaQuery.of(context).size.height * (70 / 800)),
                  Text('GOSALAMINA MEMBERSHIP',
                      style: appCss.dmDenseBold20
                          .textColor(appColor(context).whiteBg)),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                        TextSpan(
                            text: 'FOR JUST ',
                            style: appCss.dmDenseRegular14.textColor(
                                appColor(context)
                                    .whiteBg
                                    .withValues(alpha: 0.7))),
                        TextSpan(
                            text: '€1 PER MONTH',
                            style: appCss.dmDenseBold14.textColor(
                                appColor(context)
                                    .whiteBg
                                    .withValues(alpha: 0.7))),
                        TextSpan(
                            text: ' (BILLED ANNUALLY)',
                            style: appCss.dmDenseRegular14.textColor(
                                appColor(context)
                                    .whiteBg
                                    .withValues(alpha: 0.7)))
                      ])),
                  VSpace(MediaQuery.of(context).size.height * (17 / 800)),
                  Text(
                          textAlign: TextAlign.center,
                          ' Join now and enjoy instant access to exclusive deals and discounts  from top businesses.By joining you support local businesses and experience a more rewarding way to shop!',
                          style: appCss.dmDenseMedium14.textColor(
                              appColor(context).whiteBg.withValues(alpha: 0.8)))
                      .marginSymmetric(horizontal: 18),
                  VSpace(MediaQuery.of(context).size.height * (30 / 800)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          SvgPicture.asset("assets/svg/shield.svg"),
                          HSpace(Insets.i10),
                          Text('Redeem as many offers as you want',
                              style: appCss.dmDenseMedium15
                                  .textColor(appColor(context).whiteBg))
                        ]),
                        VSpace(Insets.i10),
                        Row(children: [
                          SvgPicture.asset("assets/svg/shield.svg"),
                          HSpace(Insets.i10),
                          Text('Save hundreds of euros over the year',
                              style: appCss.dmDenseMedium15
                                  .textColor(appColor(context).whiteBg))
                        ]),
                        VSpace(Insets.i10),
                        Row(children: [
                          SvgPicture.asset("assets/svg/shield.svg"),
                          HSpace(Insets.i10),
                          Text('Wide variety of local business offers',
                              style: appCss.dmDenseMedium15
                                  .textColor(appColor(context).whiteBg))
                        ]),
                        VSpace(Insets.i10),
                        Row(children: [
                          SvgPicture.asset("assets/svg/shield.svg"),
                          HSpace(Insets.i10),
                          Text('Real-Time Alerts and News',
                              style: appCss.dmDenseMedium15
                                  .textColor(appColor(context).whiteBg))
                        ]),
                        VSpace(Insets.i10),
                        Row(children: [
                          SvgPicture.asset("assets/svg/shield.svg"),
                          HSpace(Insets.i10),
                          Text('Limited-time offer for Summer 2025',
                              style: appCss.dmDenseMedium15
                                  .textColor(appColor(context).whiteBg))
                        ])
                      ]).marginOnly(
                      left: MediaQuery.of(context).size.width * (25 / 360)),
                  VSpace(MediaQuery.of(context).size.height * (20 / 800)),
                  Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width *
                                  (60 / 800)),
                          alignment: Alignment.centerLeft,
                          height: 68,
                          width:
                              MediaQuery.of(context).size.width * (300 / 360),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/subscriptionLayout.png"))),
                          child: Text("Unlock Your Full Potential",
                              style: appCss.dmDenseBold16
                                  .textColor(appColor(context).darkText)))
                      .inkWell(onTap: () {
                    route.pushNamed(context, routeName.payPalSubscriptionPage);
                  })
                ]))
        // Column(children: [
        //   ClipRRect(
        //       borderRadius:
        //           BorderRadius.vertical(top: Radius.circular(8)),
        //       child: Image.asset("assets/images/sale.png",
        //           width: MediaQuery.of(context).size.width,
        //           height: Insets.i154,
        //           fit: BoxFit.cover)),
        //   VSpace(Insets.i30),
        //   Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //     Text("User Subscription Plan Details",
        //         style: appCss.dmDenseBold14
        //             .textColor(appColor(context).darkText)),
        //     DottedLine(dashColor: Color(0xffE5E8EA))
        //         .paddingDirectional(top: 15, bottom: 15),
        //     Text(
        //         style: appCss.dmDenseRegular14
        //             .textColor(appColor(context).darkText),
        //         'This business was founded in 2021 by Kurt. Working well together, he and his staff. This business was founded in 2021 by Kurt. Working well together, he and his staff.')
        //   ]).marginOnly(
        //       left: Insets.i15, right: Insets.i15, bottom: Insets.i30)
        // ])
        //     .boxBorderExtension(context, isShadow: true)
        //     .paddingDirectional(horizontal: Insets.i20),
        // VSpace(Insets.i27),
        // Container(
        //     width: 255,
        //     decoration: BoxDecoration(
        //         image: DecorationImage(
        //             fit: BoxFit.fill,
        //             image: AssetImage("assets/images/subsImage.png"))),
        //     child: Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           VSpace(Insets.i30),
        //           Text("\$12",
        //               style: appCss.dmDenseBold22
        //                   .textColor(appColor(context).darkText)),
        //           Text("/Year",
        //               style: appCss.dmDenseMedium12
        //                   .textColor(appColor(context).lightText)),
        //           VSpace(Insets.i34),
        //           Text("ELITE CLUB",
        //               style: appCss.dmDenseBold20
        //                   .textColor(appColor(context).whiteBg)),
        //           VSpace(Insets.i20),
        //           ...sss.asMap().entries.map((e) => Row(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     SvgPicture.asset(e.value['icon']),
        //                     HSpace(Insets.i8),
        //                     Expanded(
        //                         child: Text(e.value['title'],
        //                             style: appCss.dmDenseMedium14
        //                                 .textColor(
        //                                     appColor(context).whiteBg),
        //                             overflow: TextOverflow.fade)),
        //                   ]).paddingOnly(bottom: Insets.i15)),
        //           VSpace(Insets.i5),
        //           Image.asset('assets/images/dotted_line.png'),
        //           VSpace(Insets.i15),
        //           Text(
        //               textAlign: TextAlign.center,
        //               "Take your service business to the next level by choosing this.",
        //               style: appCss.dmDenseRegular12
        //                   .textColor(appColor(context).whiteBg)),
        //           VSpace(Insets.i25),
        //           ButtonCommon(
        //               onTap: () {
        //                 showDialog(
        //                   context: context,
        //                   builder: (context) {
        //                     return DirectionalityRtl(
        //                       child: AlertDialog(
        //                         contentPadding: EdgeInsets.zero,
        //                         insetPadding: const EdgeInsets.symmetric(
        //                             horizontal: 20),
        //                         shape: RoundedRectangleBorder(
        //                             borderRadius:
        //                                 BorderRadius.circular(15)),
        //                         content: SingleChildScrollView(
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(20),
        //                             child: Column(
        //                               mainAxisSize: MainAxisSize.min,
        //                               children: [
        //                                 Row(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment
        //                                             .spaceBetween,
        //                                     children: [
        //                                       Text("PayPal Payment",
        //                                           style: appCss
        //                                               .dmDenseMedium18),
        //                                       Icon(CupertinoIcons
        //                                               .multiply)
        //                                           .inkWell(
        //                                               onTap: () => route
        //                                                   .pop(context))
        //                                     ]),
        //                                 VSpace(Insets.i15),
        //                                 Text(
        //                                     "Please select your top-up amount",
        //                                     style:
        //                                         appCss.dmDenseRegular14),
        //                                 VSpace(Insets.i10),
        //                                 DropdownButton<String>(
        //                                   value: "10 USD",
        //                                   items: [
        //                                     "10 USD",
        //                                     "20 USD",
        //                                     "50 USD"
        //                                   ]
        //                                       .map((e) =>
        //                                           DropdownMenuItem(
        //                                               value: e,
        //                                               child: Text(e)))
        //                                       .toList(),
        //                                   onChanged: (_) {},
        //                                 ),
        //                                 VSpace(Insets.i20),
        //                                 // Debit or Credit Card button
        //                                 ButtonCommon(
        //                                     isRightIcon: true,
        //                                     rightIcon: Icon(
        //                                         color: Colors.white,
        //                                         CupertinoIcons
        //                                             .creditcard),
        //                                     color: appColor(context)
        //                                         .darkText,
        //                                     title: "Debit or Credit Card",
        //                                     onTap: () {}),
        //                                 VSpace(Insets.i20),
        //                                 Row(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment.end,
        //                                     children: [
        //                                       Icon(CupertinoIcons
        //                                               .multiply)
        //                                           .inkWell(onTap: () {})
        //                                     ]),
        //                                 VSpace(Insets.i20),
        //
        //                                 // Card Info
        //                                 // TextFormField(
        //                                 //     decoration: const InputDecoration(
        //                                 //         labelText: "Card number")),
        //                                 TextFieldCommon1(
        //                                     hintText: 'Card number'),
        //                                 VSpace(Insets.i12),
        //                                 Row(children: [
        //                                   Expanded(
        //                                     child: TextFieldCommon1(
        //                                         hintText: 'Expires'),
        //                                   ),
        //                                   const SizedBox(width: 10),
        //                                   Expanded(
        //                                     child: TextFieldCommon1(
        //                                         hintText: 'CSC'),
        //                                   )
        //                                 ]),
        //                                 VSpace(Insets.i25),
        //                                 // Billing Address Title
        //                                 Row(children: const [
        //                                   Text("Billing address",
        //                                       style: TextStyle(
        //                                           fontWeight:
        //                                               FontWeight.bold)),
        //                                   Spacer(),
        //                                   Icon(Icons.flag),
        //                                   // Could be replaced with a country picker
        //                                 ]),
        //                                 VSpace(Insets.i17),
        //
        //                                 // Name fields
        //                                 Row(children: [
        //                                   Expanded(
        //                                       child: TextFieldCommon1(
        //                                           hintText:
        //                                               'First Name')),
        //                                   const SizedBox(width: 10),
        //                                   Expanded(
        //                                       child: TextFieldCommon1(
        //                                           hintText: 'Last Name'))
        //                                 ]),
        //                                 VSpace(Insets.i12),
        //                                 TextFieldCommon1(
        //                                   hintText: 'ZIP code',
        //                                 ),
        //                                 VSpace(Insets.i12),
        //                                 TextFieldCommon1(
        //                                   hintText: 'Mobile Number',
        //                                 ),
        //                                 VSpace(Insets.i12),
        //                                 TextFieldCommon1(
        //                                   hintText: 'Email',
        //                                 ),
        //
        //                                 const SizedBox(height: 20),
        //
        //                                 // Pay Now button
        //                                 ButtonCommon(
        //                                     isRightIcon: true,
        //                                     rightIcon: Icon(
        //                                         color: appColor(context)
        //                                             .primary,
        //                                         CupertinoIcons
        //                                             .creditcard),
        //                                     color: appColor(context)
        //                                         .darkText,
        //                                     title: "Pay Now",
        //                                     onTap: () {}),
        //
        //                                 const SizedBox(height: 10),
        //
        //                                 // Powered by PayPal
        //                                 Row(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.center,
        //                                   children: [
        //                                     Text("Powered by "),
        //                                     Image.network(
        //                                         fit: BoxFit.fill,
        //                                         "https://www.paypalobjects.com/webstatic/en_US/i/buttons/pp-acceptance-small.png",
        //                                         height: 40),
        //                                   ],
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     );
        //                   },
        //                 );
        //               },
        //               title: 'Select plan',
        //               fontColor: appColor(context).primary,
        //               width: 145,
        //               color: appColor(context).whiteBg),
        //           VSpace(Insets.i25),
        //         ]).marginSymmetric(horizontal: Insets.i15)),
        // VSpace(Insets.i27),
        // RichText(
        //     text: TextSpan(
        //         style: appCss.dmDenseRegular14
        //             .textColor(appColor(context).darkText),
        //         children: [
        //       TextSpan(
        //           text: "Are you a business owner? ",
        //           style: appCss.dmDenseMedium14
        //               .textColor(appColor(context).darkText)),
        //       TextSpan(
        //           text: "click here.",
        //           style: appCss.dmDenseMedium14.copyWith(
        //               decoration: TextDecoration.underline,
        //               color: appColor(context).darkText),
        //           recognizer: TapGestureRecognizer()..onTap = () {})
        //     ])),
        // VSpace(Insets.i30),
        // Container(
        //     height: Insets.i76,
        //     alignment: Alignment.center,
        //     color: appColor(context).fieldCardBg,
        //     child: Text(
        //         style: appCss.dmDenseRegular14
        //             .textColor(appColor(context).darkText),
        //         textAlign: TextAlign.center,
        //         "Note : You can update your plan at any time from your account setting."))
      ])),
    );
  }
}
