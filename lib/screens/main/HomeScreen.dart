import 'package:bpc_test/bloc/main/MainBloc.dart';
import 'package:bpc_test/bloc/main/MainState.dart';
import 'package:bpc_test/screens/charts/ChartScreen.dart';
import 'package:bpc_test/screens/transaction/TransactionScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc,MainState>(
      bloc: BlocProvider.of<MainBloc>(context),
      builder: (context, state) {
        if (state is MainSuccess)
        {
          return CupertinoTabScaffold(
            tabBar : CupertinoTabBar(
              items: <BottomNavigationBarItem> [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_outlined),
                  label: 'Список'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.donut_large_outlined),
                  label: 'График'
                ),
              ],
            ),
            tabBuilder: (BuildContext context, int index) {
              switch (index) {
                case 0:
                  return TransactionScreen(user: state.userData);
                case 1:
                  return ChartScreen(user: state.userData);
                default:
                return TransactionScreen(user: state.userData);
              }
            },
          );
        }
        if (state is MainLoading)
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else
        {
          return Container();
        }
      },
    );
  }
}