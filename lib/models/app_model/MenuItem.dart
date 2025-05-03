import '../../config.dart';

class MenuItem {
  final String title;
  final SvgPicture icon;
  final Widget? destination;

  MenuItem({required this.title, required this.icon, this.destination});
}
