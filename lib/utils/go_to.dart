import 'package:flutter/material.dart';

Future<void> goTo(GlobalKey key) async {
  final ctx = key.currentContext;
  if (ctx == null) return;
  await Scrollable.ensureVisible(
    ctx,
    alignment: 0.05,
    duration: const Duration(milliseconds: 700),
    curve: Curves.easeInOutCubic,
  );
}