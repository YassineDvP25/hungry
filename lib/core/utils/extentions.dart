import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension Navigations on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> push(Widget route, {Object? arguments}) {
    return Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) {
          return route;
        },
      ),
    );
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() {
    return this == null || this == "";
  }
}

extension ListExtension on List? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}

extension MapExtension on Map? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}
