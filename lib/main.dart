import 'package:news/app.dart';
import 'package:flutter/material.dart';
import 'package:news/shared/network/remote/dio_helper.dart';
import 'package:news/shared/network/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.inti();
  //bool isDark = CacheHelper.getData(key: 'Dark');
  runApp(const NewApp());
}
