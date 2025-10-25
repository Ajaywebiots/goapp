import 'package:goapp/common/app_array.dart';
import 'package:goapp/common/session.dart';
import 'package:goapp/common/theme/app_theme.dart';
import 'package:goapp/helper/navigation_class.dart';
import 'package:goapp/services/api_methods.dart';
import 'package:goapp/services/api_service.dart';
import 'package:goapp/services/environment.dart';
import 'package:goapp/utils/fonts.dart';

import 'common/app_fonts.dart';
import 'config.dart';

export 'package:cached_network_image/cached_network_image.dart';
export 'package:flutter/material.dart';
export 'package:goapp/common/assets/index.dart';
export 'package:goapp/common/extension/text_style_extensions.dart';
export 'package:goapp/common/extension/widget_extension.dart';
export 'package:goapp/packages_list.dart';
export 'package:goapp/routes/screen_list.dart';
export 'package:goapp/users_services.dart';

export '../../widgets/contact_detail_row_common.dart';
export '../common/extension/spacing.dart';
export '../common/languages/app_language.dart';
export '../common/languages/language_change.dart';
export '../common/theme/app_css.dart';
export '../common/theme/theme_service.dart';
export '../helper/validation.dart';
export '../providers/index.dart';
export '../routes/index.dart';
export '../utils/extensions.dart';
export '../utils/general_utils.dart';
export '../widgets/alert_dialog_common.dart';
export '../widgets/app_bar_common.dart';
export '../widgets/auth_top_layouts.dart';
export '../widgets/bottom_sheet_buttons_common.dart';
export '../widgets/button_common.dart';
export '../widgets/common_arrow.dart';
export '../widgets/common_state.dart';
export '../widgets/container_with_text_layout.dart';
export '../widgets/country_picker_custom/country_code_custom.dart';
export '../widgets/dot_indicator.dart';
export '../widgets/empty_layout.dart';
export '../widgets/fields_background.dart';
export '../widgets/loading_component.dart';
export '../widgets/small_container.dart';
export '../widgets/text_field_common.dart';

Session session = Session();
AppFonts appFonts = AppFonts();
NavigationClass route = NavigationClass();
AppArray appArray = AppArray();
Validation validation = Validation();
AppCss appCss = AppCss();
ApiServices apiServices = ApiServices();
ApiMethods api = ApiMethods();
TextCommon textCommon = TextCommon();
ApiClass apiClass = ApiClass();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

AppTheme appColor(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);
  return themeServices.appTheme;
}

bool rtl(BuildContext context) {
  final languageProvider = context.watch<LanguageProvider>();
  return languageProvider.locale?.languageCode == 'he';
}

Future<void> showLoading(context) async {
  Provider.of<LoadingProvider>(context, listen: false).showLoading();
}

Future<void> hideLoading(context) async {
  Provider.of<LoadingProvider>(context, listen: false).hideLoading();
}

String language(context, String? text) {
  return AppLocalizations.of(context)!.translate(text ?? "");
}

bool isDark(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);

  return themeServices.isDarkMode;
}

int themeIndex(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);

  return themeServices.themeIndex;
}

bool isAlert = false;

Route createRoute(Widget page) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      });
}

class FadeInRoute extends PageRouteBuilder {
  final Widget page;
  final dynamic arg;

  FadeInRoute({required this.page, required String routeName, this.arg})
      : super(
            settings: RouteSettings(name: routeName, arguments: arg),
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
              print("Dfd");
              return page;
            }, // set name here

            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 500));
}
