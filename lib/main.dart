import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:library_app/features/book/data/models/book_data_hive_model.dart';
import 'package:library_app/features/book/data/models/book_list_hive_model.dart';
import 'package:library_app/library_app.dart';
import 'package:library_app/my_http_overrides.dart';
import 'generated/codegen_loader.g.dart';
import 'core/di/dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await hiveSetup();

  await di.setupDependencies();

  HttpOverrides.global = MyHttpOverrides();

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

Future<void> hiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookListHiveModelAdapter());
  Hive.registerAdapter(BookDataHiveModelAdapter());
}
