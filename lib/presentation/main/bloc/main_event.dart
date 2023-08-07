part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {}

class SetBottomMenuEvent extends MainEvent {
  final BottomMenu menu;

  SetBottomMenuEvent({
    required this.menu,
  });

  @override
  List<Object?> get props => [menu];
}

class PandaEvent extends MainEvent {
  final String name;
  PandaEvent({required this.name});

  @override
  List<Object?> get props => [name];
}
