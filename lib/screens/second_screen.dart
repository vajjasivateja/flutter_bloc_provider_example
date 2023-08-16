import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_provider_example/cubit/generated_routes/second_cubit.dart';

class SecondScreen extends StatefulWidget {
  final String title;

  const SecondScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/third_screen");
                },
                icon: Icon(Icons.arrow_forward))
          ],
        ),
        body: Container(
          child: Center(
            child: BlocBuilder<SecondCubit, int>(
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
            BlocProvider.of<SecondCubit>(context).increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
