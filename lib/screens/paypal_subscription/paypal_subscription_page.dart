import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayPalSubscriptionPage extends StatefulWidget {
  const PayPalSubscriptionPage({super.key});

  @override
  State<PayPalSubscriptionPage> createState() => _PayPalSubscriptionPageState();
}

class _PayPalSubscriptionPageState extends State<PayPalSubscriptionPage> {
  late final WebViewController controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    _loadHtmlFromAssets();
  }

  void _loadHtmlFromAssets() async {
    final String fileHtmlContents = await DefaultAssetBundle.of(context)
        .loadString('assets/subscription/paypal_subscription.html');

    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'PayPalChannel',
        onMessageReceived: (JavaScriptMessage message) {
          final subscriptionID = message.message;
          print('Subscription ID received: $subscriptionID');
        },
      )
      ..loadHtmlString(fileHtmlContents);

    setState(() {
      controller = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PayPal Subscription")),
      body: !isReady
          ? Center(child: CircularProgressIndicator())
          : WebViewWidget(controller: controller),
    );
  }
}
