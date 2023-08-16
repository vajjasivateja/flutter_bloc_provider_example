import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_provider_example/bloc/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_provider_example/bloc/internet_bloc/internet_state.dart';

class HomePageBlocListenerExample extends StatefulWidget {
  const HomePageBlocListenerExample({Key? key}) : super(key: key);

  @override
  State<HomePageBlocListenerExample> createState() => _HomePageBlocListenerExampleState();
}

class _HomePageBlocListenerExampleState extends State<HomePageBlocListenerExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("BLoC Provider Tutorial"), centerTitle: true),
        body: Center(
          child: BlocConsumer<InternetBloc, InternetStates>(
            listener: (context, state) {
              if (state is InternetGainState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet Connected!"), backgroundColor: Colors.green));
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet Lost!"), backgroundColor: Colors.red));
              } else {}
            },
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
