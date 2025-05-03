import '../../../config.dart';
import '../../../providers/app_pages_provider/profile_detail_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/profile_pic_common.dart';
import 'layouts/text_field_layout.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileDetailProvider>(context, listen: false)
          .onReady(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileDetailProvider>(builder: (context1, value, child) {
      return DirectionalityRtl(
          child: Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  leading: CommonArrow(
                          arrow: rtl(context)
                              ? eSvgAssets.arrowRight
                              : eSvgAssets.arrowLeft,
                          onTap: () => route.pop(context))
                      .marginOnly(left: Insets.i20),
                  title: Text(language(context, appFonts.profileDetails),
                      style: appCss.dmDenseBold18
                          .textColor(appColor(context).darkText))),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                const VSpace(Sizes.s20),
                Stack(children: [
                  const FieldsBackground(),
                  Column(children: [
                    Stack(alignment: Alignment.bottomCenter, children: [
                      Image.asset(eImageAssets.servicemanBg,
                              width: MediaQuery.of(context).size.width,
                              height: Sizes.s60)
                          .paddingOnly(bottom: Insets.i45),
                      Stack(alignment: Alignment.bottomRight, children: [
                        ProfilePicCommon(
                            image: value.imageFile,
                            imageUrl: value.profileImageUrl),
                        SizedBox(
                                child: SvgPicture.asset(eSvgAssets.edit,
                                        colorFilter: ColorFilter.mode(
                                            appColor(context).primary,
                                            BlendMode.srcIn),
                                        height: Sizes.s14)
                                    .paddingAll(Insets.i7))
                            .decorated(
                                color: appColor(context).stroke,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: appColor(context).primary))
                            .inkWell(onTap: () => value.showLayout(context))
                      ])
                    ]),
                    const VSpace(Sizes.s40),
                    Consumer<ProfileDetailProvider>(
                        builder: (context, profilePvr, child) {
                      return TextFieldLayout(value: profilePvr);
                    })
                  ]).paddingSymmetric(vertical: Insets.i20)
                ]),
                const VSpace(Sizes.s40),
                ButtonCommon(
                    title: language(context, appFonts.update),
                    onTap: () {
                      // value.uploadImageUsingCommonApi(value.imageFile!);
                      value.updateProfileDetailDataAPI(context);
                    })
              ]).paddingSymmetric(horizontal: Insets.i20)))));
    });
  }
}
