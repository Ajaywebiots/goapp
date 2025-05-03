import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../../config.dart';
import 'common_image_layout.dart';

class CompanyLogoLayout extends StatelessWidget {
  final XFile? imageFile;

  const CompanyLogoLayout({super.key, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        color: appColor(context).stroke,
        borderType: BorderType.RRect,
        radius: const Radius.circular(AppRadius.r10),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r8)),
            child: imageFile != null
                ? ClipSmoothRect(
                    radius: SmoothBorderRadius(
                        cornerRadius: 10, cornerSmoothing: 1),
                    child: Image.file(File(imageFile!.path),
                        height: Sizes.s70, width: Sizes.s70, fit: BoxFit.cover))
                : Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    color: appColor(context).whiteBg,
                    child: Column(
                      children: [
                        SvgPicture.asset(eSvgAssets.upload),
                        const VSpace(Sizes.s6),
                        Text(language(context, "Upload Logo Image"),
                            style: appCss.dmDenseMedium12
                                .textColor(appColor(context).lightText))
                      ],
                    ).paddingSymmetric(vertical: Insets.i15))));
  }
}

class CompanyLogoLayoutNetwork extends StatelessWidget {
  final String? imageFile;

  const CompanyLogoLayoutNetwork({super.key, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        DottedBorder(
            color: appColor(context).stroke,
            borderType: BorderType.RRect,
            radius: const Radius.circular(AppRadius.r10),
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppRadius.r8)),
                child: imageFile != null
                    ? Container(
                        padding: EdgeInsets.all(5),
                        decoration: ShapeDecoration(
                            shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius(
                                  cornerRadius: 8, cornerSmoothing: 1),
                            ),
                            color: appColor(context).whiteBg),
                        child: CommonImageLayout(
                            image: imageFile,
                            height: Sizes.s70,
                            width: Sizes.s70,
                            assetImage: eImageAssets.noImageFound3,
                            radius: 8),
                      )
                    : Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        color: appColor(context).whiteBg,
                        child: Column(
                          children: [
                            SvgPicture.asset(eSvgAssets.upload),
                            const VSpace(Sizes.s6),
                            Text(language(context, "Upload Logo Image"),
                                style: appCss.dmDenseMedium12
                                    .textColor(appColor(context).lightText))
                          ],
                        ).paddingSymmetric(vertical: Insets.i15)))),
        SizedBox(
                child: SvgPicture.asset(eSvgAssets.add, height: Sizes.s14)
                    .paddingAll(Insets.i7))
            .decorated(
                color: appColor(context).stroke,
                shape: BoxShape.circle,
                border: Border.all(color: appColor(context).primary))
      ],
    ).width(Sizes.s80);
  }
}
