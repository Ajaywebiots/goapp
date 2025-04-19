import 'package:goapp/providers/app_pages_provider/favourite_list_provider.dart';

import '../../../config.dart';
import '../../../models/api_model/home_feed_model.dart';
import '../../../widgets/DirectionalityRtl.dart';
import '../../bottom_screens/home_screen/layouts/expert_business_layout.dart';
import '../../bottom_screens/home_screen/layouts/featured_business_layout.dart';
import '../coupon_list_screen/layouts/coupon_layout.dart';
import '../search_screen/filter_tap_layout.dart';

class FavScreenList extends StatelessWidget {
  FavScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteListProvider>(builder: (context, favPvr, child) {
      return DirectionalityRtl(
        child: Scaffold(
            appBar: AppBarCommon(title: "Favourite list"),
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                            onTap: () =>
                                                favPvr.onFilter(e.key)))
                                        .toList())
                                .paddingAll(Insets.i5))
                        .paddingOnly(
                            bottom: Insets.i20,
                            left: Insets.i20,
                            right: Insets.i20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              favPvr.selectIndex == 0
                                  ? "Offer list"
                                  : favPvr.selectIndex == 1
                                      ? "Business list"
                                      : "Attraction list",
                              style: appCss.dmDenseRegular14
                                  .textColor(appColor(context).lightText)),
                          VSpace(Insets.i22),
                          ...(favPvr.selectIndex == 0
                              ? offerList
                                  .asMap()
                                  .entries
                                  .map((e) =>
                                      CouponLayout(data: e.value, onTap: () {}))
                                  .toList()
                              : favPvr.selectIndex == 1
                                  ? businessList
                                      .asMap()
                                      .entries
                                      .map((e) => FeaturedBusinessLayout(
                                          data: e.value, onTap: () {}))
                                      .toList()
                                  : attractionList
                                      .asMap()
                                      .entries
                                      .map((e) => FeatureAttractionLayout(
                                          bColor:
                                              appColor(context).borderStroke,
                                          isHome: true,
                                          data: e.value,
                                          onTap: () => route.pushNamed(
                                              context,
                                              routeName
                                                  .attractionDetailScreen)))
                                      .toList())
                        ]).marginSymmetric(horizontal: 20)
                  ])),
            )),
      );
    });
  }

  List<Offer> offerList = [
    Offer.fromJson({
      "id": 1,
      "title": "Get 5% off all cocktails before \nmidnight",
      "tag": "5% OFF",
      "name": "Sparrow Coffee & Sweets",
      "description": "To redeem a GoSalamina Offer...",
      "image": {
        "mediaType": 1,
        "source": "https://assets.goventures.gr/goapp/business/logos/1219.jpg",
        "mediaStatus": 1,
        "sortOrder": 0
      },
      "expirationDate": "2025-05-01T00:00:00",
      "isFavourite": true,
      "appObject": {"appObjectType": 2, "appObjectId": 6}
    }),
    Offer.fromJson({
      "id": 2,
      "title": "Book 1 night and get 1 free breakfast",
      "tag": "BUY 1 GET 1",
      "name": "Ouzeri Paralia",
      "description": "To redeem a GoSalamina Offer...",
      "image": {
        "mediaType": 1,
        "source": "https://assets.goventures.gr/goapp/business/logos/1036.jpg",
        "mediaStatus": 1,
        "sortOrder": 0
      },
      "expirationDate": "2025-06-01T00:00:00",
      "isFavourite": true,
      "appObject": {"appObjectType": 2, "appObjectId": 3}
    })
  ];

  List<Business> businessList = [
    Business.fromJson(
      {
        "id": 1,
        "name": "Ouzeri O Kakias",
        "businessCategories": [
          {
            "categoryId": 0,
            "icon": "",
            "name": "Restaurants",
            "translatedValue": "",
            "language": 0,
            "businessCategoryType": 0
          },
          {
            "categoryId": 1,
            "icon": "",
            "name": "Bars",
            "translatedValue": "",
            "language": 0,
            "businessCategoryType": 0
          }
        ],
        "rating": {"starts": 4.4, "reviewCount": 5},
        "image": {
          "mediaType": 1,
          "source": "https://assets.goventures.gr/goapp/business/1035-1.jpg",
          "mediaStatus": 1,
          "sortOrder": 0
        },
        "logo": {
          "mediaType": 1,
          "source":
              "https://assets.goventures.gr/goapp/business/logos/1035.jpg",
          "mediaStatus": 1,
          "sortOrder": 0
        },
        "location": {
          "address": "",
          "longitude": "23.4914006",
          "latitude": "37.9629079",
          "selfLocationdistance": 5052.757376166274
        },
        "topOffer": null,
        "contact": {
          "phoneNumber": "+302104655821",
          "email": "",
          "address": "",
          "website": "",
          "facebookPage": "",
          "instagramPage": "",
          "tiktokPage": "",
          "youtubePage": ""
        },
        "isFavourite": true,
        "appObject": {"appObjectType": null, "appObjectId": null}
      },
    ),
    Business.fromJson({
      "id": 2,
      "name": "Hot Island Beach Bar",
      "businessCategories": [
        {
          "categoryId": 0,
          "icon": "",
          "name": "Restaurants",
          "translatedValue": "",
          "language": 0,
          "businessCategoryType": 0
        }
      ],
      "rating": {"starts": 5, "reviewCount": 5},
      "image": {
        "mediaType": 1,
        "source": "https://assets.goventures.gr/goapp/business/1218-1.jpg",
        "mediaStatus": 1,
        "sortOrder": 0
      },
      "logo": {
        "mediaType": 1,
        "source": "https://assets.goventures.gr/goapp/business/logos/1218.jpg",
        "mediaStatus": 1,
        "sortOrder": 0
      },
      "location": {
        "address": "",
        "longitude": "23.4743287",
        "latitude": "37.9305937",
        "selfLocationdistance": 5053.795588297775
      },
      "topOffer": null,
      "contact": {
        "phoneNumber": "+302104666002",
        "email": "",
        "address": "",
        "website": "",
        "facebookPage": "",
        "instagramPage": "",
        "tiktokPage": "",
        "youtubePage": ""
      },
      "isFavourite": true,
      "appObject": {"appObjectType": null, "appObjectId": null}
    })
  ];

  List<Attraction> attractionList = [
    Attraction.fromJson(
      {
        "id": 1,
        "name": "Monastery of Faneromeni",
        "rating": {"starts": 4, "reviewCount": 5},
        "image": {
          "mediaType": 1,
          "source": "https://assets.goventures.gr/goapp/poi/faneromeni.jpg",
          "mediaStatus": 0,
          "sortOrder": 0
        },
        "location": {
          "address": "Faneromeni Monastery, Salamina 189 00, Greece",
          "longitude": "23.435532",
          "latitude": "37.984260",
          "selfLocationdistance": 20.912261670589
        },
        "attractionCategories": [
          {
            "categoryId": 4,
            "icon": "",
            "name": "Churches",
            "translatedValue": "",
            "language": 0,
            "attractionCategoryType": 0
          }
        ],
        "isFavourite": true,
        "appObject": {"appObjectType": null, "appObjectId": null}
      },
    ),
    Attraction.fromJson({
      "id": 2,
      "name": "Battle of Salamis Memorial",
      "rating": {"starts": 5, "reviewCount": 5},
      "image": {
        "mediaType": 1,
        "source":
            "https://assets.goventures.gr/goapp/poi/battle-of-salamis.jpg",
        "mediaStatus": 0,
        "sortOrder": 0
      },
      "location": {
        "address": "Ambelakia area, Salamina 189 00, Greece",
        "longitude": "23.507200",
        "latitude": "37.968900",
        "selfLocationdistance": 40.466464553031
      },
      "attractionCategories": [
        {
          "categoryId": 10,
          "icon": "",
          "name": "Archaeology",
          "translatedValue": "",
          "language": 0,
          "attractionCategoryType": 0
        }
      ],
      "isFavourite": true,
      "appObject": {"appObjectType": null, "appObjectId": null}
    })
  ];
}
