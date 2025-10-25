import '../../config.dart';
import '../../screens/app_pages_screen/business_register/timeslot_layouts/select_time_sheet.dart';

class BusinessTimeSlotProvider with ChangeNotifier {
  TextEditingController hourGap = TextEditingController();
  CarouselController hourCtrl = CarouselController();
  CarouselController minCtrl = CarouselController();
  CarouselController amPmCtrl = CarouselController();
  FocusNode hourFocus = FocusNode();
  int scrollDayIndex = 0;
  int scrollMinIndex = 0;
  int scrollHourIndex = 0;
  int indexs = 0;
  FixedExtentScrollController? controller;

  int? gapValue = -1;

  void onToggle(data, val) {
    data["status"] = val;
    notifyListeners();
  }

  void onMonthChange(val) {
    gapValue = val;
    notifyListeners();
  }

  void onHourScroll(index) {
    scrollHourIndex = index;
    notifyListeners();
  }

  void onMinScroll(index) {
    scrollMinIndex = index;
    notifyListeners();
  }

  void onDayScroll(index) {
    scrollDayIndex = index;
    notifyListeners();
  }

  void selectTimeBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context2) {
          return SelectTimeSheet();
        });
  }

  void onHourChange(index) {
    scrollHourIndex = index;
    notifyListeners();
  }

  void onMinChange(index) {
    scrollMinIndex = index;
    notifyListeners();
  }

  void onAmPmChange(index) {
    scrollDayIndex = index;
    notifyListeners();
  }
}
