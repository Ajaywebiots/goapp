import 'dart:developer';

import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';

import '../../../config.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../../bottom_screens/home_screen/layouts/latest_blog_layout.dart';
import '../search_screen/layouts/filter_layout.dart';

class LatestBlogViewAll extends StatelessWidget {
  const LatestBlogViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    final dash = context.read<DashboardProvider>();
    final homeScreenPvr =
        Provider.of<HomeScreenProvider>(context, listen: true);
    return DirectionalityRtl(
      child: Scaffold(
          appBar: AppBarCommon(title: appFonts.latestBlog),
          body: SingleChildScrollView(
              child: Container(
                  alignment: Alignment.center,
                  child: Column(children: [
                    SearchTextFieldCommon(
                        controller: homeScreenPvr.searchCtrl,
                        focusNode: homeScreenPvr.searchFocus,
                        suffixIcon: FilterIconCommon(
                            selectedFilter: "1",
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return const FilterLayout1();
                                  }).then((value) {
                                log("DDDD");
                                // getCategory();
                                dash.refreshData();
                                // filterSearchCtrl.text = "";
                              });
                            })),
                    VSpace(Insets.i20),
                    ...dash.blogList.asMap().entries.map((e) =>
                        LatestBlogLayout(
                                data: e.value, rPadding: 0, isView: true)
                            .width(MediaQuery.of(context).size.width))
                  ])
                      .paddingSymmetric(horizontal: Insets.i20)
                      .marginOnly(bottom: Insets.i15)))),
    );
  }
}
