import 'package:flutter/cupertino.dart';

import '../../widgets/country_picker_custom/country_code_custom.dart';

class SocialRegProvider extends ChangeNotifier {
  String dialCode = "+91";
  bool isCheck = false;
  GlobalKey<FormState> socialFormKey = GlobalKey<FormState>();

  TextEditingController enterFName = TextEditingController();
  TextEditingController enterLName = TextEditingController();
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtConfirmPass = TextEditingController();

  final FocusNode usernameFocus = FocusNode();
  final FocusNode fNameFocus = FocusNode();
  final FocusNode lNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  changeDialCode(CountryCodeCustom country) {
    dialCode = country.dialCode!;
    notifyListeners();
  }

  isCheckBoxCheck(value) {
    isCheck = value;
    notifyListeners();
  }
}
