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

  onToggle(data, val) {
    data["status"] = val;
    notifyListeners();
  }

  onMonthChange(val) {
    gapValue = val;
    notifyListeners();
  }

  onHourScroll(index) {
    scrollHourIndex = index;
    notifyListeners();
  }

  onMinScroll(index) {
    scrollMinIndex = index;
    notifyListeners();
  }

  onDayScroll(index) {
    scrollDayIndex = index;
    notifyListeners();
  }

  selectTimeBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context2) {
        return SelectTimeSheet();
      },
    );
  }

  onHourChange(index) {
    scrollHourIndex = index;
    notifyListeners();
  }

  onMinChange(index) {
    scrollMinIndex = index;
    notifyListeners();
  }

  onAmPmChange(index) {
    scrollDayIndex = index;
    notifyListeners();
  }
}
