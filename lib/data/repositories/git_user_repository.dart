
import 'package:dio/dio.dart';

class GitUserRepository {

  getGitUsers(int page) async{

    try{

      final dio = Dio();
      String url = 'https://api.github.com/search/issues';

      var paramData = {
        'q':'flutter',
        'page':'$page',
        'per_page':'10',
        'sort':'created',
        'order':'desc',
      };

      var response = await dio.get(url,queryParameters: paramData);
      print('response_code: ${response.statusCode}');
      if(response.statusCode == 200){

        var data = response.data;
        var list = data['items'] as List;
        // List<Items> users = GitHubUserModel.fromJson(data).items!;
        print('user_lenth ${list.length}');
        return list;

      }

    }catch(e){
      print(e);
    }

  }

}