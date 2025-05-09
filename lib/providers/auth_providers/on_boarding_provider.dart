import 'dart:developer';

import 'package:goapp/config.dart';
import 'package:goapp/models/on_boarding_model.dart';
import 'package:goapp/models/support_lang_model.dart';
import 'package:goapp/services/api_service.dart';

class OnBoardingProvider with ChangeNotifier {
  @override
  void dispose() {
    super.dispose();
    pageController!.dispose();
    notifyListeners();
  }

  int selectIndex = 0;
  PageController? pageController;

  onChanged(newValue) {
    notifyListeners();
    selectedLanguage = newValue;
    log("sss # # $selectedLanguage");
    notifyListeners();
  }

  bool sizeA = false;
  bool sizeB = false;
  bool isDisplay = false;

  double width = 0;
  double height = 0;

  bool val = false;

  onSkip(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // pageController!.jumpToPage(3);
    route.pushNamedAndRemoveUntil(context, routeName.login);
    pref.setBool(session.isIntro, true);
  }

  newImageSmall() async {
    Future.delayed(const Duration(milliseconds: 20)).then((value) {
      sizeA = true;
      sizeB = true;

      notifyListeners();
    });
  }

  List<Item> onBoardingList = [];

  onReady(context) async {
    // languageSupport(context);
    notifyListeners();
    // onBoardingDetails();
    notifyListeners();

    pageController = PageController(initialPage: 0);
    notifyListeners();
    if (pageController!.hasClients) {
      pageController!.animateToPage(selectIndex,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      notifyListeners();
    }
  }

  onPageSlide(context) async {
    if (selectIndex == 3) {
      selectIndex = -1;
    }

    pageController!.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
    await Future.delayed(const Duration(milliseconds: 100));

    isDisplay = false;
    notifyListeners();
    if (selectIndex == 1) {
      notifyListeners();
    } else if (selectIndex == 2) {
      isDisplay = false;
      notifyListeners();
    } else if (selectIndex == 3) {
      notifyListeners();
    } else if (selectIndex == -1) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      // final login = Provider.of<LoginProvider>(context, listen: false);
      // login.continueAsGuestTap(context);
      route.pushReplacementNamed(context, routeName.login);
      pref.setBool(session.isIntro, true);
    }
  }

  onPageBack() {
    isDisplay = false;
    selectIndex--;
    pageController!.previousPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
    notifyListeners();

    if (selectIndex != 2) {
      sizeA = false;
      sizeB = false;
      val = false;
      notifyListeners();
    }
    if (selectIndex != 3) {
      height = 0;
      width = 0;
      notifyListeners();
    }
  }

  onPageChange(index) {
    selectIndex = index;
    notifyListeners();
  }

  SupportedLangModel? langModel;
  String? selectedLanguage;

  languageSupport(context) {
    try {
      apiServices
          .commonApi(api.supportLang, [], ApiType.get, isToken: false)
          .then((value) {
        if (value.isSuccess!) {
          hideLoading(context);
          notifyListeners();
          langModel = SupportedLangModel.fromJson(value.data);
          if (langModel?.supportedLanguages != null &&
              langModel!.supportedLanguages!.isNotEmpty) {
            notifyListeners();
            selectedLanguage = langModel!.supportedLanguages!.first;
            notifyListeners();
          }
        }
      });
    } catch (e) {
      log("EEEE : languageSupport $e");
    }
  }

  Future<void> onBoardingDetails() async {
    try {
      apiServices.commonApi(api.splashScreen, [], ApiType.get).then((value) {
        if (value.isSuccess!) {
          final sss = OnboardingModel.fromJson(value.data);
          for (var data in sss.splashScreens[0].items) {
            log("sss:::${data.description}");
            onBoardingList.add(data);
          }
          notifyListeners();
        }
      });
    } catch (e) {
      log("EEEE : onBoardingDetails $e");
    }
  }
}
