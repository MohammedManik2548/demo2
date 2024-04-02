import 'package:dio/dio.dart';

import '../model/gitHub_rep_model/gitGub_rep_model.dart';

abstract class DetailsRepository{
  Future<List<GitHubRepoModel>> getGitRepository();
}

class DetailsRepositoryImpl extends DetailsRepository{
  @override
  Future<List<GitHubRepoModel>> getGitRepository() async{

    try{
      final dio = Dio();
      String url = 'https://api.github.com/users/sabinonweb/repos';

      var response = await dio.get(url);
      if(response.statusCode == 200){
        var data = response.data as List;
        var temp = data.map((e) => GitHubRepoModel.fromJson(e)).toList();
        return temp;
      }else{
        return [];
      }


    }catch(e, l){
      print(e);
      print(l);
    }

    return [];
  }

}