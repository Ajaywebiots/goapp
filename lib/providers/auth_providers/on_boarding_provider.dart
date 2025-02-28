import 'dart:developer';

import 'package:goapp/config.dart';
import 'package:goapp/models/on_boarding_model.dart';
import 'package:goapp/models/support_lang_model.dart';
import 'package:goapp/services/api_service.dart';

class OnBoardingProvider with ChangeNotifier {
  int selectIndex = 0;
  PageController? pageController;

  onChanged(newValue) {
    notifyListeners();
    selectedLanguage = newValue;
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
    final login = Provider.of<LoginProvider>(context, listen: false);
    login.continueAsGuestTap(context);

    pref.setBool(session.isIntro, true);
  }

  newImageSmall() async {
    Future.delayed(const Duration(milliseconds: 20)).then((value) {
      sizeA = true;
      sizeB = true;

      notifyListeners();
    });
  }

  List<Items> onBoardingList = [];

  onReady() async {
    languageSupport();
    notifyListeners();
    onBoardingDetails();
    notifyListeners();

    notifyListeners();
    // onBoardingList = appArray.onBoardingList;
    notifyListeners();

    pageController = PageController(initialPage: 0);
    notifyListeners();
    if (pageController!.hasClients) {
      pageController!.animateToPage(selectIndex,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      notifyListeners();
    }
  }

  onPageSlide(context, TickerProvider hello) async {
    if (selectIndex == 3) {
      selectIndex = -1;
    }

    pageController!.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
    await Future.delayed(const Duration(milliseconds: 100));

    isDisplay = false;
    notifyListeners();
    log("KJGF $selectIndex");
    if (selectIndex == 1) {
      notifyListeners();
    } else if (selectIndex == 2) {
      isDisplay = false;
      log("KJGF");

      notifyListeners();
    } else if (selectIndex == 3) {
      notifyListeners();
    } else if (selectIndex == -1) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final login = Provider.of<LoginProvider>(context, listen: false);
      login.continueAsGuestTap(context);
      route.pushReplacementNamed(context, routeName.login);
      pref.setBool(session.isIntro, true);
    }
  }

  onAnimate(TickerProvider sync) {
    notifyListeners();
    changeSize();
    isDisplay = true;
    notifyListeners();
  }

  changeSize() async {
    await Future.delayed(const Duration(milliseconds: 500));
    height = 20;
    width = 24;

    notifyListeners();
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

  onDispose() {
    pageController!.dispose();
  }

  onPageChange(index) {
    selectIndex = index;

    notifyListeners();
    log("dfjgh : $selectIndex");
  }

  heightMQ(context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  widthMQ(context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  SupportedLangModel? langModel;
  String? selectedLanguage;

  languageSupport() {
    apiServices
        .commonApi(api.supportLang, [], ApiType.get, isToken: false)
        .then((value) {
      if (value.isSuccess!) {
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
  }

  onBoardingDetails() {
    apiServices
        .commonApi(api.splashScreen, [], ApiType.get, isToken: false)
        .then((value) {
      log("api.splashScreen ${api.splashScreen}");
      if (value.isSuccess!) {
        final sss = OnboardingModel.fromJson(value.data);
        // log("sss:::${sss.splashScreens![0].items![0].description}///${value.data}");
        for (var i in sss.splashScreens![0].items!) {
          log("sss:::${i.description}");
          onBoardingList.add(i);
        }
        notifyListeners();
        // onBoardingList.add(sss);
      }
    });
  }
}
