import 'package:goapp/providers/app_pages_provider/favourite_list_provider.dart';

import '../../../config.dart';
import '../search_screen/filter_tap_layout.dart';

class FavScreenList extends StatelessWidget {
  const FavScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteListProvider>(builder: (context, favPvr, child) {
      return Scaffold(
          appBar: AppBarCommon(title: "Favourite list"),
          body: Column(children: [
            Container(
                    alignment: Alignment.center,
                    height: Sizes.s50,
                    decoration: BoxDecoration(
                        color: appColor(context).fieldCardBg,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r30))),
                    child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: appArray.favList
                                .asMap()
                                .entries
                                .map((e) => FilterTapLayout(
                                    data: e.value,
                                    index: e.key,
                                    selectedIndex: favPvr.selectIndex,
                                    onTap: () => favPvr.onFilter(e.key)))
                                .toList())
                        .paddingAll(Insets.i5))
                .paddingOnly(
                    bottom: (favPvr.selectIndex == 0 || favPvr.selectIndex == 2)
                        ? Insets.i20
                        : 0,
                    left: Insets.i20,
                    right: Insets.i20)
          ]));
    });
  }
}
