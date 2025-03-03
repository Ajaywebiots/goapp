import '../../config.dart';
import '../../providers/dashboard_provider/home_screen_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context, homePvr, child) {
      return StatefulWrapper(
          onInit: homePvr.onInit(context), child: const Scaffold());
    });
  }
}
