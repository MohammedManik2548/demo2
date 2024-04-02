import '../model/GitHubUserModel.dart';
import '../model/Items.dart';
import 'package:dio/dio.dart';
abstract class GitUserRepository{
  Future<List<Items>> getGitUsers();
}

class GitUserRepositoryImpl extends GitUserRepository{
  @override
  Future<List<Items>> getGitUsers() async{

    try{

      final dio = Dio();
      String url = 'https://api.github.com/search/issues';

      var paramData = {
        'q':'Flutter',
      };

      var response = await dio.get(url,queryParameters: paramData);
      print('response_code: ${response.statusCode}');
      if(response.statusCode == 200){

        var data = response.data;
        List<Items> users = GitHubUserModel.fromJson(data).items!;
        print('user_lenth ${users.length}');
        return users;

      }else{
        return [];
      }

    }catch(e){
      print(e);
    }
    return [];
  }

}