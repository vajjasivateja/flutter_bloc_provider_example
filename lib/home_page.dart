import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_provider_example/bloc/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_provider_example/bloc/internet_bloc/internet_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("BLoC Provider Tutorial"), centerTitle: true),
        body: Center(
          child: BlocBuilder<InternetBloc, InternetStates>(
            builder: (context, state) {
              if (state is InternetGainState) {
                return Text("Internet Connected!");
              } else if (state is InternetLostState) {
                return Text("Internet Lost");
              } else {
                return Text("loading...");
              }
            },
          ),
        ),
      ),
    );
  }
}
