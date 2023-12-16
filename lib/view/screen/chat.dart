import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class ChatScreenWeb extends StatefulWidget {
  const ChatScreenWeb({Key? key}) : super(key: key);

  @override
  State<ChatScreenWeb> createState() => _ExampleBrowser();
}
  String? link;
class _ExampleBrowser extends State<ChatScreenWeb> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('$link'));

  @override
  void initState() {
    link  = Get.arguments['link'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Order Ozcan")

      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
