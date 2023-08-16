import '../../../data/models/PostModel.dart';

abstract class PostStates {}

class PostLoadingState extends PostStates {}

class PostLoadedState extends PostStates {
  final List<PostModel> posts;

  PostLoadedState(this.posts);
}

class PostErrorState extends PostStates {
  final String error;

  PostErrorState(this.error);
}
