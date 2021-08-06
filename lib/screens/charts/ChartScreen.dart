import 'package:bpc_test/models/User.dart';
import 'package:bpc_test/screens/auth/SingInScreen.dart';
import 'package:bpc_test/screens/charts/bloc/ChartBloc.dart';
import 'package:bpc_test/screens/charts/bloc/ChartEvent.dart';
import 'package:bpc_test/screens/charts/bloc/ChartState.dart';
import 'package:bpc_test/screens/charts/widget/Chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartScreen extends StatelessWidget {
  ChartScreen({
    Key? key,
    required this.user
  }) : super(key: key);

  final UserData user;

  final ChartBloc chartBloc = new ChartBloc();

  @override
  Widget build(BuildContext context) {
    chartBloc.add(GetChartData(transactions: user.transactions));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(builder: (_) => SignInScreen()),
            );
          },
          child: Icon(Icons.exit_to_app_outlined, size: 17)
        ),
        title: const Text('График', style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      body: BlocBuilder<ChartBloc, ChartState>(
        bloc: chartBloc,
        builder: (context, state) {
          if (state is ChartLoading)
          {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is ChartSuccess)
          {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ChartWidget(dataMap: state.dataMap),
            );
          }
          else
          {
            return Container();
          }
        },
      ),
    );
  }
}