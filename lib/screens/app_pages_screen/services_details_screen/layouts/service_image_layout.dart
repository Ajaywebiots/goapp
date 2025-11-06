import '../../../../config.dart';

class ServiceImageLayout extends StatelessWidget {
  final String? image;
  final bool isAttraction;
  final String? logo;

  const ServiceImageLayout({
    super.key,
    this.image,
    this.isAttraction = false,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: Insets.i30, right: Insets.i30, top: Insets.i30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: Sizes.s208,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r20),
              boxShadow: [
                BoxShadow(
                  color: appColor(context).darkText.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 3,
                ),
              ],
            ),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: Sizes.s230,
              decoration: ShapeDecoration(
                image: image == null
                    ? DecorationImage(
                  image: AssetImage(eImageAssets.noImageFound2),
                  fit: BoxFit.cover,
                )
                    : DecorationImage(
                  image: NetworkImage(image!),
                  fit: BoxFit.cover,
                ),
                shape: const SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.only(
                    bottomRight: SmoothRadius(
                        cornerRadius: AppRadius.r20, cornerSmoothing: 1),
                    bottomLeft: SmoothRadius(
                        cornerRadius: AppRadius.r20, cornerSmoothing: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: Sizes.s230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonArrow(
                    arrow: eSvgAssets.arrowLeft,
                    onTap: () => route.pop(context),
                  ),
                ],
              ).padding(
                horizontal: Insets.i20,
                top: Insets.i30,
                bottom: Insets.i20,
              ),
            ).decorated(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(AppRadius.r20),
                right: Radius.circular(AppRadius.r20),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  appColor(context).trans,
                  appColor(context).darkText.withOpacity(0.3),
                ],
              ),
            ),
            if (!isAttraction)
              Positioned(
                bottom: -Sizes.s82 / 2, // Overlaps bottom edge evenly
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: Sizes.s82,
                    width: Sizes.s82,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white),
                      image: logo == null
                          ? DecorationImage(
                        image: AssetImage(eImageAssets.img1),
                      )
                          : DecorationImage(
                        image: NetworkImage(logo!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
