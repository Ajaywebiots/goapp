import 'package:flutter/gestures.dart';

import '../../../config.dart';

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
    return Scaffold(
        appBar: AppBarCommon(title: 'User Subscription Plan'),
        body: SingleChildScrollView(
            child: Column(children: [
          Column(children: [
            ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset("assets/images/sale.png",
                    width: MediaQuery.of(context).size.width,
                    height: Insets.i154,
                    fit: BoxFit.cover)),
            VSpace(Insets.i30),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("User Subscription Plan Details",
                  style: appCss.dmDenseBold14
                      .textColor(appColor(context).darkText)),
              DottedLine(dashColor: Color(0xffE5E8EA))
                  .paddingDirectional(top: 15, bottom: 15),
              Text(
                  style: appCss.dmDenseRegular14
                      .textColor(appColor(context).darkText),
                  'This business was founded in 2021 by Kurt. Working well together, he and his staff. This business was founded in 2021 by Kurt. Working well together, he and his staff.')
            ]).marginOnly(
                left: Insets.i15, right: Insets.i15, bottom: Insets.i30)
          ])
              .boxBorderExtension(context, isShadow: true)
              .paddingDirectional(horizontal: Insets.i20),
          VSpace(Insets.i27),
          Container(
              width: 255,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/subsImage.png"))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VSpace(Insets.i30),
                    Text("\$12",
                        style: appCss.dmDenseBold22
                            .textColor(appColor(context).darkText)),
                    Text("/Year",
                        style: appCss.dmDenseMedium12
                            .textColor(appColor(context).lightText)),
                    VSpace(Insets.i34),
                    Text("ELITE CLUB",
                        style: appCss.dmDenseBold20
                            .textColor(appColor(context).whiteBg)),
                    VSpace(Insets.i20),
                    ...sss.asMap().entries.map((e) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(e.value['icon']),
                              HSpace(Insets.i8),
                              Expanded(
                                  child: Text(e.value['title'],
                                      style: appCss.dmDenseMedium14
                                          .textColor(appColor(context).whiteBg),
                                      overflow: TextOverflow.fade)),
                            ]).paddingOnly(bottom: Insets.i15)),
                    VSpace(Insets.i5),
                    Image.asset('assets/images/dotted_line.png'),
                    VSpace(Insets.i15),
                    Text(
                        textAlign: TextAlign.center,
                        "Take your service business to the next level by choosing this.",
                        style: appCss.dmDenseRegular12
                            .textColor(appColor(context).whiteBg)),
                    VSpace(Insets.i25),
                    ButtonCommon(
                        // onTap: () {
                        //   showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return AlertDialog(
                        //         backgroundColor: Colors.green,
                        //         contentPadding: EdgeInsets.zero,
                        //         insetPadding:
                        //             const EdgeInsets.symmetric(horizontal: 20),
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(15)),
                        //         content: SingleChildScrollView(
                        //           child: Padding(
                        //             padding: const EdgeInsets.all(20),
                        //             child: Column(
                        //               mainAxisSize: MainAxisSize.min,
                        //               children: [
                        //                 Row(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.spaceBetween,
                        //                     children: [
                        //                       Text("PayPal Payment",
                        //                           style: appCss.dmDenseMedium18),
                        //                       Icon(CupertinoIcons.multiply)
                        //                           .inkWell(
                        //                               onTap: () =>
                        //                                   route.pop(context))
                        //                     ]),
                        //                 VSpace(Insets.i15),
                        //                 Text("Please select your top-up amount",
                        //                     style: appCss.dmDenseRegular14),
                        //
                        //                 DropdownButton<String>(
                        //                   value: "10 USD",
                        //                   items: ["10 USD", "20 USD", "50 USD"]
                        //                       .map((e) => DropdownMenuItem(
                        //                           value: e, child: Text(e)))
                        //                       .toList(),
                        //                   onChanged: (_) {},
                        //                 ),
                        //                 // Debit or Credit Card button
                        //                 ElevatedButton.icon(
                        //                   icon: const Icon(Icons.credit_card),
                        //                   label:
                        //                       const Text("Debit or Credit Card"),
                        //                   style: ElevatedButton.styleFrom(
                        //                     backgroundColor: Colors.black87,
                        //                     foregroundColor: Colors.white,
                        //                     minimumSize:
                        //                         const Size(double.infinity, 45),
                        //                   ),
                        //                   onPressed: () {},
                        //                 ),
                        //
                        //                 const SizedBox(height: 15),
                        //
                        //                 // Card Info
                        //                 TextFormField(
                        //                     decoration: const InputDecoration(
                        //                         labelText: "Card number")),
                        //                 Row(
                        //                   children: [
                        //                     Expanded(
                        //                         child: TextFormField(
                        //                             decoration:
                        //                                 const InputDecoration(
                        //                                     labelText:
                        //                                         "Expires"))),
                        //                     const SizedBox(width: 10),
                        //                     Expanded(
                        //                         child: TextFormField(
                        //                             decoration:
                        //                                 const InputDecoration(
                        //                                     labelText: "CSC"))),
                        //                   ],
                        //                 ),
                        //
                        //                 const SizedBox(height: 10),
                        //
                        //                 // Billing Address Title
                        //                 Row(
                        //                   children: const [
                        //                     Text("Billing address",
                        //                         style: TextStyle(
                        //                             fontWeight: FontWeight.bold)),
                        //                     Spacer(),
                        //                     Icon(Icons.flag),
                        //                     // Could be replaced with a country picker
                        //                   ],
                        //                 ),
                        //
                        //                 // Name fields
                        //                 Row(
                        //                   children: [
                        //                     Expanded(
                        //                         child: TextFormField(
                        //                             decoration:
                        //                                 const InputDecoration(
                        //                                     labelText:
                        //                                         "First name"))),
                        //                     const SizedBox(width: 10),
                        //                     Expanded(
                        //                         child: TextFormField(
                        //                             decoration:
                        //                                 const InputDecoration(
                        //                                     labelText:
                        //                                         "Last name"))),
                        //                   ],
                        //                 ),
                        //
                        //                 // ZIP Code, Mobile, Email
                        //                 TextFormField(
                        //                     decoration: const InputDecoration(
                        //                         labelText: "ZIP code")),
                        //                 TextFormField(
                        //                   decoration: const InputDecoration(
                        //                       labelText: "Mobile"),
                        //                   initialValue: "+1",
                        //                 ),
                        //                 TextFormField(
                        //                     decoration: const InputDecoration(
                        //                         labelText: "Email")),
                        //
                        //                 const SizedBox(height: 20),
                        //
                        //                 // Pay Now button
                        //                 ElevatedButton(
                        //                   onPressed: () {},
                        //                   style: ElevatedButton.styleFrom(
                        //                     backgroundColor: Colors.blue,
                        //                     minimumSize:
                        //                         const Size(double.infinity, 45),
                        //                   ),
                        //                   child: const Text("Pay Now"),
                        //                 ),
                        //
                        //                 const SizedBox(height: 10),
                        //
                        //                 // Powered by PayPal
                        //                 Image.network(
                        //                   "https://www.paypalobjects.com/webstatic/en_US/i/buttons/pp-acceptance-small.png",
                        //                   height: 20,
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //   );
                        // },
                        title: 'Select plan',
                        fontColor: appColor(context).primary,
                        width: 145,
                        color: appColor(context).whiteBg),
                    VSpace(Insets.i25),
                  ]).marginSymmetric(horizontal: Insets.i15)),
          VSpace(Insets.i27),
          RichText(
              text: TextSpan(
                  style: appCss.dmDenseRegular14
                      .textColor(appColor(context).darkText),
                  children: [
                TextSpan(
                    text: "Are you a business owner? ",
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).darkText)),
                TextSpan(
                    text: "click here.",
                    style: appCss.dmDenseMedium14.copyWith(
                        decoration: TextDecoration.underline,
                        color: appColor(context).darkText),
                    recognizer: TapGestureRecognizer()..onTap = () {})
              ])),
          VSpace(Insets.i30),
          Container(
              height: Insets.i76,
              alignment: Alignment.center,
              color: appColor(context).fieldCardBg,
              child: Text(
                  style: appCss.dmDenseRegular14
                      .textColor(appColor(context).darkText),
                  textAlign: TextAlign.center,
                  "Note : You can update your plan at any time from your account setting."))
        ])));
  }
}
