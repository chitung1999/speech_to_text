// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "common": {
    "title": "Project"
  },
  "setting": {
    "language": "Language",
    "en": "English",
    "vn": "Vietnamese"
  }
};
static const Map<String,dynamic> _vi = {
  "common": {
    "title": "Project"
  },
  "setting": {
    "language": "Ngôn ngữ",
    "en": "Tiếng Anh",
    "vn": "Tiếng Việt"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "vi": _vi};
}
