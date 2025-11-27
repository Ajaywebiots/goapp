import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:goapp/config.dart';
import 'package:goapp/widgets/DirectionalityRtl.dart';

import '../../../services/api_service.dart';
import '../../bottom_screens/home_screen/layouts/guest_login_sheet.dart';

class OfferDetailsScreen extends StatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  bool isLike = false;
  String? offerId;
  bool isGuest = false;
  // Tracks whether the current offer has been activated in this screen
  bool isOfferActivated = false;

  @override
  void initState() {
    super.initState();
    loadGuestStatus();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get the offer ID from route arguments
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Try to get offerId from arguments
    final routeOfferId = args?["offerId"];

    log("=== OFFER DETAILS SCREEN DEBUG ===");
    log("Route arguments: $args");
    log("routeOfferId value: $routeOfferId");
    log("routeOfferId type: ${routeOfferId.runtimeType}");

    // Convert to string if it's an int, otherwise use toString()
    if (routeOfferId != null) {
      final newOfferId = routeOfferId.toString();
      if (newOfferId != offerId) {
        setState(() {
          offerId = newOfferId;
          isOfferActivated = false; // Reset activation state for new offer
        });
        log("Converted offerId to: $offerId and reset activation flag");
      }
    }

    // Load offer details
    if (offerId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        log("Loading offer details for offerId: $offerId");
        Provider.of<OfferProvider>(
          context,
          listen: false,
        ).offerDetailsAPI(context, offerId);
      });
    }
  }

  void _handleGuestAction(BuildContext context) {
    final offerPvr = Provider.of<OfferProvider>(context, listen: false);
    final offers = offerPvr.offersDetails?.offer;

    // Get offerId from multiple sources (priority order)
    final currentOfferId =
        offerId ?? // From route arguments
        offers?.id?.toString() ?? // From loaded offer
        '';

    log("=== GUEST ACTION DEBUG ===");
    log("offerId from state: $offerId");
    log("offers?.id from provider: ${offers?.id}");
    log("Final currentOfferId: $currentOfferId");

    if (currentOfferId.isEmpty) {
      log("ERROR: No offerId available!");
      showMessage("Unable to proceed. Please try again.");
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (context) => GuestLoginSheet(
        onLoginSuccess: () {
          Navigator.pop(context);

          log("=== NAVIGATING TO LOGIN ===");
          log("Passing offerId: $currentOfferId");
          log("Passing redirectTo: ${routeName.offerDetailsScreen}");

          route.pushNamed(
            context,
            routeName.login,
            arg: {
              "redirectTo": routeName.offerDetailsScreen,
              "offerId": currentOfferId,
            },
          );
        },
      ),
    );
  }

  loadGuestStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(session.accessToken);
    setState(() {
      isGuest = accessToken == null || accessToken.isEmpty;
      log(
        "Guest status: $isGuest, AccessToken: ${accessToken != null ? 'exists' : 'null'}",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final offerPvr = Provider.of<OfferProvider>(context);
    final offers = offerPvr.offersDetails?.offer;

    return DirectionalityRtl(
      child: Scaffold(
        appBar: AppBarCommon(
          title: language(context, appFonts.offerDetails),
          onTap: () {
            offerPvr.onReady();
            route.pop(context);
          },
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8),
                          ),
                          child: Container(
                            height: Insets.i154,
                            color: Color(0xffF2F3F4),
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: EdgeInsets.all(Insets.i14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  offers?.tag ?? "",
                                  style: appCss.dmDenseBold24.textColor(
                                    appColor(context).darkText,
                                  ),
                                ),
                                Text(
                                  offers?.title ?? "",
                                  textAlign: TextAlign.center,
                                  style: appCss.dmDenseBold16.textColor(
                                    appColor(context).primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VSpace(Insets.i55),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              offers?.name ?? "",
                              style: appCss.dmDenseBold14.textColor(
                                appColor(context).darkText,
                              ),
                            ),
                            SvgPicture.asset('assets/svg/verified.svg'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            offers?.categoty == ""
                                ? Container()
                                : Text(
                                    "${offers?.categoty}  |",
                                    style: appCss.dmDenseRegular13.textColor(
                                      appColor(context).darkText,
                                    ),
                                  ),
                            HSpace(5),
                            SvgPicture.asset('assets/svg/receipt.svg'),
                            HSpace(3),
                            Text(
                              "${offers?.redeemCounter} booked",
                              style: appCss.dmDenseRegular13.textColor(
                                appColor(context).darkText,
                              ),
                            ),
                          ],
                        ),
                        DottedLine(
                          dashColor: Color(0xffE5E8EA),
                        ).paddingDirectional(top: 15, bottom: 20),
                        // Show QR code only if this offer has been activated and QR data is available
                        (isOfferActivated && offers?.qrCode != null)
                            ? Image.memory(
                                base64Decode(offers?.qrCode ?? ""),
                                height: 140,
                                width: 140,
                                fit: BoxFit.contain,
                              )
                            : ButtonCommon(
                                margin: 20,
                                title: language(
                                  context,
                                  appFonts.activeOfferNow,
                                ),
                                onTap: isGuest
                                    ? () => _handleGuestAction(context)
                                    : () async {
                                        // Activate offer and show QR code for this offer only
                                        await Provider.of<OfferProvider>(
                                          context,
                                          listen: false,
                                        ).activateOfferAPI(context, offerId);
                                        // Mark this offer as activated so UI updates to show QR
                                        setState(() {
                                          isOfferActivated = true;
                                        });

                                        /* COMMENTED OUT: Membership purchase flow
                            showDialog(
                              context: context,
                              builder: (_) =>
                              const MembershipDialog(),
                            );
                            */
                                      },
                              ),
                        VSpace(20),
                        Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  language(context, appFonts.description),
                                  style: appCss.dmDenseRegular12.textColor(
                                    appColor(context).lightText,
                                  ),
                                ),
                                VSpace(Insets.i8),
                                Text(
                                  style: appCss.dmDenseRegular14.textColor(
                                    appColor(context).darkText,
                                  ),
                                  offers?.description ?? "",
                                ),
                                VSpace(32),
                                Text(
                                  "Terms and Conditions",
                                  style: appCss.dmDenseRegular12.textColor(
                                    appColor(context).lightText,
                                  ),
                                ),
                                VSpace(Insets.i8),
                                Text(
                                  style: appCss.dmDenseRegular14.textColor(
                                    appColor(context).darkText,
                                  ),
                                  offers?.terms ?? "",
                                ),
                                VSpace(Insets.i20),
                              ],
                            ),
                            DottedLine(
                              dashColor: Color(0xffE5E8EA),
                            ).paddingDirectional(top: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Start date:",
                                      style: appCss.dmDenseRegular12.textColor(
                                        appColor(context).lightText,
                                      ),
                                    ),
                                    Text(
                                      formatDate(
                                        offers?.activationDate.toString() ?? "",
                                      ),
                                      style: appCss.dmDenseMedium12.textColor(
                                        appColor(context).darkText,
                                      ),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset('assets/svg/line.svg'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "End date",
                                      style: appCss.dmDenseRegular12.textColor(
                                        appColor(context).lightText,
                                      ),
                                    ),
                                    Text(
                                      formatDate(
                                        offers?.expirationDate.toString() ?? "",
                                      ),
                                      style: appCss.dmDenseMedium12.textColor(
                                        appColor(context).darkText,
                                      ),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset('assets/svg/line.svg'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Status",
                                      style: appCss.dmDenseRegular12.textColor(
                                        appColor(context).lightText,
                                      ),
                                    ),
                                    Text(
                                      "Active",
                                      style: appCss.dmDenseMedium12.textColor(
                                        appColor(context).greenColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ).paddingSymmetric(
                              horizontal: Insets.i20,
                              vertical: Insets.i20,
                            ),
                          ],
                        ).paddingDirectional(horizontal: Insets.i20),
                      ],
                    ).boxBorderExtension(
                      context,
                      isShadow: true,
                      bColor: Color(0xffF2F3F4),
                    ),
                    VSpace(15),
                    VSpace(Insets.i40),
                  ],
                ).paddingSymmetric(horizontal: Insets.i20),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.14,
                  child: Container(
                    height: Insets.i75,
                    width: Insets.i75,
                    padding: EdgeInsets.all(Insets.i2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(
                          offers?.image?.source ?? "",
                        ),
                      ),
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.21,
                  right: MediaQuery.of(context).size.width * 0.08,
                  child:
                      Container(
                        padding: EdgeInsets.all(Insets.i2),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          offers?.isFavourite == true
                              ? "assets/svg/fav.svg"
                              : "assets/svg/dislike.svg",
                        ),
                      ).inkWell(
                        onTap: isGuest == true
                            ? () => _handleGuestAction(context)
                            : () {
                                Provider.of<CommonApiProvider>(
                                  context,
                                  listen: false,
                                ).toggleFavAPI(
                                  context,
                                  offers?.isFavourite,
                                  offers?.appObject!.appObjectType,
                                  offers?.appObject!.appObjectId,
                                  onSuccess: () async {
                                    Provider.of<OfferProvider>(
                                      context,
                                      listen: false,
                                    ).offerDetailsAPI(
                                      context,
                                      offers?.id,
                                      isNotRouting: true,
                                    );
                                    await Provider.of<HomeScreenProvider>(
                                      context,
                                      listen: false,
                                    ).homeFeed(context);
                                  },
                                );
                              },
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatDate(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);
      return DateFormat("dd MMM, yyyy").format(dateTime);
    } catch (e) {
      return "Invalid Date";
    }
  }
}

/* COMMENTED OUT: Membership purchase dialog - no longer needed
class MembershipDialog extends StatelessWidget {
  const MembershipDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Membership',
                  style: appCss.dmDenseMedium16.textColor(
                    appColor(context).darkText,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close, color: appColor(context).darkText),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'UNLOCK EXCLUSIVE DEALS\nAND HUNDREDS OF EUROS\nWORTH OF VALUE!',
              textAlign: TextAlign.center,
              style: appCss.dmDenseBold15.textColor(appColor(context).primary),
            ),
            const SizedBox(height: 14),
            const Image(
              height: 135,
              image: AssetImage('assets/images/subscribe.png'),
            ),
            const SizedBox(height: 14),
            Text(
              'Join our membership today to enjoy\namazing discounts, special offers,\nand full access to app benefits.',
              textAlign: TextAlign.center,
              style: appCss.dmDenseRegular13.textColor(
                appColor(context).lightText,
              ),
            ),
            const SizedBox(height: 20),
            ButtonCommon(
              margin: 40,
              title: 'Choose Your Plan',
              onTap: () async {
                final SharedPreferences pref =
                    await SharedPreferences.getInstance();

                String? loginSession = pref.getString(session.loginSession);

                final Uri url = Uri.parse(
                  'https://dev.gosalamina.com/pricing?loginToken=$loginSession',
                );
                log("kasjhdkashdjksa $url");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.inAppBrowserView);
                  Navigator.pop(context);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/
