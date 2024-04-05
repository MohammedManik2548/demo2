

abstract class GitUserState{
  final items;
  GitUserState(this.items);
}

class GitUserInitialState extends GitUserState{
  GitUserInitialState(super.items);
}

class GitUserLoadingState extends GitUserState{
  GitUserLoadingState(super.items);
}

class GitUserLoadedState extends GitUserState{
  GitUserLoadedState({required items}) : super(items);
}
