part of 'page_bloc.dart';

@immutable
abstract class PageState extends Equatable {
  const PageState();
  @override
  List<Object> get props => [];
}

class PageInitial extends PageState {
  @override
  List<Object> get props => [];
}

class OnMenuPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnClientPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnServerPage extends PageState {
  @override
  List<Object> get props => [];
}
