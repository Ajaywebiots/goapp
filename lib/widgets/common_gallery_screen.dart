import '../config.dart';

class CommonGalleryScreen extends StatelessWidget {
  const CommonGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCommon(
            title: appFonts.gallery,
            onTap: () {
              route.pop(context);
            }),
        body: ListView.builder(
            itemCount: appArray.galleryList.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.r9),
                      child: Image.asset(appArray.galleryList[index],
                          height: 225, fit: BoxFit.cover))
                  .paddingDirectional(
                      horizontal: Insets.i20, bottom: Insets.i24);
            }));
  }
}
