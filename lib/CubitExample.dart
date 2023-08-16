import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/internet_cubit.dart';

class CubitExample extends StatefulWidget {
  const CubitExample({Key? key}) : super(key: key);

  @override
  State<CubitExample> createState() => _CubitExampleState();
}

class _CubitExampleState extends State<CubitExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("BLoC Provider Tutorial"), centerTitle: true),
        body: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet Connected!"), backgroundColor: Colors.green));
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet Lost!"), backgroundColor: Colors.red));
              } else {}
            },
            builder: (context, state) {
              if (state == InternetState.Gained) {
                return Text("Internet Connected!");
              } else if (state == InternetState.Lost) {
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
