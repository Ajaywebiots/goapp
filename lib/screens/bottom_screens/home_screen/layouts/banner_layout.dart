import 'dart:ffi';

import '../../../../config.dart';
import '../../../../models/banner_model.dart';

class BannerLayout extends StatelessWidget {
  final List<BannerModel>? bannerList;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final Function(String, String)? onTap;

  const BannerLayout(
      {super.key, this.bannerList, this.onPageChanged, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
            options: CarouselOptions(
                height: Sizes.s240,
                viewportFraction: 1,
                enlargeCenterPage: false,
                reverse: false,
                onPageChanged: onPageChanged),
            items: bannerList!.map((i) {
              return Builder(builder: (BuildContext context) {
                return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(i.media![0].originalUrl!),
                                fit: BoxFit.cover)))
                    .inkWell(
                  onTap: () => onTap!(i.type!, i.relatedId!),
                );
              });
            }).toList())
        .paddingOnly(top: Insets.i15);
  }
}
