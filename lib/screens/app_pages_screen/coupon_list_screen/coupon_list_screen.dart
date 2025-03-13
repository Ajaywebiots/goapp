import '../../../config.dart';

class CouponListScreen extends StatefulWidget {
  const CouponListScreen({super.key});

  @override
  State<CouponListScreen> createState() => _CouponListScreenState();
}

class _CouponListScreenState extends State<CouponListScreen> {
  bool isArg = false;


  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context3, dash, child) {
      dynamic data = ModalRoute.of(context)!.settings.arguments ?? false;
      isArg = data;
      return Scaffold(
          appBar: AppBarCommon(title: appFonts.couponList),
          body: SingleChildScrollView(
              child: Column(
                      children: dash.couponList
                          .asMap()
                          .entries
                          .map((e) => CouponLayout(
                              data: e.value,
                              onTap: () {
                                if (!isArg) {
                                  route.pop(context, arg: e.value);
                                }else{
                                  route.pop(context);
                                }
                              }))
                          .toList())
                  .paddingSymmetric(horizontal: Insets.i20)));
    });
  }
}
