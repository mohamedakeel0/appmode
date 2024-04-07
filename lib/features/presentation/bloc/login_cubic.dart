
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appmode/core/network/cache_helper.dart';
import 'package:appmode/features/presentation/bloc/login_state.dart';
import 'package:appmode/features/presentation/widgets/FirstScreen.dart';
import 'package:appmode/features/presentation/widgets/SecondScreen.dart';
import 'package:appmode/features/presentation/widgets/thirdScreen.dart';


class MainCubic extends Cubit<MainState> {
  MainCubic() : super(InitailMainState());


  static MainCubic get(context) => BlocProvider.of(context);

  ThemeMode appMode = ThemeMode.light;
  void changeAppMode() {
    if (!isClosed) {
      emit(InitailAppChangeModeState());
    }

    isDark = !isDark!;

      CacheHelper.putboolean(key: 'appMode', value: isDark!).then((value) {
        if (!isClosed) {
        emit(SuccesAppChangeModeState());}
      });

  }
  bool? isDark ;
  Future<void> getAppMode()async {
    if (!isClosed) {
      emit(InitailGetAppModeState());
    }
    isDark=  await CacheHelper.getData(key: 'appMode');
    isDark = isDark??false;
      appMode=isDark==true?ThemeMode.dark:ThemeMode.light;

    if (!isClosed) {
      emit(SuccesGetAppModeState());
    }
  }
  int currentindex = 0;
  List<BottomNavigationBarItem>bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),

  ];
  List <Widget> screens=[
    FirstScreen(),
    ThirdScreen(),
    SecondScreen(),
  ];
  void changeBottomNavBar(int index){
    if (!isClosed) {
      emit(InitailBottomNavState());}

    print(index);
    print('dddddddddddddddddddd');
    currentindex=index;
    if (!isClosed) {
    emit(NewBottomNavState());}
  }
}
