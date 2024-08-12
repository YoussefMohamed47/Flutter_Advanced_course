import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routName,
      {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
        routName, ModalRoute.withName(routName),
        arguments: arguments);
  }

  void pop() {
    return Navigator.of(this).pop();
  }
}

extension StringExtension on String? {
  bool isNullorEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T?>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
