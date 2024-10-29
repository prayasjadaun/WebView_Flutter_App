import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewProvider extends ChangeNotifier {
  late WebViewController _controller;
  int loadingPercentage = 0;

  WebViewController get controller => _controller;

  void setController(WebViewController controller) {
    _controller = controller;
    notifyListeners();
  }

  void updateLoadingPercentage(int progress) {
    loadingPercentage = progress;
    notifyListeners();
  }

  Future<void> goBack() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    }
  }

  Future<void> goForward() async {
    if (await _controller.canGoForward()) {
      await _controller.goForward();
    }
  }

  Future<void> reload() async {
    await _controller.reload();
  }
}
