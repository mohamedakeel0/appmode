import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:appmode/core/network/cache_helper.dart';
import 'package:appmode/core/services/services_locator.dart';
import 'package:appmode/features/presentation/bloc/login_cubic.dart';
import 'package:appmode/features/presentation/bloc/login_state.dart';
import 'package:appmode/features/presentation/screen/News_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubic>(create: (context) =>
    sl<MainCubic>()..getAppMode(),
      child:BlocConsumer<MainCubic,MainState>(listener: (context, state) {

      },builder: (context, state) {
        MainCubic    cubic = MainCubic.get(context);
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.orange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.orange,
              ),
              appBarTheme: const AppBarTheme(
                  titleSpacing: 20,
                  backgroundColor: Colors.white,

                  elevation: 0.0,
                  systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Colors.orange  ),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.black)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.grey,
                  elevation: 30),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              scaffoldBackgroundColor: Colors.white),
          darkTheme: ThemeData(
              primarySwatch: Colors.orange,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.orange,
              ),
              appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  backgroundColor: HexColor('#033E3E'),

                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('#033E3E'),
                      statusBarBrightness: Brightness.light),
                  titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  iconTheme: const IconThemeData(color: Colors.white)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: HexColor('#033E3E'),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.grey,
                  elevation: 30),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              scaffoldBackgroundColor: HexColor('#033E3E')),
          themeMode:
          cubic.isDark==true ? ThemeMode.dark : ThemeMode.light,
          home: NewsLayout(),
        );
      },),
    );
  }
}


