import 'package:goapp/providers/app_pages_provider/register_company_provider.dart';
import 'package:goapp/screens/app_pages_screen/business_register/company_details_screen.dart';

import '../../../../config.dart';

class DotIndicatorLayout extends StatelessWidget {
  const DotIndicatorLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpCompanyProvider>(builder: (context, value, child) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        DotIndicator(
             selectedIndex: value.pageIndex),
      ]).paddingSymmetric(horizontal: Insets.i20);
    });
  }
}
