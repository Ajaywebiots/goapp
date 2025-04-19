import 'package:goapp/models/api_model/business_details_model.dart';

import '../config.dart';
import 'DirectionalityRtl.dart';

class CommonGalleryScreen extends StatelessWidget {
  final BusinessSec? galleryUrls;

  const CommonGalleryScreen({super.key, this.galleryUrls});

  @override
  Widget build(BuildContext context) {
    final List galleryUr = galleryUrls?.gallery
            .map((logo) => logo.source ?? '')
            .where((url) => url.isNotEmpty)
            .toList() ??
        [];
    return DirectionalityRtl(
        child: Scaffold(
            appBar: AppBarCommon(
                title: appFonts.gallery,
                onTap: () {
                  route.pop(context);
                }),
            body: galleryUrls?.gallery == null
                ? Center(
                    child: Text("No Data",
                        style: appCss.dmDenseRegular18
                            .textColor(appColor(context).lightText)))
                : ListView.builder(
                    itemCount: galleryUr.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                              borderRadius: BorderRadius.circular(AppRadius.r9),
                              child: Image.network(galleryUr[index],
                                  height: 225, fit: BoxFit.cover))
                          .paddingDirectional(
                              horizontal: Insets.i20, bottom: Insets.i24);
                    })));
  }
}
