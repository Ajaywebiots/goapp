import 'dart:developer';

import '../../config.dart';

class LatestBLogDetailsProvider with ChangeNotifier {
      BlogModel? data;
      onReady(context){
     dynamic    data1 = ModalRoute.of(context)!.settings.arguments;
     data =data1;
        notifyListeners();
      }

}
