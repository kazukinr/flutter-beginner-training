import 'package:flutter/material.dart';

class RouteAwareImpl with RouteAware {
  const RouteAwareImpl({required this.tag});

  final String tag;

  @override
  void didPush() {
    debugPrint('[$tag] didPush');
  }

  @override
  void didPushNext() {
    debugPrint('[$tag] didPushNext');
  }

  @override
  void didPop() {
    debugPrint('[$tag] didPop');
  }

  @override
  void didPopNext() {
    debugPrint('[$tag] didPopNext');
  }
}
