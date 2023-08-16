import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_provider_example/cubit/generated_routes/first_cubit.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("First Screen"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/second_screen", arguments: {
                    "title": "Dynamic Screen",
                  });
                },
                icon: Icon(Icons.arrow_forward))
          ],
        ),
        body: Container(
          child: Center(
            child: BlocBuilder<FirstCubit, int>(
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<FirstCubit>(context).increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
