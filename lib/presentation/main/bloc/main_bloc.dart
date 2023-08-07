import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<SetBottomMenuEvent>(_onChangeMenu);
  }

  void _onChangeMenu(SetBottomMenuEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(bottomMenu: event.menu));
  }
}

enum BottomMenu {
  home,
  category,
  profile,
}
