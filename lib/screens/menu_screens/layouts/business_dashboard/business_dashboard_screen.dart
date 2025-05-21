import '../../../../config.dart';
import '../../../../models/api_model/attractions_details_model.dart' as attract;
import '../../../../widgets/heading_row_common.dart';
import '../../../../widgets/profile_pic_common.dart';
import '../../../app_pages_screen/services_details_screen/layouts/service_review_layout.dart';

class BusinessDashboardScreen extends StatelessWidget {
  BusinessDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCommon(title: "Dashboard"),
        body: SingleChildScrollView(
            child: Column(children: [
          VSpace(Insets.i10),
          Stack(alignment: Alignment.topRight, children: [
            SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      const VSpace(Sizes.s18),
                      ProfilePicCommon(imageUrl: "", isProfile: true),
                      const VSpace(Sizes.s7),
                      Text(language(context, "Sparrow Coffee & Sweets"),
                          style: appCss.dmDenseSemiBold14
                              .textColor(appColor(context).darkText)),
                      const VSpace(Sizes.s3),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(eSvgAssets.star5),
                            const HSpace(Sizes.s5),
                            Text(language(context, "5 reviews"),
                                style: appCss.dmDenseMedium12
                                    .textColor(appColor(context).lightText)),
                            const HSpace(Sizes.s5),
                            Container(
                                height: 10,
                                width: 1,
                                color: Colors.grey.shade400,
                                margin: EdgeInsets.symmetric(
                                    horizontal: Insets.i6)),
                            Text(language(context, "Gold Member"),
                                style: appCss.dmDenseMedium12
                                    .textColor(appColor(context).lightText))
                          ]),
                      VSpace(Insets.i15),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffE5E8EA))),
                            Expanded(
                                child: DottedLine(
                                    dashColor: Color(0xffE5E8EA),
                                    lineThickness: 1.5,
                                    dashLength: 6,
                                    dashGapLength: 4)),
                            Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffE5E8EA)))
                          ]),
                      VSpace(Insets.i15),
                      GridView.builder(
                          itemCount: stats.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 1.4),
                          itemBuilder: (context, index) {
                            final item = stats[index];
                            return buildStatBox(item["icon"]!, item["title"]!,
                                item["count"]!, context);
                          }),
                      VSpace(Insets.i25),
                    ]).paddingSymmetric(
                        vertical: Insets.i15, horizontal: Insets.i13))
                .boxShapeExtension(
                    color: appColor(context).whiteBg, radius: AppRadius.r12)
                .decorated(boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 2,
                  offset: Offset(1, 2),
                  color: appColor(context).darkText.withOpacity(0.05))
            ]),
            SvgPicture.asset(eSvgAssets.edit,
                    colorFilter: ColorFilter.mode(
                        appColor(context).primary, BlendMode.srcIn),
                    height: Insets.i24)
                .paddingOnly(top: Insets.i15, right: Insets.i15)
                .inkWell(onTap: () {})
          ]).marginSymmetric(horizontal: 20),
          Container(
              padding: EdgeInsets.only(top: 25, bottom: 55),
              margin: EdgeInsets.only(top: Insets.i25),
              width: double.infinity,
              decoration: BoxDecoration(color: appColor(context).fieldCardBg),
              child: Column(children: [
                HeadingRowCommon(
                    title: "Recent Offers", isTextSize: true, onTap: () {}),
                VSpace(Insets.i15),
                OfferCard()
              ]).paddingSymmetric(horizontal: Insets.i20)),
          VSpace(Insets.i20),
          Column(children: [
            HeadingRowCommon(
                title: "Latest Reviews", isTextSize: true, onTap: () {}),
            VSpace(Insets.i16),
            ...reviewList.asMap().entries.map((e) => ServiceReviewLayout(
                data: e.value, index: e.key, list: reviewList))
          ]).marginSymmetric(horizontal: Insets.i20),
          VSpace(Insets.i20),
          Column(children: [
            HeadingRowCommon(
                title: "Business Users", isTextSize: true, onTap: () {}),
            VSpace(Insets.i20),
            ListView.builder(
                itemCount: staffList().length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final staff = staffList()[index];
                  return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Row(children: [
                          CircleAvatar(
                              backgroundImage: AssetImage(staff['image'])),
                          HSpace(Insets.i10),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(staff['name'],
                                    style: appCss.dmDenseMedium13
                                        .textColor(appColor(context).darkText)),
                                VSpace(Insets.i2),
                                Text(staff['contact'],
                                    style: appCss.dmDenseRegular12
                                        .textColor(appColor(context).lightText))
                              ])
                        ]),
                        CommonArrow(arrow: eSvgAssets.edit, isThirteen: true)
                      ])
                      .paddingSymmetric(
                          horizontal: Insets.i12, vertical: Insets.i12)
                      .boxShapeExtension(
                          color: appColor(context).whiteBg,
                          radius: AppRadius.r12)
                      .decorated(boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: Offset(1, 2),
                        color: appColor(context).darkText.withOpacity(0.05))
                  ]).marginOnly(bottom: 10);
                }),
            VSpace(Insets.i30)
          ]).marginSymmetric(horizontal: Insets.i20)
        ])));
  }

  List<Map<String, dynamic>> staffList() => [
        {
          "name": "Dori Doreau",
          "contact": "+30 694 6665555",
          "image": eImageAssets.img3
        },
        {
          "name": "Angela Bower",
          "contact": "+30 694 6665555",
          "image": eImageAssets.img4
        }
      ];

  final List<attract.Review> reviewList = [
    attract.Review(
        title: "Devon Lane",
        description: "“This is amazing service i have ever get”",
        rating: 4,
        createdAt: DateTime.parse("2025-04-02T16:19:27.617"),
        ownerName: "Devon Lane"),
    attract.Review(
        title: "Amazing spot for cocktails",
        description:
            "Hot Island Beach Bar has a vibe like no other. Perfect place to chill in Salamina.",
        rating: 5,
        createdAt: DateTime.parse("2025-04-02T16:19:27.617"),
        ownerName: "Guy Hawkins")
  ];

  final stats = [
    {"icon": eSvgAssets.eye, "title": "Total Views", "count": "1522"},
    {"icon": eSvgAssets.offerOut, "title": "Redeemed Offers", "count": "12"},
    {"icon": eSvgAssets.starOut, "title": "Total Reviews", "count": "52"},
    {"icon": eSvgAssets.people, "title": "Total Users", "count": "2"},
  ];

  Widget buildStatBox(
      String iconPath, String title, String count, BuildContext context) {
    return Container(
        padding: EdgeInsets.all(Insets.i12),
        decoration: BoxDecoration(
            color: appColor(context).fieldCardBg,
            borderRadius: BorderRadius.circular(AppRadius.r10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SvgPicture.asset(iconPath,
              height: 24, width: 24, color: appColor(context).primary),
          VSpace(Insets.i10),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).lightText)),
                VSpace(Insets.i1),
                Text(count,
                    style: appCss.dmDenseBold16
                        .textColor(appColor(context).primary))
              ])
        ]));
  }
}

class OfferCard extends StatefulWidget {
  const OfferCard({super.key});

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> with TickerProviderStateMixin {
  bool showDetails = false;

  void toggleDetails() {
    setState(() {
      showDetails = !showDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => toggleDetails(),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: showDetails
                    ? Border.all(width: 0, color: Colors.grey.shade300)
                    : null,
                borderRadius: BorderRadius.circular(12)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: EdgeInsets.only(bottom: Insets.i12),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(eImageAssets.detailCoupon),
                          fit: BoxFit.fill)),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                        backgroundImage: AssetImage(
                                            eImageAssets.noImageFound2))
                                    .padding(right: Insets.i10),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              language(context,
                                                  "Aianteio Bay Hotel"),
                                              style: appCss.dmDenseMedium14
                                                  .textColor(appColor(context)
                                                      .darkText)),
                                          VSpace(Insets.i3),
                                          Text(
                                                  language(context,
                                                      "Book 1 night and get 1 free breakfast"),
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  maxLines: 2,
                                                  style: appCss.dmDenseRegular12
                                                      .textColor(
                                                          appColor(context)
                                                              .lightText)
                                                      .textHeight(1.2))
                                              .paddingOnly(bottom: 10)
                                        ]).padding(top: Insets.i10))
                              ]).paddingOnly(top: Insets.i8),
                          Text(language(context, "Buy 1 Get 1"),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  style: appCss.dmDenseBold15
                                      .textColor(appColor(context).darkText)
                                      .textHeight(1.2))
                              .width(Insets.i50)
                        ]).inkWell(onTap: () {}).padding(horizontal: 10),
                    VSpace(Insets.i12),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${language(context, appFonts.validUntil)} 31/03/2025",
                              style: appCss.dmDenseRegular12
                                  .textColor(appColor(context).darkText)),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  color: Color(0xff128807),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Text("Active",
                                  style: appCss.dmDenseMedium11
                                      .textColor(appColor(context).whiteBg)))
                        ]).padding(horizontal: Insets.i15, top: Insets.i5)
                  ])),
              AnimatedSize(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: showDetails
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              VSpace(Insets.i20),
                              Text("Redeemed By:",
                                  style: appCss.dmDenseMedium12
                                      .textColor(appColor(context).darkText)),
                              DottedLine(dashColor: Color(0xffE5E8EA))
                                  .paddingDirectional(top: 12, bottom: 12),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: sales.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 12),
                                        decoration: BoxDecoration(
                                            color:
                                                appColor(context).fieldCardBg,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    AppRadius.r12))),
                                        height: Insets.i64,
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(children: [
                                                Image.asset(
                                                    "assets/images/profilePlaceholder.png",
                                                    height: 38),
                                                HSpace(Insets.i10),
                                                Text(sales[index].name,
                                                    style: appCss
                                                        .dmDenseMedium14
                                                        .textColor(
                                                            appColor(context)
                                                                .darkText))
                                              ]),
                                              Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                              sales[index].date,
                                                              style: appCss
                                                                  .dmDenseRegular12
                                                                  .textColor(appColor(
                                                                          context)
                                                                      .darkText)),
                                                          Text(
                                                              sales[index].time,
                                                              style: appCss
                                                                  .dmDenseRegular12
                                                                  .textColor(appColor(
                                                                          context)
                                                                      .darkText))
                                                        ])
                                                  ])
                                            ]));
                                  })
                            ]).paddingSymmetric(horizontal: Insets.i15)
                      : SizedBox.shrink())
            ])));
  }

  final List<Sale> sales = [
    Sale(name: 'Liam Carter', date: '27/4/2025', time: '09:15'),
    Sale(name: 'Ava Thompson', date: '25/4/2025', time: '14:47'),
  ];
}
