import 'package:goapp/config.dart';
import 'package:goapp/providers/bottom_providers/home_screen_provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/api_model/business_category_model.dart';
import 'dashboard_provider.dart';

class BookingProvider with ChangeNotifier {
  String? month;
  AnimationController? animationController;
  List statusList = [];
  bool isExpand = false;
  int selectIndex = 0;
  int? statusIndex;
  List<Categories> categoryList = [];
  ScrollController scrollController = ScrollController();
  List selectedCategory = [];
  dynamic slotChosenValue;
  DateTime? slotSelectedDay;
  DateTime slotSelectedYear = DateTime.now();
  dynamic chosenValue;
  DateTime? selectedDay;
  DateTime selectedYear = DateTime.now();
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  CalendarFormat calendarFormat = CalendarFormat.month;
  int demoInt = 0;
  PageController pageController = PageController();
  TextEditingController categoryCtrl = TextEditingController();
  TextEditingController searchText = TextEditingController();
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime? rangeStart;
  DateTime? rangeEnd;
  DateTime currentDate = DateTime.now();
  final FocusNode searchFocus = FocusNode();
  final FocusNode categorySearchFocus = FocusNode();

  bool? isLastPage;
  int pageNumber = 1;
  bool error = false;
  bool? loading;

  final numberOfPostsPerRequest = 10;

  onTapMonth(val) {
    month = val;
    notifyListeners();
  }

  onRangeSelect(start, end, focusedDay) {
    selectedDay = null;
    currentDate = focusedDay;
    rangeStart = start;
    rangeEnd = end;
    rangeSelectionMode = RangeSelectionMode.toggledOn;
    notifyListeners();
  }

  selectYear(context) async {
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context3) {
    //       return const YearAlertDialog();
    //     });
  }

  onDropDownChange(choseVal) {
    notifyListeners();
    chosenValue = choseVal;

    notifyListeners();
    int index = choseVal['index'];
    focusedDay.value =
        DateTime.utc(focusedDay.value.year, index, focusedDay.value.day + 0);
    onDaySelected(focusedDay.value, focusedDay.value);
  }

  onLeftArrow() {
    pageController.previousPage(
        duration: const Duration(microseconds: 200), curve: Curves.bounceIn);
    final newMonth = focusedDay.value.subtract(const Duration(days: 30));
    focusedDay.value = newMonth;
    int index = appArray.monthList
        .indexWhere((element) => element['index'] == focusedDay.value.month);
    chosenValue = appArray.monthList[index];
    selectedYear = DateTime.utc(focusedDay.value.year, focusedDay.value.month,
        focusedDay.value.day + 0);
    notifyListeners();
  }

  onRightArrow() {
    pageController.nextPage(
        duration: const Duration(microseconds: 200), curve: Curves.bounceIn);
    final newMonth = focusedDay.value.add(const Duration(days: 30));
    focusedDay.value = newMonth;
    int index = appArray.monthList
        .indexWhere((element) => element['index'] == focusedDay.value.month);
    chosenValue = appArray.monthList[index];
    selectedYear = DateTime.utc(focusedDay.value.year, focusedDay.value.month,
        focusedDay.value.day + 0);
    notifyListeners();
  }

  void onDaySelected(DateTime selectDay, DateTime fDay) {
    notifyListeners();
    focusedDay.value = selectDay;
  }

  onPageCtrl(dayFocused) {
    focusedDay.value = dayFocused;
    demoInt = dayFocused.year;
    notifyListeners();
  }

  onInit(context) {
    focusedDay.value = DateTime.utc(focusedDay.value.year,
        focusedDay.value.month, focusedDay.value.day + 0);
    onDaySelected(focusedDay.value, focusedDay.value);
    DateTime dateTime = DateTime.now();
    int index = appArray.monthList
        .indexWhere((element) => element['index'] == dateTime.month);
    chosenValue = appArray.monthList[index];
    final homePvr = Provider.of<HomeScreenProvider>(context, listen: false);
    categoryList = homePvr.categoryList;
    notifyListeners();
  }

  onCalendarCreate(controller) {
    pageController = controller;
  }

  //category list
  getCategory({search}) async {
    // categoryList = [];
    // categoryList =
    // appArray.categoryList.map((e) => CategoryModel.fromJson(e)).toList();
    notifyListeners();
  }

  onCategoryChange(context, id) {
    if (!statusList.contains(id)) {
      statusList.add(id);
    } else {
      statusList.remove(id);
    }

    notifyListeners();
  }

  onStatus(index) {
    statusIndex = index;
    notifyListeners();
  }

  onFilter(index) {
    selectIndex = index;
    notifyListeners();
  }

  onReady(context, DashboardProvider dash) {
    // dash.getBookingHistory(context);
    dash.notifyListeners();
    notifyListeners();
  }

  onFetchData(context, sync) {
    animationController = AnimationController(
        vsync: sync, duration: const Duration(milliseconds: 1200));
    _runAnimation();
    onInit(context);
    notifyListeners();
  }

  void _runAnimation() async {
    for (int i = 0; i < 300; i++) {
      await animationController!.forward();
      await animationController!.reverse();
    }
  }

  // onTapFilter(context) {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: context,
  //     builder: (context) {
  //       return const BookingFilterLayout();
  //     },
  //   ).then((value) {
  //     getCategory();
  //     categoryCtrl.text = "";
  //     final dash = Provider.of<DashboardProvider>(context, listen: false);
  //
  //     dash.getBookingHistory(context);
  //   });
  // }

  clearTap(context, {isBack = true}) {
    statusIndex = null;
    selectedCategory = [];
    rangeEnd = null;
    rangeStart = null;
    notifyListeners();

    if (isBack) {
      route.pop(context, arg: "clear");
    }
  }

  String totalCountFilter() {
    int count = 0;

    if (selectedCategory.isNotEmpty) {
      count++;
    }
    if (rangeStart != null || rangeEnd != null) {
      count++;
    }
    if (statusIndex != null) {
      count++;
    }

    return count.toString();
  }
}
