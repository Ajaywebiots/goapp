import 'dart:developer';

import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import '../../../../config.dart';
import '../../../../widgets/dotted_line.dart';
import '../../../bottom_screens/home_screen/layouts/guest_login_sheet.dart';

class BlogDetailsLayout extends StatefulWidget {
  const BlogDetailsLayout({super.key});

  @override
  State<BlogDetailsLayout> createState() => _BlogDetailsLayoutState();
}

class _BlogDetailsLayoutState extends State<BlogDetailsLayout> {
  bool isGuest = false;

  @override
  void initState() {
    super.initState();
    loadGuestStatus();
  }

  loadGuestStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(session.accessToken);
    setState(() {
      // If accessToken is null or empty, user is a guest
      isGuest = accessToken == null || accessToken.isEmpty;
      log(
        "Guest status: $isGuest, AccessToken: ${accessToken != null ? 'exists' : 'null'}",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LatestBLogDetailsProvider>(
      builder: (context, latestBlogPvr, child) {
        final article = latestBlogPvr.articleDetail?.article;
        final isFav = article?.isFavourite ?? false;

        /*if (article == null) {
        return Container(
            color: appColor(context).darkText.withValues(alpha: 0.2),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: Image.asset(eGifAssets.loader, height: Sizes.s50)));
      }*/
        return Column(
          children: [
            // if (article.media?.source != null)
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: CachedNetworkImage(
                imageUrl: article?.media?.source ?? "",
                placeholder: (context, url) => Image.asset(
                  eImageAssets.noImageFound2,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  eImageAssets.noImageFound2,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          language(context, article?.title),
                          overflow: TextOverflow.clip,
                          style: appCss.dmDenseMedium16.textColor(
                            appColor(context).darkText,
                          ),
                        ),
                        SvgPicture.asset(
                          isFav
                              ? "assets/svg/fav.svg"
                              : "assets/svg/dislike.svg",
                        ).inkWell(
                          onTap: isGuest == true
                              ? () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => GuestLoginSheet(

                                    ),
                                  );
                                }
                              : () {
                                  article?.isFavourite = !isFav;
                                  latestBlogPvr.notifyListeners();
                                  Provider.of<CommonApiProvider>(
                                    context,
                                    listen: false,
                                  ).toggleFavAPI(
                                    context,
                                    isFav,
                                    article?.appObject!.appObjectType,
                                    article?.appObject!.appObjectId,
                                    onSuccess: () {
                                      Provider.of<LatestBLogDetailsProvider>(
                                        context,
                                        listen: false,
                                      ).detailsDataAPI(
                                        context,
                                        article?.id,
                                        isNotRouting: true,
                                      );
                                      Provider.of<LatestBLogDetailsProvider>(
                                        context,
                                        listen: false,
                                      ).getArticlesSearchAPI(context);
                                      Provider.of<HomeScreenProvider>(
                                        context,
                                        listen: false,
                                      ).homeFeed(context);
                                    },
                                  );
                                },
                        ),
                      ],
                    ),
                    // Row(children: [
                    //   Expanded(
                    //       child: Text(language(context, value.data!.title),
                    //           overflow: TextOverflow.ellipsis,
                    //           style: appCss.dmDenseRegular12
                    //               .textColor(appColor(context).lightText)))
                    // ]),
                    const VSpace(Sizes.s25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat("dd MMM, yyyy").format(
                            DateTime.parse(article!.createdDate.toString()),
                          ),
                          style: appCss.dmDenseRegular12.textColor(
                            appColor(context).lightText,
                          ),
                        ),
                        SizedBox(
                          width: Sizes.s70,
                          child:
                              Text(
                                    article.category!,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: appCss.dmDenseMedium11.textColor(
                                      appColor(context).primary,
                                    ),
                                  )
                                  .paddingSymmetric(
                                    horizontal: Insets.i7,
                                    vertical: Insets.i5,
                                  )
                                  .decorated(
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.r6,
                                    ),
                                    color: appColor(
                                      context,
                                    ).primary.withOpacity(0.1),
                                  ),
                        ),
                      ],
                    ),
                    const DottedLines().paddingSymmetric(vertical: Insets.i10),
                    Text(
                      language(context, appFonts.description),
                      style: appCss.dmDenseRegular14.textColor(
                        appColor(context).lightText,
                      ),
                    ),
                  ],
                ).padding(top: Insets.i15, horizontal: Insets.i12),
                const VSpace(Sizes.s6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: article.sections.map((section) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Html(
                          data: section.title,
                          style: {
                            "body": Style(
                              fontFamily: GoogleFonts.dmSans().fontFamily,
                              fontSize: FontSize(14),
                              color: appColor(context).darkText,
                              fontWeight: FontWeight.w700,
                            ),
                          },
                        ),
                        Html(
                          data: section.text,
                          style: {
                            "body": Style(
                              fontFamily: GoogleFonts.dmSans().fontFamily,
                              fontSize: FontSize(14),
                              color: appColor(context).darkText,
                              fontWeight: FontWeight.w400,
                            ),
                          },
                        ),
                      ],
                    );
                  }).toList(),
                ).paddingSymmetric(horizontal: 5),
              ],
            ),
          ],
        );
      },
    );
  }
}
