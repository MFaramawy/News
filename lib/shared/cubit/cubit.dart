import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business_screen.dart';
import 'package:news/modules/science_screen.dart';
import 'package:news/modules/sports_screen.dart';
import 'package:news/shared/cubit/states.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '973fb8bb839246adbd5e6401e0154226',
      },
    ).then((value) {
      //debugPrint(value.data['articles'][0]['title']);
      business = value.data['articles'];
      debugPrint(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState(error));
      debugPrint(error.toString());
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '973fb8bb839246adbd5e6401e0154226',
        },
      ).then((value) {
        //debugPrint(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        debugPrint(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        emit(NewsGetSportsErrorState(error));
        debugPrint(error.toString());
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '973fb8bb839246adbd5e6401e0154226',
        },
      ).then((value) {
        //debugPrint(value.data['articles'][0]['title']);
        science = value.data['articles'];
        debugPrint(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        emit(NewsGetScienceErrorState(error));
        debugPrint(error.toString());
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }


  //ThemeMode appMode = ThemeMode.light;
  // bool isDark = true;
  // void changeAppMode() {
  //   isDark = false;
  //   emit(AppChangeModeState());
  // }

// void changeAppMode() {
//   isDark = !isDark;
//   CacheHelper.setData(key: 'isDark', value: isDark).then((value) {
//     emit(AppChangeModeState());
//   });
// }
}