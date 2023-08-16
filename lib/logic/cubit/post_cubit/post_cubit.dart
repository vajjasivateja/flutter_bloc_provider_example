import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_provider_example/data/models/PostModel.dart';
import 'package:flutter_bloc_provider_example/logic/cubit/post_cubit/post_state.dart';

import '../../../data/repository/post_repository.dart';

class PostCubit extends Cubit<PostStates> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }

  PostRepository postRepository = PostRepository();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } on DioException catch (exception) {
      emit(PostErrorState(exception.error.toString()));
    }
  }
}
