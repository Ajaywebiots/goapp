import '../config.dart';

snackBarMessengers(context, {message, color, isDuration = false}) {
  ScaffoldMessenger.of(context).showSnackBar(isDuration
      ? SnackBar(
          duration: const Duration(milliseconds: 600),
          content: Container(
              padding: const EdgeInsets.all(Insets.i15),
              decoration: BoxDecoration(
                  color: color ?? appColor(context).red,
                  borderRadius: BorderRadius.circular(AppRadius.r8)),
              child: Text(message.toString(),
                  style: appCss.dmDenseMedium16
                      .textColor(appColor(context).whiteBg))),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          padding: EdgeInsets.zero)
      : SnackBar(
          content: Container(
              padding: const EdgeInsets.all(Insets.i15),
              decoration: BoxDecoration(
                  color: color ?? appColor(context).red,
                  borderRadius: BorderRadius.circular(AppRadius.r8)),
              child: Text(message.toString(),
                  style: appCss.dmDenseMedium16
                      .textColor(appColor(context).whiteBg))),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          padding: EdgeInsets.zero));
}
