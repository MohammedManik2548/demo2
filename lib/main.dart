import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/data/repositories/details_repository.dart';
import 'package:github_users/data/repositories/git_user_repository.dart';
import 'package:github_users/ui/my_home_page.dart';

import 'bloc/details_page_bloc/details_page_bloc.dart';
import 'bloc/git_user_bloc/git_user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GitUserBloc(gitUserRepository: GitUserRepositoryImpl()),
        ),
        BlocProvider(
            create: (context) =>
                DetailsBloc(detailsRepository: DetailsRepositoryImpl())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
