import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';

import '../../../config.dart';
import '../../../providers/app_pages_provider/latest_blog_details_provider.dart';
import '../../../providers/bottom_providers/dashboard_provider.dart';
import '../../../providers/common_providers/common_api_provider.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../../widgets/filter_icon_common.dart';
import '../../../widgets/search_text_filed_common.dart';
import '../../bottom_screens/home_screen/layouts/latest_blog_layout.dart';
import '../search_screen/layouts/filter_layout.dart';
import '../search_screen/layouts/list_tile_common.dart';

class LatestBlogViewAll extends StatelessWidget {
  const LatestBlogViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LatestBLogDetailsProvider>(
        builder: (context, value, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(
              const Duration(milliseconds: 100), () => value.onReady(context)),
          child: DirectionalityRtl(
              child: Scaffold(
                  appBar:
                      AppBarCommon(title: language(context, appFonts.articles)),
                  body: SafeArea(
                    child: SingleChildScrollView(
                        child: Container(
                            alignment: Alignment.center,
                            child: Column(children: [
                              SearchTextFieldCommon(
                                  controller: value.searchCtrl,
                                  focusNode: value.searchFocus,
                                  suffixIcon: FilterIconCommon(
                                      selectedFilter: value
                                          .selectedCategory.length
                                          .toString(),
                                      onTap: () =>
                                          value.showBottomBlogFilter(context))),
                              VSpace(Insets.i20),
                              ...value.articlesSearchList.asMap().entries.map(
                                  (e) => LatestBlogLayout(
                                          onTap: () => value.detailsDataAPI(
                                              context, e.value.id),
                                          data: e.value,
                                          rPadding: 0,
                                          isView: true,
                                          addOrRemoveTap: () {
                                            final common =
                                                Provider.of<CommonApiProvider>(
                                                    context,
                                                    listen: false);
                                            common.toggleFavAPI(
                                                onSuccess: () => Provider.of<
                                                            LatestBLogDetailsProvider>(
                                                        context,
                                                        listen: false)
                                                    .getArticlesSearchAPI(
                                                        context),
                                                context,
                                                e.value.isFavourite,
                                                e.value.appObject!
                                                    .appObjectType,
                                                e.value.appObject!.appObjectId);
                                          })
                                      .width(MediaQuery.of(context).size.width))
                            ])
                                .paddingSymmetric(horizontal: Insets.i20)
                                .marginOnly(bottom: Insets.i15))),
                  ))));
    });
  }
}
