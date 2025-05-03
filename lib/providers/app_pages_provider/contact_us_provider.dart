import 'dart:developer';

import 'package:goapp/providers/app_pages_provider/rate_app_provider.dart';
import 'package:goapp/services/api_service.dart';

import '../../config.dart';
import '../../models/api_model/support_subject_model.dart';
import '../../widgets/alert_message_common.dart';

class ContactUsProvider with ChangeNotifier {
  int rate = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> contactKey = GlobalKey<FormState>();
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode messageFocus = FocusNode();

  String? selectedValue;
  int selectedIndex = 0;

  getInit(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    rate = data['rate'];
    messageController.text = data['desc'];
    notifyListeners();
  }

  SupportSubject? selectedSubject;

  List<SupportSubject> subjects = [];

  void getSubjectData(context) {
    apiServices
        .commonApi(api.supportSub, [], ApiType.get, isToken: true)
        .then((value) {
      final supportModel = SupportSubjectModel.fromJson(value.data);
      subjects = supportModel.supportSubjects;
      route.pushNamed(context, routeName.contactUs);
      notifyListeners();
    });
  }

  void submitSupportAPI(context) {
    final subjectId = selectedIndex != null ? subjects[selectedIndex].id : 0;

    final body = {"subjectId": subjectId, "text": messageController.text};

    log("dddd $body");
    apiServices
        .commonApi(api.support, body, ApiType.post, isToken: true)
        .then((value) {
      snackBarMessengers(context,
          message: "Support request submitted successfully!",
          color: appColor(context).primary);
      messageController.clear();
      selectedIndex = 0;
      notifyListeners();
      log("Support request submitted successfully");
      notifyListeners();
    }).catchError((error) {
      log("Error submitting support request: $error");
      snackBarMessengers(context,
          message: "Failed to submit support request",
          color: appColor(context).primary);
    });
  }
}
