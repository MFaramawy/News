import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/network/local/cache_helper.dart';
import 'package:news/shared/components/theme/theme_cubit/theme_states.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitialState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode() async {
    isDark = !isDark;
    CacheHelper.setData(key: 'Dark', value: isDark).then((value) {
      emit(AppChangeModeState());
    });
  }
}
