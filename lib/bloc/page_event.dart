part of 'page_bloc.dart';

@immutable
abstract class PageEvent extends Equatable {
  const PageEvent();
  @override
  List<Object> get props => [];
}

class ToMenu extends PageEvent {
  @override
  List<Object> get props => [];
}

class ToClient extends PageEvent {
  @override
  List<Object> get props => [];
}

class ToServer extends PageEvent {
  @override
  List<Object> get props => [];
}
