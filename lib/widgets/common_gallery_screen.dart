import 'package:goapp/models/api_model/business_details_model.dart';

import '../config.dart';
import 'DirectionalityRtl.dart';

class CommonGalleryScreen extends StatelessWidget {
  const CommonGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final businessSec =
        ModalRoute.of(context)?.settings.arguments as BusinessSec?;
    final List<String> galleryUrls = businessSec?.gallery
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
          body: ListView.builder(
              itemCount: galleryUrls.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.r9),
                        child: Image.network(galleryUrls[index],
                            height: 225, fit: BoxFit.cover))
                    .paddingDirectional(
                        horizontal: Insets.i20, bottom: Insets.i24);
              })),
    );
  }
}
