import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../config.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() => _isLoading = false);

            // Hide website header
            _controller.runJavaScript("""
          const header = document.querySelector('header');
          if (header) header.style.display = 'none';
        """);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor(context).whiteBg,
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
        
            if (_isLoading)
              Container(
                color: isDark(context)
                    ? Colors.black.withValues(alpha: .3)
                    : appColor(context).darkText.withValues(alpha: 0.2),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Image.asset(
                    eGifAssets.loader,
                    height: Sizes.s50,
                  ),
                ),
              ),
        
            // Custom Back Button
            Positioned(
              left: MediaQuery.of(context).size.width * (20 / 360),
              top: MediaQuery.of(context).size.height * (50 / 800),
              child: CommonArrow(
                onTap: () => route.pop(context),
                svgColor: appColor(context).whiteBg,
                arrow: eSvgAssets.arrowLeft,
                color: appColor(context).primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
