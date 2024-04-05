
import 'package:dio/dio.dart';
import '../model/GitHubUserModel.dart';
import '../model/Items.dart';

abstract class SearchRepository{
  Future<List<Items>> searchRepo(String query, int page);
}

class SearchRepositoryImpl extends SearchRepository{
  @override
  Future<List<Items>> searchRepo(String query, int page) async{

    try{
      final dio = Dio();
      String url = 'https://api.github.com/search/issues';

      var paramData = {
        'q':'$query',
        'page':'$page',
        'per_page':'10',
        'sort':'created',
        'order':'desc',
      };

      var response = await dio.get(url,queryParameters: paramData);

      if(response.statusCode == 200){
        var data = response.data;
        List<Items> items = GitHubUserModel.fromJson(data).items!;
        return items;
      }else{
        throw Exception('Failed');
      }

    }catch(e, l){
      print(e);
      print(l);
    }

    throw UnimplementedError();
  }

}