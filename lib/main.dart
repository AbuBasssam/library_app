import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/library_app.dart';
import 'generated/codegen_loader.g.dart';

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      startLocale: Locale('en'),
      useOnlyLangCode: true,
      child: LibraryApp(),
    ),
  );
}
