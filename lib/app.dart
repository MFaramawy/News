import 'package:flutter/material.dart';
import 'package:news/layout/news_layout.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/theme/app_theme.dart';
import 'package:news/shared/components/theme/theme_cubit/theme_cubit.dart';
import 'package:news/shared/components/theme/theme_cubit/theme_states.dart';

class NewApp extends StatelessWidget {
  //final bool isDark;

  const NewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //create: (BuildContext context) => ThemeCubit(),
      providers: [
        BlocProvider(create: (_) => NewsCubit()..getBusiness()),
        BlocProvider(create: (_) => ThemeCubit()..changeAppMode()),
      ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ThemeCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
