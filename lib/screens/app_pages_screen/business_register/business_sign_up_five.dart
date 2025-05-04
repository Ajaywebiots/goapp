import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/register_company_provider.dart';

class BusinessSignUpFive extends StatefulWidget {
  const BusinessSignUpFive({super.key});

  @override
  State<BusinessSignUpFive> createState() => _BusinessSignUpFiveState();
}

class _BusinessSignUpFiveState extends State<BusinessSignUpFive> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpCompanyProvider>(builder: (context, value, child) {
      return Column(children: [
        // --- Business Images Section ---
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  const SmallContainer(),
                  const HSpace(Sizes.s10),
                  Text(
                    "Business Images (${value.uploadedImages.length}/12)",
                    style: appCss.dmDenseSemiBold14
                        .textColor(appColor(context).darkText),
                  ),
                ]),
                InkWell(
                  onTap: () {
                    if (value.uploadedImages.length >= 12) return;

                    value.onBusinessImagePick(context, (List<XFile> images) {
                      setState(() {
                        final availableSlots = 12 - value.uploadedImages.length;
                        value.uploadedImages.addAll(images.take(availableSlots));
                      });
                    });
                  },
                  child: Row(children: [
                    SvgPicture.asset(
                      eSvgAssets.addSquare,
                      height: Sizes.s20,
                      width: Sizes.s20,
                    ),
                    const HSpace(Sizes.s8),
                    Text(language(context, "Add Photo"),
                        style: appCss.dmDenseMedium11
                            .textColor(appColor(context).lightText)),
                    HSpace(Sizes.s15)
                  ]),
                ),
              ],
            ),
            const VSpace(Sizes.s15),

            // Grid of uploaded images + empty slots
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.20,
                mainAxisSpacing: Sizes.s10,
                crossAxisSpacing: Sizes.s10,
              ),
              itemBuilder: (context, index) {
                if (index < value.uploadedImages.length) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.r8),
                    child: Image.file(
                      File(value.uploadedImages[index].path),
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      color: appColor(context).whiteBg,
                      borderRadius: BorderRadius.circular(AppRadius.r8),
                    ),
                    child: Center(
                      child: SvgPicture.asset(eSvgAssets.gallery),
                    ),
                  );
                }
              },
            ).paddingDirectional(horizontal: Sizes.s10),
          ],
        ),
        const VSpace(Sizes.s30),

        // --- Embed Video Section ---
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const SmallContainer(),
              const HSpace(Sizes.s10),
              Text(
                language(context, "Embed Video"),
                style: appCss.dmDenseSemiBold14
                    .textColor(appColor(context).darkText),
              ),
              const Spacer(),
              InkWell(
                onTap: () => value.showEmbedVideoDialog(context),
                child: Row(
                  children: [
                    SvgPicture.asset(eSvgAssets.addSquare, height: Sizes.s20),
                    const HSpace(Sizes.s8),
                    Text(language(context, "Embed Video"),
                        style: appCss.dmDenseMedium11
                            .textColor(appColor(context).lightText)),
                    const HSpace(Sizes.s15),
                  ],
                ),
              )
            ]),
            const VSpace(Sizes.s15),
            Container(
              height: 225,
              width: double.infinity,
              decoration: BoxDecoration(
                color: appColor(context).whiteBg,
                borderRadius: BorderRadius.circular(AppRadius.r12),
              ),
              child: Center(
                child: value.videoThumbnailUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.r12),
                        child: Image.network(value.videoThumbnailUrl!,
                            fit: BoxFit.cover),
                      )
                    : Image.asset(eImageAssets.videoPlay,
                        height: Sizes.s60, width: Sizes.s60),
              ),
            ).paddingDirectional(horizontal: Sizes.s10),
          ],
        )
      ]);
    });
  }
}
