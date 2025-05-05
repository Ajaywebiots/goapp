import 'package:webview_flutter/webview_flutter.dart';

import '../../config.dart';

class PayPalSubscriptionPage extends StatefulWidget {
  const PayPalSubscriptionPage({super.key});

  @override
  State<PayPalSubscriptionPage> createState() => _PayPalSubscriptionPageState();
}

class _PayPalSubscriptionPageState extends State<PayPalSubscriptionPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(onPageFinished: (String url) {
        setState(() {
          _isLoading = false;
        });
      }))
      ..loadFlutterAsset('assets/subscription/paypal_subscription.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      WebViewWidget(controller: _controller),
      if (_isLoading)
        Container(
            color: isDark(context)
                ? Colors.black.withValues(alpha: .3)
                : appColor(context).darkText.withValues(alpha: 0.2),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: Image.asset(eGifAssets.loader, height: Sizes.s50)))
    ])));
  }
}
