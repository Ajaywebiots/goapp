import '../config.dart';
import '../models/api_model/business_details_model.dart';
import 'DirectionalityRtl.dart';

class CommonGalleryContent extends StatelessWidget {
  final BusinessSec? galleryUrls;

  const CommonGalleryContent({super.key, this.galleryUrls});

  @override
  Widget build(BuildContext context) {
    final List<String> galleryUr = galleryUrls?.gallery
            .map((logo) => logo.source ?? '')
            .where((url) => url.isNotEmpty)
            .toList() ??
        [];

    return DirectionalityRtl(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      if (galleryUrls?.gallery == null)
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: Text("No Data",
                    style: appCss.dmDenseRegular18
                        .textColor(appColor(context).lightText))))
      else
        ListView.builder(
            itemCount: galleryUr.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.r9),
                      child: Image.network(galleryUr[index],
                          height: 225, fit: BoxFit.cover))
                  .paddingDirectional(
                      horizontal: Insets.i20, bottom: Insets.i24);
            }),
      BottomSheetButtonCommon(
              isRateComplete: true, textOne: appFonts.close, clearTap: () {})
          .marginSymmetric(horizontal: 80)
          .backgroundColor(appColor(context).whiteColor)
          .alignment(Alignment.bottomCenter),
    ]).bottomSheetExtension(context));
  }
}
