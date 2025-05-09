import 'dart:io';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:goapp/config.dart';
import 'package:intl/intl.dart';
// import 'package:rate_my_app/rate_my_app.dart';

String monthCondition(String? text) {
  if (text == '1') {
    return "JAN";
  } else if (text == '2') {
    return "FEB";
  } else if (text == '3') {
    return "MAR";
  } else if (text == '4') {
    return "APR";
  } else if (text == '5') {
    return "MAY";
  } else if (text == '6') {
    return "JUN";
  } else if (text == '7') {
    return "JUL";
  } else if (text == '8') {
    return "AUG";
  } else if (text == '9') {
    return "SEP";
  } else if (text == '10') {
    return "OCT";
  } else if (text == "11") {
    return "NOV";
  } else if (text == '12') {
    return "DEC";
  } else {
    return "JAN";
  }
}

extension StringExtension on String {
  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Future<bool> isNetworkConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.none)) {
    return false;
  } else {
    final result = await InternetAddress.lookup('google.com',
        type: InternetAddressType.any); //Check For Internet Connection
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

String? getDistance(context, lat1, long1) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((double.parse(lat1) - position!.latitude) * p) / 2 +
      c(double.parse(lat1) * p) *
          c(double.parse(long1) * p) *
          (1 - c((double.parse(long1) - position!.longitude) * p)) /
          2;
  return (12742 * asin(sqrt(a))).toStringAsPrecision(1).toString();
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();

  /// String v = hexString.replaceAll("#", "0xFF");
  //buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(hexString.substring(1, hexString.length), radix: 16) +
      0xFF000000);
}

// getFcmToken() async {
//   String? token;
//   token = await FirebaseMessaging.instance.getToken();
//
//   return token;
// }

String getTime(String timeString) {
  final DateTime time = DateTime.parse(timeString);
  final Duration diff = DateTime.now().difference(time);

  if (!diff.isNegative) {
    if (diff.inMinutes < 1) {
      return "a few seconds ago";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} minutes ago";
    } else if (diff.inMinutes < 1440) {
      return "${diff.inHours} hours ago";
    } else {
      return DateFormat('dd MMM, yyyy').format(time);
    }
  } else {
    return DateFormat('dd MMM, yyyy').format(time);
  }
}

slots(start, end, gap) {
  String startTime = start;
  String space = gap;
  DateTime date = DateFormat.jm().parse(end);
  String closeTime = DateFormat("HH:mm").format(date);
  int? startTimeInMinutes = _getTimeInMinutesSinceMidnight(startTime, false);
  int? closeTimeInMinutes = _getTimeInMinutesSinceMidnight(closeTime, false);
  int? spaceInMinutes = _getTimeInMinutesSinceMidnight(space, true);

  if (startTimeInMinutes == null ||
      closeTimeInMinutes == null ||
      spaceInMinutes == null) {
    return;
  }

  List<String> slotsList = [];
  for (int i = startTimeInMinutes;
      i <= closeTimeInMinutes;
      i += spaceInMinutes) {
    slotsList.add(_getTimeInStringForMinutesSinceMidnight(i));
  }

  return slotsList;
}

int? _getTimeInMinutesSinceMidnight(String time, isCount) {
  final parts = time.split(":");

  if (parts.length != 2 && parts.length != 3) {
    return null;
  }

  final a = int.tryParse(parts[0]);
  final b = int.tryParse(parts[1]);

  if (a == null || b == null) {
    return null;
  }

  return a * 60 + b;
}

String _getTimeInStringForMinutesSinceMidnight(int time) {
  final hours = time ~/ 60;
  final minutes = time % 60;

  formatTime(int val) {
    if (val < 10) {
      return "0$val";
    } else {
      return "$val";
    }
  }

  return "${formatTime(hours)}:${formatTime(minutes)}";
}

getDate(date) {
  DateTime now = DateTime.now();
  String when;
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(date));
  if (dateTime.day == now.day) {
    when = 'Today';
  } else if (dateTime.day == now.subtract(const Duration(days: 1)).day) {
    when = 'Yesterday';
  } else {
    when = "${DateFormat.MMMd().format(dateTime)}-other";
  }
  return when;
}

/// Capitalize given String
String capitalizeFirstLetter(val) {
  return (val != null)
      ? (val![0].toString().toUpperCase() + val!.substring(1))
      : validate(value: val);
}

// Check null string, return given value if null
String validate({String? value}) {
  if (isEmptyOrNull(value)) {
    return value!;
  } else {
    return value!;
  }
}

/// Returns true if given String is null or isEmpty
bool isEmptyOrNull(val) =>
    val == null ||
    (val != null && val!.isEmpty) ||
    (val != null && val! == 'null');

//get address data
//
// RateMyApp rateMyApp = RateMyApp(
//   preferencesPrefix: 'rateMyApp_',
//   minDays: 1,
//   minLaunches: 10,
//   remindDays: 7,
//   remindLaunches: 10,
//   googlePlayIdentifier: 'com.webiots.fixituserapi',
// );
