
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appmode/features/presentation/bloc/login_cubic.dart';
import 'package:appmode/features/presentation/bloc/login_state.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubic, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubic.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [IconButton(onPressed: () {



            }, icon: Icon(Icons.search)),IconButton(onPressed: () {
              cubit.changeAppMode();

            }, icon: Icon(Icons.brightness_4_outlined))],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {

            },
            child: Icon(Icons.add),
          ),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex: cubit.currentindex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
