import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_provider_example/logic/cubit/post_cubit/post_cubit.dart';
import 'package:flutter_bloc_provider_example/logic/cubit/post_cubit/post_state.dart';

class HomeScreenWithComments extends StatefulWidget {
  const HomeScreenWithComments({Key? key}) : super(key: key);

  @override
  State<HomeScreenWithComments> createState() => _HomeScreenWithCommentsState();
}

class _HomeScreenWithCommentsState extends State<HomeScreenWithComments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("API Handling Using BLoC"),
            centerTitle: true,
          ),
          body: BlocConsumer<PostCubit, PostStates>(
            listener: (context, state) {
              if (state is PostErrorState) {
                SnackBar snackBar = SnackBar(content: Text(state.error, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              if (state is PostLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PostLoadedState) {
                return ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.posts[index].title.toString()),
                      );
                    });
              }
              return Center(child: Text("error occured"));
            },
          )),
    );
  }
}
