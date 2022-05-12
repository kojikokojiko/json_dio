import 'package:json_dio/seervice/post_api_client.dart';

class Repository{
  final api=PostsApiClient();
  dynamic fetchList()async{
    return await api.fetchList();
  }
}