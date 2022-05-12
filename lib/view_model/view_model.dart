import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_dio/model/post.dart';
import 'package:json_dio/repository/repository.dart';

final repositoryProvider=Provider((ref)=>Repository());


final _currentListProvider=FutureProvider<List<Post>>((ref) async{
  final repository=ref.read(repositoryProvider);
  return await repository.fetchList();
});

final postListProvider=StateNotifierProvider<PostsController,AsyncValue<List<Post>>>((ref){
  final repo=ref.read(repositoryProvider);
  final currentList=ref.watch(_currentListProvider);
  return PostsController(repo, currentList);
});



class PostsController extends StateNotifier<AsyncValue<List<Post>>>{
  PostsController(this._repo,currentList):super(currentList);
  final Repository _repo;
}