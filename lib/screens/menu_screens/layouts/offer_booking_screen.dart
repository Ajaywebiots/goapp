import '../../../config.dart';

class OfferBookingScreen extends StatelessWidget {
  const OfferBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context, languages, child) {
      return Scaffold(
          appBar: AppBar(
              actions: [
                CommonArrow(arrow: eSvgAssets.add, onTap: () {})
                    .paddingDirectional(horizontal: Sizes.s20)
              ],
              leadingWidth: 60,
              title: Text(language(context, "All Offer Bookings (4)"),
                  style: appCss.dmDenseBold18
                      .textColor(appColor(context).darkText)),
              centerTitle: true,
              leading: CommonArrow(
                      arrow: languages.isUserRTl
                          ? eSvgAssets.arrowRight
                          : eSvgAssets.arrowLeft,
                      onTap: () => route.pop(context))
                  .padding(vertical: Insets.i8, left: Insets.i20)),
          body: ListView.builder(
              itemCount: sales.length,
              itemBuilder: (context, index) {
                final sale = sales[index];
                return Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                        color: appColor(context).fieldCardBg,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    height: Insets.i64,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Image.asset("assets/images/profilePlaceholder.png",
                                height: 38),
                            HSpace(Insets.i10),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(sale.name,
                                      style: appCss.dmDenseMedium14.textColor(
                                          appColor(context).darkText)),
                                  Text("Sold by: ${sale.seller}",
                                      style: appCss.dmDenseRegular10.textColor(
                                          appColor(context).darkText))
                                ])
                          ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(sale.date,
                                          style: appCss.dmDenseRegular12
                                              .textColor(
                                                  appColor(context).darkText)),
                                      Text(sale.time,
                                          style: appCss.dmDenseBold15.textColor(
                                              appColor(context).darkText))
                                    ])
                              ])
                        ])); /*ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(Icons.person, color: Colors.grey.shade600)),
                    title: Text(sale.name,
                        style: appCss.dmDenseRegular16
                            .textColor(appColor(context).darkText)),
                    subtitle: Text('Sold by: ${sale.seller}',
                        style: appCss.dmDenseRegular16
                            .textColor(appColor(context).darkText)),
                    trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(sale.date,
                              style: appCss.dmDenseRegular16
                                  .textColor(appColor(context).darkText)),
                          Text(sale.time,
                              style: appCss.dmDenseRegular16
                                  .textColor(appColor(context).darkText))
                        ]));*/
              }).marginOnly(top: Insets.i10).marginSymmetric(horizontal: 20));
    });
  }
}

final List<Sale> sales = [
  Sale(
      name: 'Liam Carter',
      seller: 'Avi Amar',
      date: '29/4/2025 10:23',
      time: '10€ Off'),
  Sale(
      name: 'Ava Thompson',
      seller: 'Avi Amar',
      date: '29/4/2025 10:23',
      time: '10€ Off'),
  Sale(
      name: 'Mason Lee',
      seller: 'Avi Amar',
      date: '29/4/2025 10:23',
      time: '10€ Off'),
  Sale(
      name: 'Sophia Garcia',
      seller: 'Avi Amar',
      date: '29/4/2025 10:23',
      time: '10€ Off'),
  Sale(
      name: 'Benjamin Clark',
      seller: 'Avi Amar',
      date: '29/4/2025 10:23',
      time: '10€ Off'),
  Sale(
      name: 'Isabella Wright',
      seller: 'Avi Amar',
      date: '29/4/2025 10:23',
      time: '10€ Off'),
];

class Sale {
  final String name;
  final String? seller;
  final String date;
  final String time;

  Sale({
    required this.name,
    this.seller,
    required this.date,
    required this.time,
  });
}
