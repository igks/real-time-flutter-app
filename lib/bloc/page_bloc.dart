import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:real_time_demo/menu.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial()) {
    on<ToMenu>((event, emit) {
      emit(OnMenuPage());
    });
    on<ToClient>((event, emit) {
      emit(OnClientPage());
    });
    on<ToServer>((event, emit) {
      emit(OnServerPage());
    });
  }
}
