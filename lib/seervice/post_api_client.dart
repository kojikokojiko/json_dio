import 'package:dio/dio.dart';
import 'package:json_dio/model/post.dart';
class PostsApiClient{
  Future<List<Post>?> fetchList()async{
    final dio=Dio();
    const url='https://jsonplaceholder.typicode.com/posts';
    final response =await dio.get(url);
    if(response.statusCode==200){
      try{
        final datas=response.data as List<dynamic>;
        final list=datas.map((e) => Post.fromJson(e)).toList();
        return list;

      }catch(e){
        throw e;
      }
    }
  }
}