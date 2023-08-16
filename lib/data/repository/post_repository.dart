import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_provider_example/data/models/PostModel.dart';
import 'package:flutter_bloc_provider_example/data/repository/api/api.dart';

class PostRepository {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch (exception) {
      throw exception;
    }
  }
}
