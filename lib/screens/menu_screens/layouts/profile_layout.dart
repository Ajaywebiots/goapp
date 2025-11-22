import 'dart:developer';

import '../../../../config.dart';
import '../../../../widgets/profile_pic_common.dart';

class ProfileLayout extends StatefulWidget {
  final GestureTapCallback? onTap;

  const ProfileLayout({super.key, this.onTap});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  bool isGuest = false;

  @override
  void initState() {
    super.initState();
    loadGuestStatus();
  }


  loadGuestStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(session.accessToken);
    setState(() {
      // If accessToken is null or empty, user is a guest
      isGuest = accessToken == null || accessToken.isEmpty;
      log(
        "Guest status: $isGuest, AccessToken: ${accessToken != null ? 'exists' : 'null'}",
      );
    });
  }




  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (contextTheme, theme, child) {
      final profilePvr = Provider.of<ProfileDetailProvider>(context);

      return Stack(alignment: Alignment.topRight, children: [
        SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  ProfilePicCommon(
                      imageUrl: profilePvr.profileImageUrl, isProfile: true),
                  const VSpace(Sizes.s5),
                  isGuest ? Text("Guest",style: appCss.dmDenseSemiBold14
                      .textColor(appColor(context).darkText)) :  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: language(context, profilePvr.txtFName.text),
                        style: appCss.dmDenseSemiBold14
                            .textColor(appColor(context).darkText)),
                    TextSpan(text: ' '),
                    TextSpan(
                        text: language(context, profilePvr.txtLName.text),
                        style: appCss.dmDenseSemiBold14
                            .textColor(appColor(context).darkText))
                  ])),
                  const VSpace(Sizes.s3),
                  if (!isGuest) Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SvgPicture.asset(eSvgAssets.email),
                    const HSpace(Sizes.s5),
                    Text(language(context, profilePvr.txtEmail.text),
                        style: appCss.dmDenseMedium12
                            .textColor(appColor(context).lightText))
                  ])
                ]).paddingSymmetric(
                    vertical: Insets.i15, horizontal: Insets.i13))
            .boxShapeExtension(
                color: appColor(contextTheme).fieldCardBg,
                radius: AppRadius.r12),
        SvgPicture.asset(eSvgAssets.edit,
                colorFilter: ColorFilter.mode(
                    appColor(context).primary, BlendMode.srcIn),
                height: Insets.i24)
            .paddingOnly(top: Insets.i15, right: Insets.i15)
            .inkWell(onTap: widget.onTap)
      ]);
    });
  }
}
